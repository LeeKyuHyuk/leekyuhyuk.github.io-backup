---
layout: post
title:  "MBR(Master Boot Record)의 구조"
date:   2019-02-22 20:11:07 +0900
category: Storage
---

MBR은 저장 장치의 첫 번째 섹터(Sector)에 저장되어 있습니다. 이 첫 번째 섹터의 크기는 `512Byte`입니다.

Linux에서 `dd if=/dev/sda of=mbr.bin bs=512 count=1` 명령어를 입력하면 MBR 영역을 가져올 수 있습니다. 해당 Device(예를 들면 `/dev/sda`)가 MBR를 사용하는 저장 장치여야 합니다.

MBR은 아래와 같은 구조로 구성되어 있습니다.

- Boot Code - `440Byte`
- Disk Signature - `4Byte`
- Partition entry №1 - `16Byte`
- Partition entry №2 - `16Byte`
- Partition entry №3 - `16Byte`
- Partition entry №4 - `16Byte`
- MBR Signature - `2Byte`

![MBR(Master Boot Record) Hex Editor]({{ site.url }}/assets/image/2019-02-22-Master-Boot-Record-Structure_1.png)

'Partition entry'는 총 4개가 있습니다.  
그중 'Partition entry №1'를 해석하면 아래와 같습니다.  
![MBR(Master Boot Record) Partition Entry]({{ site.url }}/assets/image/2019-02-22-Master-Boot-Record-Structure_2.png)  

**파티션 종류 :**  
![MBR(Master Boot Record) Partition Type]({{ site.url }}/assets/image/2019-02-22-Master-Boot-Record-Structure_3.png)  

`fdisk -l /dev/sda` 명령으로 봐도 우리가 구한 Disk Signature(`0x2C7B1A9B`), Partition entry №1의 LBA 시작 주소(`0x0800`, `2048`)와 크기(`0x01FFF800`, `33552384`)가 같은 것을 확인할 수 있습니다.

![MBR(Master Boot Record) fdisk]({{ site.url }}/assets/image/2019-02-22-Master-Boot-Record-Structure_4.png)
