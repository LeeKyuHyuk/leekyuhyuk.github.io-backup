---
layout: post
title:  "Arch Linux UEFI 설치하는 방법"
date:   2015-12-12 23:34:12 +0900
category: Linux
image:  2015-12-12-archlinux_logo.png
---

# Arch Linux 다운로드 및 파티션 설정

[https://www.archlinux.org/download/](https://www.archlinux.org/download/)에 접속하여 ArchLinux iso파일을 받아 USB나 CD에 기록한뒤 부팅합니다.

![ArchLinux UEFI Install Guide]({{ site.url }}/assets/image/2015-12-12-archlinux_1.png)

'Arch Linux archiso x86_64 UEFI USB'를 선택합니다.

![ArchLinux UEFI Install Guide]({{ site.url }}/assets/image/2015-12-12-archlinux_2.png)

`ping google.com`으로 인터넷 연결을 확인해봅니다.

`cfdisk /dev/sda`으로 파티션을 생성합니다.

라벨 타입은 GPT로 설정하고, 아래와 같이 잡아줍니다.

	Device = /dev/sda1 , Size = 150M , Type = EFI System
	Device = /dev/sda2 , Size = 원하는 “/”의 용량 , Type = Linux filesystem
	Device = /dev/sda3 , Size = 원하는 스왑 용량 , Type = Linux swap

![ArchLinux UEFI Install Guide]({{ site.url }}/assets/image/2015-12-12-archlinux_3.png)

아래 명령어로 포맷합니다.

{% highlight sh %}
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
{% endhighlight %}

그리고 swap을 만듭니다.

{% highlight sh %}
mkswap /dev/sda3
swapon /dev/sda3
{% endhighlight %}

# Arch Linux 설치

빠른 설치를 위해 `/etc/pacman.d/mirrorlist`의 내용을 모두 지우고, 아래와 같이 수정합니다.

	## South Korea
	Server = http://ftp.kaist.ac.kr/ArchLinux/$repo/os/$arch
	Server = http://mirror.premi.st/archlinux/$repo/os/$arch

아래 명령어로 설치를 시작합니다.

{% highlight sh %}
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
pacstrap /mnt base base-devel net-tools vim
{% endhighlight %}

![ArchLinux UEFI Install Guide]({{ site.url }}/assets/image/2015-12-12-archlinux_4.png)

모두 설치되었으면, `genfstab -p /mnt >> /mnt/etc/fstab`으로 fstab를 생성합니다.

# Arch Linux 설정

`arch-chroot /mnt /bin/bash`를 입력합니다.

`passwd` 명령어로 root의 암호를 설정합니다.

로케일 설정을 위해 `/etc/locale.gen`의 `ko_KR.UTF-8, en_US.UTF-8` 주석을 제거한 뒤, `locale-gen`을 실행합니다.

아래 명령어로 `dhcpcd`를 활성화 합니다.
`systemctl enable dhcpcd`

# GRUB 설치

{% highlight sh %}
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch --recheck
grub-mkconfig -o /boot/grub/grub.cfg
{% endhighlight %}

# .bashrc 설정
`~/.bashrc`에 아래와 같이 추가해서 사용하면 편리합니다.

{% highlight sh %}
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
export LC_ALL=ko_KR.UTF-8
export LANG=ko_KR.UTF-8
{% endhighlight %}
