---
layout: post
title:  "Busybox 기반의 작은 리눅스를 만들어 라즈베리 파이에서 부팅하기"
date:   2016-07-08 09:31:48 +0900
category: Raspberry-Pi
---

## 준비물
* Ubuntu 16.04
* [Raspberry Pi 2 Model B](https://www.raspberrypi.org/products/raspberry-pi-2-model-b/)
* [PL2303TA USB to TTL Serial Cable](http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=1477244639)
* 128mb 이상의 microSD 메모리 카드


## 패키지 설치

`gcc-arm-linux-gnueabihf`, `kpartx`패키지를 설치합니다.

`$ sudo apt install gcc-arm-linux-gnueabihf kpartx`

## 이미지 파일, 파티션 생성

100MB 크기의 이미지 파일을 생성합니다.

`$ dd if=/dev/zero of=rpi.img bs=1024 count=0 seek=$[1024*100]`

`rpi.img`에 파티션을 생성합니다.

`$ fdisk rpi.img`

1. <kbd>o</kbd>를 입력하여 새로운 파티션 테이블을 생성합니다.
2. <kbd>p</kbd>를 입력하여 파티션 테이블을 출력합니다.
3. <kbd>n</kbd> → <kbd>p</kbd> → <kbd>1</kbd> → <kbd>Enter</kbd> → `+20M`을 입력한 뒤 <kbd>Enter</kbd>
4. <kbd>t</kbd> → <kbd>c</kbd>를 하여 첫번째 파티션을 W95 FAT32 (LBA) 타입으로 설정합니다.
5. <kbd>n</kbd> → <kbd>p</kbd> → <kbd>2</kbd> → <kbd>Enter</kbd> → <kbd>Enter</kbd>
6. <kbd>w</kbd>를 입력하여 수정한 내용을 기록합니다.

파티션을 포맷하고 마운트 합니다.

`$ sudo kpartx -av rpi.img`

`$ mkdir -p rpi/boot rpi/root`

`$ sudo mkfs.vfat /dev/mapper/loop0p1`

`$ sudo mkfs.ext4 /dev/mapper/loop0p2`

`$ sudo mount /dev/mapper/loop0p1 rpi/boot`

`$ sudo mount /dev/mapper/loop0p2 rpi/root`

## 리눅스 커널 빌드

`$ git clone --depth=1 https://github.com/raspberrypi/linux.git`

`$ cd linux`

`$ KERNEL=kernel7`

`$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mrproper`

`$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig`

`$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs`

> 아래의 '/home/leekyuhyuk/rpi' 부분은 알맞은 경로로 수정하여 사용합니다.

`$ sudo make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=/home/leekyuhyuk/rpi/root modules_install`

`$ sudo scripts/mkknlimg arch/arm/boot/zImage /home/leekyuhyuk/rpi/boot/$KERNEL.img`

`$ sudo cp arch/arm/boot/dts/*.dtb /home/leekyuhyuk/rpi/boot/`

`$ sudo mkdir /home/leekyuhyuk/rpi/boot/overlays`

`$ sudo cp arch/arm/boot/dts/overlays/*.dtb* /home/leekyuhyuk/rpi/boot/overlays/`

`$ sudo cp arch/arm/boot/dts/overlays/README /home/leekyuhyuk/rpi/boot/overlays/`

`$ cd ..`

`$ git clone --depth=1 https://github.com/raspberrypi/firmware.git`

`$ cd firmware/boot`

`$ sudo cp bootcode.bin fixup.dat fixup_cd.dat fixup_db.dat fixup_x.dat start.elf start_cd.elf start_db.elf start_x.elf /home/leekyuhyuk/rpi/boot/`

`$ sudo vi cmdline.txt`

{% highlight text %}
dwc_otg.lpm_enable=0 console=ttyAMA0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait
{% endhighlight %}

`$ sudo vi config.txt`

{% highlight text %}
# How much memory to allocate to the GPU, minimum is 16.
gpu_mem=128

# Uncomment and set gpu_mem to 128 if you want to use the Pi camera module.
#start_x=1

# Uncomment one of the following blocks to overclock.

# None
#arm_freq=700
#core_freq=250
#sdram_freq=400
#over_voltage=0

# Modest
#arm_freq=800
#core_freq=250
#sdram_freq=400
#over_voltage=0

# Medium
#arm_freq=900
#core_freq=250
#sdram_freq=450
#over_voltage=2

# High
#arm_freq=950
#core_freq=250
#sdram_freq=450
#over_voltage=6

# Turbo
#arm_freq=1000
#core_freq=500
#sdram_freq=600
#over_voltage=6

# uncomment if you get no picture on HDMI for a default "safe" mode
#hdmi_safe=1

# uncomment this if your display has a black border of unused pixels visible
# and your display can output without overscan
#disable_overscan=1

# uncomment the following to adjust overscan. Use positive numbers if console
# goes off screen, and negative if there is too much border
#overscan_left=16
#overscan_right=16
#overscan_top=16
#overscan_bottom=16

# uncomment to force a console size. By default it will be display's size minus
# overscan.
#framebuffer_width=1280
#framebuffer_height=720

# uncomment if hdmi display is not detected and composite is being output
#hdmi_force_hotplug=1

# uncomment to force a specific HDMI mode (this will force VGA)
#hdmi_group=1
#hdmi_mode=1

# uncomment to force a HDMI mode rather than DVI. This can make audio work in
# DMT (computer monitor) modes
#hdmi_drive=2

# uncomment to increase signal to HDMI, if you have interference, blanking, or
# no display
#config_hdmi_boost=4

# uncomment for composite PAL
#sdtv_mode=2

# for more options see http://elinux.org/RPi_config.txt

# Uncomment some or all of these to enable the optional hardware interfaces
dtparam=audio=on
dtparam=random=on
#dtparam=i2c_arm=on
#dtparam=i2s=on
#dtparam=spi=on

# Uncomment this to enable the lirc-rpi module
#dtoverlay=lirc-rpi

# Uncomment this to enable Eric Anholt's DRM VC4 HDMI/HVS/V3D driver
#dtoverlay=vc4-kms-v3d

# Additional overlays and parameters are documented in /boot/overlays/README
{% endhighlight %}

## Busybox를 사용하여 파일시스템 빌드

`$ wget http://busybox.net/downloads/busybox-1.25.0.tar.bz2`

`$ tar xvf busybox-1.25.0.tar.bz2`

`$ cd busybox-1.25.0`

`$ make defconfig `

`$ make menuconfig`

**Busybox Settings** → **Build Options** 에 들어가서
`Build BusyBox as a static binary (no shared libs)`를 활성화한뒤, `Cross Compiler prefix`에 `arm-linux-gnueabihf-`를 입력합니다.

`$ make`

`$ make install`

`$ sudo cp -R _install/* /home/leekyuhyuk/rpi/root/`

`$ cd /home/leekyuhyuk/rpi/root`

`$ sudo rm linuxrc`

`$ sudo mkdir dev etc proc root src sys tmp`

`$ sudo chmod 1777 tmp`

`etc` 폴더에 `bootscript.sh` 파일을 생성하고 아래와 같은 내용을 입력해줍니다.

{% highlight sh %}
#!/bin/sh
dmesg -n 1
mount -t devtmpfs none /dev
mount -t proc none /proc
mount -t sysfs none /sys

for DEVICE in /sys/class/net/* ; do
    ip link set \${DEVICE##*/} up
    [ \${DEVICE##*/} != lo ] && udhcpc -b -i \${DEVICE##*/} -s /etc/rc.dhcp
done
{% endhighlight %}

`$ sudo chmod +x bootscript.sh`

`etc` 폴더에 `rc.dhcp` 파일을 만들어주고 아래와 같은 내용을 입력해줍니다.

{% highlight sh %}
ip addr add \$ip/\$mask dev \$interface

if [ "\$router" ]; then
  ip route add default via \$router dev \$interface
fi
{% endhighlight %}

`$ sudo chmod +x rc.dhcp`

`etc` 폴더에 `welcome.txt` 파일을 만들어주고 시스템이 가동되었을때 나타날 텍스트를 입력해줍니다.

{% highlight sh %}
####################
#    Micro Linux   #
####################
{% endhighlight %}

`etc` 폴더에 `inittab` 파일을 만들어주고 아래와 같이 내용을 입력합니다.

{% highlight sh %}
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
{% endhighlight %}

`init`라는 파일을 `root`에 생성하고 아래와 같이 내용을 입력합니다.

{% highlight sh %}
#!/bin/sh
exec /sbin/init
{% endhighlight %}

`$ sudo chmod +x init`

마운트 해제를 합니다.

`$ sudo umount boot root`

`$ sudo kpartx -dv rpi.img`

## SDCard에 기록하기

`$ wget https://raw.githubusercontent.com/abock/image-usb-stick/master/image-usb-stick`

`$ chmod +x image-usb-stick`

`$ ./image-usb-stick rpi.img`

## Putty로 확인하기

'[PL2303TA](http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=1477244639)'를 사용하여 시리얼 통신을 하였습니다.

![Busybox 기반의 작은 리눅스를 만들어 라즈베리 파이에서 부팅하기]({{ site.url }}/assets/image/2016-07-08-How-to-make-tiny-linux-for-Raspberry-Pi-2_1.png)

![Busybox 기반의 작은 리눅스를 만들어 라즈베리 파이에서 부팅하기]({{ site.url }}/assets/image/2016-07-08-How-to-make-tiny-linux-for-Raspberry-Pi-2_2.png)
