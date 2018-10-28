#!/bin/sh

export CONFIG_HOST=`echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/'`
export CONFIG_TARGET="arm-linux-gnueabi"
export PARALLEL_JOBS=`cat /proc/cpuinfo | grep cores | wc -l`
export WORKSPACE_DIR=`pwd`
export PATH="$WORKSPACE_DIR/tools/bin:${PATH}"

# Step 1. Download Source code
wget -c https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz
wget -c https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
wget -c https://ftp.gnu.org/gnu/glibc/glibc-2.28.tar.xz
wget -c https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
wget -c https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
wget -c https://ftp.gnu.org/gnu/mpfr/mpfr-4.0.1.tar.xz
wget -c https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.tar.xz

# Step 2. Build GNU Binutils
tar xvJf binutils-2.31.1.tar.xz
cd binutils-2.31.1
./configure \
  --build=$CONFIG_HOST \
  --host=$CONFIG_HOST \
  --target=$CONFIG_TARGET \
  --prefix=$WORKSPACE_DIR/tools \
  --disable-werror
make -j$PARALLEL_JOBS
make -j$PARALLEL_JOBS install
../tools/bin/$CONFIG_TARGET-as -version
cd ..

# Step 3. Build GNU GCC
tar xvJf gcc-8.2.0.tar.xz
mkdir -p gcc-8.2.0/gcc-build
cd gcc-8.2.0
tar xvJf ../gmp-6.1.2.tar.xz
mv gmp-6.1.2 gmp
tar xvzf ../mpc-1.1.0.tar.gz
mv mpc-1.1.0 mpc
tar xvJf ../mpfr-4.0.1.tar.xz
mv mpfr-4.0.1 mpfr
sed -i "s/vec.o input.o version.o hash-table.o ggc-none.o memory-block.o \\\/vec.o input.o version.o hash-table.o ggc-none.o memory-block.o/g" gcc/Makefile.in
sed -i "/selftest.o selftest-diagnostic.o/d" gcc/Makefile.in
sed -i "s/hash-table.o file-find.o spellcheck.o selftest.o/hash-table.o file-find.o spellcheck.o/g" gcc/Makefile.in
sed -i "s/all.internal: start.encap rest.encap doc selftest/all.internal: start.encap rest.encap doc/g" gcc/Makefile.in
sed -i "s/libgcc-support lang.all.cross doc selftest @GENINSRC@ srcextra/libgcc-support lang.all.cross doc @GENINSRC@ srcextra/g" gcc/Makefile.in
sed -i "/GCC's selftests.\/,\/^Recompile all the language-independent object files/d" gcc/Makefile.in
sed -i "s/collect-utils.o file-find.o hash-table.o selftest.o/collect-utils.o file-find.o hash-table.o/g" gcc/Makefile.in
cd gcc-build
../configure \
  --build=$CONFIG_HOST \
  --host=$CONFIG_HOST \
  --target=$CONFIG_TARGET \
  --prefix=$WORKSPACE_DIR/tools \
  --enable-shared \
  --disable-static \
  --enable-languages=c \
  --disable-werror
make -j$PARALLEL_JOBS all-gcc
make -j$PARALLEL_JOBS install-gcc
../../tools/bin/$CONFIG_TARGET-gcc -v
cd ../..

# Step 4. Install Linux Kernel Headers
tar xvJf linux-4.19.tar.xz
cd linux-4.19
make -j$PARALLEL_JOBS ARCH=arm INSTALL_HDR_PATH=$WORKSPACE_DIR/tools/$CONFIG_TARGET headers_install
ls ../tools/$CONFIG_TARGET/include
cd ..

# Step 5. Build Standard C Library Headers and C Startup(CRT) Files
tar xvJf glibc-2.28.tar.xz
mkdir -p glibc-2.28/glibc-build
cd glibc-2.28/glibc-build
../configure \
  CC=$CONFIG_TARGET-gcc \
  LD=$CONFIG_TARGET-ld \
  --build=$CONFIG_HOST \
  --host=$CONFIG_TARGET \
  --target=$CONFIG_TARGET \
  --prefix=$WORKSPACE_DIR/tools/$CONFIG_TARGET \
  --with-headers=$WORKSPACE_DIR/tools/$CONFIG_TARGET/include \
  libc_cv_forced_unwind=yes
make -j$PARALLEL_JOBS install-bootstrap-headers=yes install-headers
make -j$PARALLEL_JOBS csu/subdir_lib
install -v csu/crt1.o csu/crti.o csu/crtn.o ../../tools/$CONFIG_TARGET/lib
$CONFIG_TARGET-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o ../../tools/$CONFIG_TARGET/lib/libc.so
mkdir -p ../../tools/$CONFIG_TARGET/include/gnu
touch ../../tools/$CONFIG_TARGET/include/gnu/stubs.h
cd ../..

# Step 6. Build libgcc (Compiler Support Library)
cd gcc-8.2.0/gcc-build
make -j$PARALLEL_JOBS all-target-libgcc
make -j$PARALLEL_JOBS install-target-libgcc
cd ../..

# Step 7. Build Standard C Library
cd glibc-2.28/glibc-build
make -j$PARALLEL_JOBS
make -j$PARALLEL_JOBS install
