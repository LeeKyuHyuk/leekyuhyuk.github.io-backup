---
layout: post
title:  "How to build ARM Linux Kernel & Simple RAMDisk"
date:   2018-10-27 16:20:00 +0900
category: Linux
---

# Build Cross Compiler

> **크로스 컴파일러(Cross Compiler)**는 컴파일러가 실행되는 플랫폼이 아닌 다른 플랫폼에서 실행 가능한 코드를 생성할 수 있는 컴파일러이다.  
> 크로스 컴파일러 툴은 임베디드 시스템 혹은 여러 플랫폼에서 실행파일을 생성하는데 사용된다.  
> 이것은 운영 체제를 지원하지 않는 마이크로컨트롤러와 같이 컴파일이 실현 불가능한 플랫폼에 컴파일하는데 사용된다.  
> 이것은 시스템이 사용하는데 하나 이상의 플랫폼을 쓰는 반가상화에 이 도구를 사용하는 것이 더 일반적이게 되었다.  
> [Wikipedia - 크로스 컴파일러](https://ko.wikipedia.org/wiki/크로스_컴파일러)

![GNU GCC Cross Compiler]({{ site.url }}/assets/image/2018-10-27-How-to-build-ARM-Linux-Kernel-and-Simple-RAMDisk_1.png)  
Picture Source : *[Preshing on Programming - How to Build a GCC Cross-Compiler
](https://preshing.com/20141119/how-to-build-a-gcc-cross-compiler)*

## Step 1. Download Source code

```
$ wget https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz
$ wget https://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
$ wget https://ftp.gnu.org/gnu/glibc/glibc-2.28.tar.xz
$ wget https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
$ wget https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
$ wget https://ftp.gnu.org/gnu/mpfr/mpfr-4.0.1.tar.xz
$ wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.tar.xz
```

## Step 2. Build GNU Binutils

> GNU 바이너리 유틸리티(GNU Binary Utilities) 또는 GNU Binutils는 여러 종류의 오브젝트 파일 형식들을 조작하기 위한 프로그래밍 도구 모음이다.  
> [Wikipedia - GNU 바이너리 유틸리티](https://ko.wikipedia.org/wiki/GNU_바이너리_유틸리티)

```
$ export CONFIG_HOST=`echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/'`
$ export PATH="/home/leekyuhyuk/workspace/tools/bin:${PATH}"
$ tar xvJf binutils-2.31.1.tar.xz
$ cd binutils-2.31.1
$ ./configure \
  --build=$CONFIG_HOST \
  --host=$CONFIG_HOST \
  --target=arm-linux-gnueabi \
  --prefix=/home/leekyuhyuk/workspace/tools \
  --disable-werror
$ make
$ make install
$ ../tools/bin/arm-linux-gnueabi-as -version
  GNU assembler (GNU Binutils) 2.31.1
  Copyright (C) 2018 Free Software Foundation, Inc.
  This program is free software; you may redistribute it under the terms of
  the GNU General Public License version 3 or later.
  This program has absolutely no warranty.
  This assembler was configured for a target of `arm-linux-gnueabi'.
$ cd ..
```

- `export CONFIG_HOST=echo ${MACHTYPE} | sed -e 's/-[^-]*/-cross/'` : `CONFIG_HOST`에 Host 시스템을 저장합니다.
  - `echo ${MACHTYPE}`를 하면, 현재 사용하는 Host의 정보가 나오게 됩니다. `sed -e 's/-[^-]*/-cross/'`를 추가하여 `${MACHTYPE}`값에 `cross`라는 문자를 추가한 것을 `CONFIG_HOST`에 넣은 것입니다.
- `export PATH="/home/leekyuhyuk/workspace/tools/bin:${PATH}"` : 환경변수 `PATH`에 `/home/leekyuhyuk/workspace/tools/bin`를 추가합니다.
  - `PATH`에 추가한 경로에 있는 실행파일을 어디서든지 바로 사용할 수 있습니다.
- `--build` : 컴파일하고 있는 시스템
- `--host` : 컴파일해서 만들어진 바이너리가 실행되는 시스템
- `--target`: 컴파일해서 만들어진 바이너리가 만들어내는 바이너리가 실행되는 시스템
- `--prefix` : PREFIX에 binutils를 설치합니다.
  - 원하는 경로를 입력하면 됩니다. 저는 `/home/leekyuhyuk/workspace/tools`로 입력하였습니다.
- `--disable-werror` : Host의 Compiler으로부터 Warning이 있어도 빌드가 중지되지 않습니다.

## Step 3. Build GNU GCC

```
$ tar xvJf gcc-8.2.0.tar.xz
$ mkdir -p gcc-8.2.0/gcc-build
$ cd gcc-8.2.0
$ tar xvJf ../gmp-6.1.2.tar.xz
$ mv gmp-6.1.2 gmp
$ tar xvzf ../mpc-1.1.0.tar.gz
$ mv mpc-1.1.0 mpc
$ tar xvJf ../mpfr-4.0.1.tar.xz
$ mv mpfr-4.0.1 mpfr
$ sed -i "s/vec.o input.o version.o hash-table.o ggc-none.o memory-block.o \\\/vec.o input.o version.o hash-table.o ggc-none.o memory-block.o/g" gcc/Makefile.in
$ sed -i "/selftest.o selftest-diagnostic.o/d" gcc/Makefile.in
$ sed -i "s/hash-table.o file-find.o spellcheck.o selftest.o/hash-table.o file-find.o spellcheck.o/g" gcc/Makefile.in
$ sed -i "s/all.internal: start.encap rest.encap doc selftest/all.internal: start.encap rest.encap doc/g" gcc/Makefile.in
$ sed -i "s/libgcc-support lang.all.cross doc selftest @GENINSRC@ srcextra/libgcc-support lang.all.cross doc @GENINSRC@ srcextra/g" gcc/Makefile.in
$ sed -i "/GCC's selftests.\/,\/^Recompile all the language-independent object files/d" gcc/Makefile.in
$ sed -i "s/collect-utils.o file-find.o hash-table.o selftest.o/collect-utils.o file-find.o hash-table.o/g" gcc/Makefile.in
$ cd gcc-build
$ ../configure \
  --build=$CONFIG_HOST \
  --host=$CONFIG_HOST \
  --target=arm-linux-gnueabi \
  --prefix=/home/leekyuhyuk/workspace/tools \
  --enable-shared \
  --disable-static \
  --enable-languages=c \
  --disable-werror
$ make all-gcc
$ make install-gcc
$ ../../tools/bin/arm-linux-gnueabi-gcc -v
  Using built-in specs.
  COLLECT_GCC=../tools/bin/arm-linux-gnueabi-gcc
  COLLECT_LTO_WRAPPER=/home/leekyuhyuk/workspace/tools/libexec/gcc/arm-linux-gnueabi/8.2.0/lto-wrapper
  Target: arm-linux-gnueabi
  Configured with: ./configure --build=x86_64-cross-linux-gnu --host=x86_64-cross-linux-gnu --target=arm-linux-gnueabi --prefix=/home/leekyuhyuk/workspace/tools --enable-shared --disable-static --enable-languages=c --disable-werror
  Thread model: posix
  gcc version 8.2.0 (GCC)
$ cd ../..
```

- GCC를 빌드 할 때 GMP, MPC, MPFR이 필요하여 GCC 소스코드에 압축을 풀어주었습니다.
- GCC 빌드 과정에 selftest 단계가 있는데, Cross Compiler 빌드 시 문제가 되어 `sed` 명령을 사용하여 패치하였습니다.

## Step 4. Install Linux Kernel Headers

```
$ tar xvJf linux-4.19.tar.xz
$ cd linux-4.19
$ make ARCH=arm INSTALL_HDR_PATH=/home/leekyuhyuk/workspace/tools/arm-linux-gnueabi headers_install
$ ls ../tools/arm-linux-gnueabi/include
  asm  asm-generic  drm  linux  misc  mtd  rdma  scsi  sound  video  xen
$ cd ..
```

- `ARCH` : Target의 System Architecture을 설정합니다.
- `INSTALL_HDR_PATH` : Linux Kernel Header가 설치될 위치를 설정합니다.

## Step 5. Build Standard C Library Headers and C Startup(CRT) Files

Glibc의 Standard C Libery Header와 C Startup(CRT) 파일을 빌드 합니다.

> GNU C 라이브러리는, 일반적으로 glibc로 알려진, GNU 프로젝트가 C 표준 라이브러리를 구현한 것이다.  
> [Wikipedia - GNU C 라이브러리](https://ko.wikipedia.org/wiki/GNU_C_라이브러리)

```
$ tar xvJf glibc-2.28.tar.xz
$ mkdir -p glibc-2.28/glibc-build
$ cd glibc-2.28/glibc-build
$ ../configure \
  CC=arm-linux-gnueabi-gcc \
  LD=arm-linux-gnueabi-ld \
  --build=$CONFIG_HOST \
  --host=arm-linux-gnueabi \
  --target=arm-linux-gnueabi \
  --prefix=/home/leekyuhyuk/workspace/tools/arm-linux-gnueabi \
  --with-headers=/home/leekyuhyuk/workspace/tools/arm-linux-gnueabi/include \
  libc_cv_forced_unwind=yes
$ make install-bootstrap-headers=yes install-headers
$ make csu/subdir_lib
$ install -v csu/crt1.o csu/crti.o csu/crtn.o ../../tools/arm-linux-gnueabi/lib
$ arm-linux-gnueabi-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o ../../tools/arm-linux-gnueabi/lib/libc.so
$ mkdir -p ../../tools/arm-linux-gnueabi/include/gnu
$ touch ../../tools/arm-linux-gnueabi/include/gnu/stubs.h
$ cd ../..
```

- `CC=arm-linux-gnueabi-gcc` : C Compiler를 `arm-linux-gnueabi-gcc`로 사용합니다.
- `LD=arm-linux-gnueabi-ld` : Linker를 `arm-linux-gnueabi-gcc`로 사용합니다.
- `--with-headers` : Linux Kernel Header가 설치되어 있는 경로를 입력합니다.
- 'Step 2. Build GNU Binutils'에서 빌드 된 Linker는 Glibc가 설치될 때까지 사용할 수 없습니다.  
이로 인해 glibc 빌드 시 force-unwind 지원에 대한 configure test가 실패하게 됩니다.  
`libc_cv_forced_unwind=yes`로 configure test를 진행하지 않고 force-unwind를 사용할 수 있음을 configure에 알리기 위해 사용됩니다.

## Step 6. Build libgcc (Compiler Support Library)

```
$ cd gcc-8.2.0/gcc-build
$ make all-target-libgcc
$ make install-target-libgcc
$ cd ../..
```

## Step 7. Build Standard C Library

Glibc의 Standard C Libery를 빌드 합니다.

```
$ cd glibc-2.28/glibc-build
$ make
$ make install
```

## Build Cross Compiler Script

위의 내용을 Shell Script로 만들어 놓았습니다.  
타이핑하기 힘든 경우에는 아래의 스크립트를 사용하면 됩니다.  
[📎 'build-cross-compiler.sh' 다운로드]({{ site.url }}/assets/file/2018-10-27-build-cross-compiler.sh)

```
$ chmod +x ./2018-10-27-build-cross-compiler.sh
$ ./2018-10-27-build-cross-compiler.sh
```

# Build ARM Linux Kernel

```
$ export PATH="/home/leekyuhyuk/workspace/tools/bin:${PATH}"
$ cd linux-4.19
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- mrproper
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- vexpress_defconfig
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- zImage dtbs
$ cd ..
```

# Create RAMDisk

```
$ export PATH="/home/leekyuhyuk/workspace/tools/bin:${PATH}"
$ mkdir ramdisk
$ cd ramdisk
$ cat << "EOF" > init.c
#include <stdio.h>

void main() {
  printf("====================================================\n");
  printf("Hello World!\n");
  printf("https://kyuhyuk.kr/article/linux/2018/10/27/How-to-build-ARM-Linux-Kernel-and-Simple-RAMDisk\n");
  printf("====================================================\n");
  while(1);
}
EOF
$ arm-linux-gnueabi-gcc -static init.c -o init
$ echo init | cpio -o --format=newc > ../initramfs.cpio
$ cd ..
```

# Using QEMU to emulate a ARM Linux

```
$ qemu-system-arm \
  -M vexpress-a9 \
  -cpu cortex-a9 \
  -m 128M \
  -kernel linux-4.19/arch/arm/boot/zImage \
  -dtb linux-4.19/arch/arm/boot/dts/vexpress-v2p-ca9.dtb \
  -initrd initramfs.cpio \
  -append "root=/dev/ram rdinit=/init console=ttyAMA0" \
  -serial stdio
```
