---
layout: post
title:  "Buildroot을 사용하여 Raspberry Pi에 나만의 리눅스를 올려보자"
date:   2017-01-04 17:39:18 +0900
category: Raspberry-Pi
---

Buildroot은 손쉽게 임베디드 리눅스 시스템을 빌드 해주는 프로그램입니다.

툴체인부터 시스템 빌드까지 모든 것을 도와줍니다.

우선 [Buildroot 다운로드 페이지](https://buildroot.org/download.html)에 접속하여 다운로드합니다.

> 이 글은 `buildroot-2016.11` 버전을 기준으로 작성되었습니다.

아래의 명령어로 압축을 풀어준 뒤 buildroot 디렉터리로 이동합니다.

``` bash
tar -xvzf buildroot-2016.11.tar.gz
cd buildroot-2016.11
```

`make help`로 명령어들을 확인할 수 있으며, `make list-defconfigs`로 정의되어 있는 설정들을 볼 수 있습니다.

`make list-defconfigs`로 보면

```
  raspberrypi0_defconfig              - Build for raspberrypi0
  raspberrypi2_defconfig              - Build for raspberrypi2
  raspberrypi3_defconfig              - Build for raspberrypi3
  raspberrypi_defconfig               - Build for raspberrypi
```

위와 같은 부분이 있는데 저는 Raspberry Pi 2를 사용 중이니 `raspberrypi2_defconfig`를 사용하겠습니다.

`make raspberrypi2_defconfig`로 미리 만들어진 설정값을 사용할 수 있습니다.

여기서 끝이 아닙니다. 몇몇의 설정을 수정해줘야 합니다.

우선 `make menuconfig`를 입력하여, `System configuration > Run a getty (login prompt) after boot`로 이동합니다.

`TTY port`에 `ttyAMA0`를 입력하고, `Baudrate`는 `115200`를 선택합니다. `TERM environment variable`의 값은 `vt100` 그대로 유지합니다.

`< Exit >`로 모든 설정값을 저장합니다.

다음으로 `package/rpi-firmware/cmdline.txt`의 내용을 아래와 같이 수정합니다.

```
root=/dev/mmcblk0p2 rootwait console=ttyAMA0,115200
```

위의 작업이 완료되었으면 `make all`로 빌드를 시작합니다.

빌드가 완료되면 `output/images/sdcard.img`가 생성됩니다.

dd 명령어나 [image-usb-stick](https://github.com/abock/image-usb-stick/)를 사용하여 sdcard에 기록하고 부팅한 상태에서 `minicom`을 사용하여 확인할 수 있습니다.

``` bash
minicom -b 115200 -D /dev/ttyUSB0
```

> 초기 root 암호는 없습니다. root 암호를 설정하려면 `make menuconfig`에서 `System configuration > Root password`에서 설정하면 됩니다

> 만약 더 많은 패키지를 추가하고 싶다면 `make menuconfig`의 `Target packages`에서 설정이 가능합니다.
