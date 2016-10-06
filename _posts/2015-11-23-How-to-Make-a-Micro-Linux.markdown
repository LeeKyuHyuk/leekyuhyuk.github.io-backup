---
layout: post
title:  "Busybox를 사용하여 작은 리눅스를 만들어보자!"
date:   2015-11-23 19:30:01 +0900
category: Linux
---

이 문서는 [Busybox](https://www.busybox.net)를 사용하여 작은 리눅스 시스템을 만드는 방법 설명하고 있습니다.

**소스 코드**: 소스 코드는 [LeeKyuHyuk/How-to-Make-a-Micro-Linux](https://github.com/LeeKyuHyuk/How-to-Make-a-Micro-Linux)의 [src](https://github.com/LeeKyuHyuk/How-to-Make-a-Micro-Linux/tree/master/src) 폴더에 있습니다. 각 단계는 다른 관련 파일에 대한 링크가 포함됩니다.

**기여하기**: 이 강좌는 누구나 참여가 가능합니다. 이 문서에 문제가 있다면 [LeeKyuHyuk/How-to-Make-a-Micro-Linux](https://github.com/LeeKyuHyuk/How-to-Make-a-Micro-Linux)에 pull-request 해주시기 바랍니다.

![Screen](https://github.com/LeeKyuHyuk/How-to-Make-a-Micro-Linux/raw/master/preview.png)

#### 1장: BusyBox 소개와 준비물

##### **BusyBox는 무엇인가요?**

> BusyBox은 여러가지 유닉스 도구들을 하나의 실행파일로 만들어놓은 소프트웨어 입니다.
>
> 출처: [Wikipedia - BusyBox](https://en.wikipedia.org/wiki/BusyBox)

##### **BusyBox에서 지원하는 명령어**

`[`, `[[`, `acpid`, `addgroup`, `adduser`, `adjtimex`, `ar`, `arp`, `arping`, `ash`, `awk`, `basename`, `beep`, `blkid`, `brctl`, `bunzip2`, `bzcat`, `bzip2`, `cal`, `cat`, `catv`, `chat`, `chattr`, `chgrp`, `chmod`, `chown`, `chpasswd`, `chpst`, `chroot`, `chrt`, `chvt`, `cksum`, `clear`, `cmp`, `comm`, `cp`, `cpio`, `crond`, `crontab`, `cryptpw`, `cut`, `date`, `dc`, `dd`, `deallocvt`, `delgroup`, `deluser`, `depmod`, `devmem`, `df`, `dhcprelay`, `diff`, `dirname`, `dmesg`, `dnsd`, `dnsdomainname`, `dos2unix`, `dpkg`, `du`, `dumpkmap`, `dumpleases`, `echo`, `ed`, `egrep`, `eject`, `env`, `envdir`, `envuidgid`, `expand`, `expr`, `fakeidentd`, `false`, `fbset`, `fbsplash`, `fdflush`, `fdformat`, `fdisk`, `fgrep`, `find`, `findfs`, `flash_lock`, `flash_unlock`, `fold`, `free`, `freeramdisk`, `fsck`, `fsck.minix`, `fsync`, `ftpd`, `ftpget`, `ftpput`, `fuser`, `getopt`, `getty`, `grep`, `gunzip`, `gzip`, `hd`, `hdparm`, `head`, `hexdump`, `hostid`, `hostname`, `httpd`, `hush`, `hwclock`, `id`, `ifconfig`, `ifdown`, `ifenslave`, `ifplugd`, `ifup`, `inetd`, `init`, `inotifyd`, `insmod`, `install`, `ionice`, `ip`, `ipaddr`, `ipcalc`, `ipcrm`, `ipcs`, `iplink`, `iproute`, `iprule`, `iptunnel`, `kbd_mode`, `kill`, `killall`, `killall5`, `klogd`, `last`, `length`, `less`, `linux32`, `linux64`, `linuxrc`, `ln`, `loadfont`, `loadkmap`, `logger`, `login`, `logname`, `logread`, `losetup`, `lpd`, `lpq`, `lpr`, `ls`, `lsattr`, `lsmod`, `lzmacat`, `lzop`, `lzopcat`, `makemime`, `man`, `md5sum`, `mdev`, `mesg`, `microcom`, `mkdir`, `mkdosfs`, `mkfifo`, `mkfs.minix`, `mkfs.vfat`, `mknod`, `mkpasswd`, `mkswap`, `mktemp`, `modprobe`, `more`, `mount`, `mountpoint`, `mt`, `mv`, `nameif`, `nc`, `netstat`, `nice`, `nmeter`, `nohup`, `nslookup`, `od`, `openvt`, `passwd`, `patch`, `pgrep`, `pidof`, `ping`, `ping6`, `pipe_progress`, `pivot_root`, `pkill`, `popmaildir`, `printenv`, `printf`, `ps`, `pscan`, `pwd`, `raidautorun`, `rdate`, `rdev`, `readlink`, `readprofile`, `realpath`, `reformime`, `renice`, `reset`, `resize`, `rm`, `rmdir`, `rmmod`, `route`, `rpm`, `rpm2cpio`, `rtcwake`, `run-parts`, `runlevel`, `runsv`, `runsvdir`, `rx`, `script`, `scriptreplay`, `sed`, `sendmail`, `seq`, `setarch`, `setconsole`, `setfont`, `setkeycodes`, `setlogcons`, `setsid`, `setuidgid`, `sh`, `sha1sum`, `sha256sum`, `sha512sum`, `showkey`, `slattach`, `sleep`, `softlimit`, `sort`, `split`, `start-stop-daemon`, `stat`, `strings`, `stty`, `su`, `sulogin`, `sum`, `sv`, `svlogd`, `swapoff`, `swapon`, `switch_root`, `sync`, `sysctl`, `syslogd`, `tac`, `tail`, `tar`, `taskset`, `tcpsvd`, `tee`, `telnet`, `telnetd`, `test`, `tftp`, `tftpd`, `time`, `timeout`, `top`, `touch`, `tr`, `traceroute`, `true`, `tty`, `ttysize`, `udhcpc`, `udhcpd`, `udpsvd`, `umount`, `uname`, `uncompress`, `unexpand`, `uniq`, `unix2dos`, `unlzma`, `unlzop`, `unzip`, `uptime`, `usleep`, `uudecode`, `uuencode`, `vconfig`, `vi`, `vlock`, `volname`, `watch`, `watchdog`, `wc`, `wget`, `which`, `who`, `whoami`, `xargs`, `yes`, `zcat`, `zcip`

##### **Micro Linux를 만들기 위한 준비물:**

- BusyBox [https://www.busybox.net](https://www.busybox.net)
- Linux Kernel [https://www.kernel.org](https://www.kernel.org)
- Syslinux [https://www.kernel.org/pub/linux/utils/boot/syslinux](https://www.kernel.org/pub/linux/utils/boot/syslinux)

#### 2장: 커널과 BusyBox 빌드

##### **소스코드 다운로드**

```bash
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.8.tar.xz
wget http://busybox.net/downloads/busybox-1.25.0.tar.bz2
tar -xf linux-4.8.tar.xz
tar -xf busybox-1.25.0.tar.bz2
```

##### **커널 설정**

```bash
cd linux-4.8
make mrproper
make defconfig
```

HOSTNAME을 설정합니다.

```bash
sed -i "s/.*CONFIG_DEFAULT_HOSTNAME.*/CONFIG_DEFAULT_HOSTNAME=\""$(HOSTNAME)"\"/" .config
```

##### **커널 빌드**

```bash
make bzImage
```

##### **BusyBox 설정**

```bash
cd busybox-1.25.0
make clean
make defconfig
sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config
```

##### **BusyBox 설치**

```bash
make busybox
make install
```

#### 3장: 루트 파일시스템 구축

`rootfs` 폴더를 생성하고 BusyBox를 복사한 뒤 `linuxrc` 파일을 삭제합니다.

```bash
mkdir rootfs
cp -R busybox-1.25.0/_install/* rootfs
cd rootfs
rm -f linuxrc
```

`dev`, `etc`, `proc`, `root`, `src`, `sys`, `tmp` 폴더를 생성하고 `tmp` 폴더에 권한을 부여합니다.

```bash
mkdir dev etc proc root src sys tmp
chmod 1777 tmp
```

`etc/bootscript.sh`를 생성하고 권한을 부여합니다.

```bash
cat > etc/bootscript.sh << "EOF"
#!/bin/sh
dmesg -n 1
mount -t devtmpfs none /dev
mount -t proc none /proc
mount -t sysfs none /sys

for DEVICE in /sys/class/net/* ; do
    ip link set \${DEVICE##*/} up
    [ \${DEVICE##*/} != lo ] && udhcpc -b -i \${DEVICE##*/} -s /etc/rc.dhcp
done
EOF
chmod +x etc/bootscript.sh
```

`etc/inittab`를 생성합니다.

```bash
cat > etc/inittab << "EOF"
::sysinit:/etc/bootscript.sh
::restart:/sbin/init
::ctrlaltdel:/sbin/reboot
::once:cat /etc/welcome.txt
::respawn:/bin/cttyhack /bin/sh
tty2::once:cat /etc/welcome.txt
tty2::respawn:/bin/sh
tty3::once:cat /etc/welcome.txt
tty3::respawn:/bin/sh
tty4::once:cat /etc/welcome.txt
tty4::respawn:/bin/sh
EOF
```

`etc/rc.dhcp`를 생성하고 권한을 부여합니다.

```bash
cat > etc/rc.dhcp << "EOF"
ip addr add \$ip/\$mask dev \$interface

if [ "\$router" ]; then
  ip route add default via \$router dev \$interface
fi
EOF
chmod +x etc/rc.dhcp
```

`etc/welcome.txt`를 생성합니다.

```bash
cat > etc/welcome.txt << "EOF"
####################
#    Micro Linux   #
####################
EOF
```

`init`를 생성하고 권한을 부여합니다.

```bash
cat > init << "EOF"
#!/bin/sh
exec /sbin/init
EOF
chmod +x init
```

`rootfs.gz` 파일로 루트 파일시스템을 묶어줍니다.

```bash
find . | cpio -R root:root -H newc -o | gzip > ../rootfs.gz
```

#### 4장: ISO 이미지 파일 생성

`isoimage` 폴더를 생성합니다.

```bash
mkdir isoimage
```

2장에서 만든 커널을 `isoimage` 폴더로 복사합니다.
```bash
cp linux-4.8/arch/x86/boot/bzImage isoimage/kernel.gz
```

3장에서 만든 `rootfs.gz` 파일을 `isoimage` 폴더로 이동합니다.

```bash
mv rootfs.gz isoimage
```

'Syslinux'의 소스 코드를 다운로드해 압축을 해제하고 `isolinux.bin`, `ldlinux.c32` 파일을 `isoimage` 폴더로 복사합니다.

```bash
wget https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-6.03.tar.xz
tar -xf syslinux-6.03.tar.xz
cp syslinux-6.03/bios/core/isolinux.bin isoimage
cp syslinux-6.03/bios/com32/elflink/ldlinux/ldlinux.c32 isoimage
```

아래의 명령어로 ISO 이미지 파일을 생성합니다.

```bash
cd isoimage
echo 'default kernel.gz initrd=rootfs.gz' > isolinux.cfg
genisoimage \
  -J \
  -r \
  -o ../MicroLinux.iso \
  -b isolinux.bin \
  -c boot.cat \
  -input-charset UTF-8 \
  -no-emul-boot \
  -boot-load-size 4 \
  -boot-info-table \
  -joliet-long \
  ./
```

#### 5장: QEMU에서 MicroLinux 부팅

```bash
qemu-system-x86_64 -cdrom MicroLinux.iso
```

![Screen](https://github.com/LeeKyuHyuk/How-to-Make-a-Micro-Linux/raw/master/Chapter-5/preview.gif)
