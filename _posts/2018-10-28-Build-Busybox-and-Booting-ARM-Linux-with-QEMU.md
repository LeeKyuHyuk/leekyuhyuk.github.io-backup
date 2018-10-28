---
layout: post
title:  "Build Busybox and Booting ARM Linux with QEMU"
date:   2018-10-28 15:38:12 +0900
category: Linux
---

# Build Cross Compiler & Linux Kernel

Corss Compiler와 Linux Kernel 빌드에 대한 설명은 '[How to build ARM Linux Kernel & Simple RAMDisk
](http://kyuhyuk.kr/article/linux/2018/10/27/How-to-build-ARM-Linux-Kernel-and-Simple-RAMDisk)'글에 있습니다.  
위의 글을 보고 따라 하시면 됩니다.

# Build Busybox

> 비지박스(BusyBox)는 하나의 실행 파일 안에 스트립 다운된 일부 유닉스 도구들을 제공하는 소프트웨어이다.  
> 리눅스, 안드로이드, FreeBSD와 같은 다양한 POSIX 환경에서 실행되지만 도구들 중 다수가 리눅스 커널이 제공하는 인터페이스와 함께 동작하도록 설계되어 있다.  
> 자원이 매우 적은 임베디드 운영 체제를 위해 작성되었다.
> [Wikipedia - 비지박스](https://ko.wikipedia.org/wiki/비지박스)

## Step 1. Download Source code

```
$ wget https://busybox.net/downloads/busybox-1.29.3.tar.bz2
```

## Step 2. Configure Busybox

```
$ tar xvjf busybox-1.29.3.tar.bz2
$ cd busybox-1.29.3
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- clean
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- defconfig
$ sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- busybox
$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- install
$ cd _install
$ find ./ | cpio -R root:root -H newc -o | gzip > ../../initramfs.cpio.gz
$ cd ../..
```

- `sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config` : Busybox를 Static Build 하기 위해 `.config` 파일을 수정합니다.
  - `make menuconfig`으로도 간편하게 수정 가능합니다.

# Using QEMU to emulate a ARM Linux

```
$ qemu-system-arm \
  -M vexpress-a9 \
  -cpu cortex-a9 \
  -m 128M \
  -kernel linux-4.19/arch/arm/boot/zImage \
  -dtb linux-4.19/arch/arm/boot/dts/vexpress-v2p-ca9.dtb \
  -initrd initramfs.cpio.gz \
  -append "root=/dev/ram rdinit=/bin/sh console=ttyAMA0" \
  -serial stdio
```

- `rdinit=/bin/sh` : `rdinit`는 RAMDisk에서 init 프로세스를 실행하기 위해 어떤 것을 사용할지 설정합니다.

![GNU GCC Cross Compiler]({{ site.url }}/assets/image/2018-10-28-Build-Busybox-and-Booting-ARM-Linux-with-QEMU_1.png)  
