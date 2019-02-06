---
layout: post
title:  "Raspberry Pi Boot Sequence"
date:   2019-02-06 21:58:07 +0900
category: Raspberry-Pi
---

#### Step 1) Read OTP

전원을 켜면 Raspberry Pi에서는 유효한 Boot Mode가 활성화되었는지 결정하기 위해 OTP를 읽습니다.  
Boot ROM은 OTP 비트가 `1`인지 확인하고 다음 단계로 넘어갑니다.

#### Step 2) Read `bootcode.bin`

Boot ROM은 `bootcode.bin`이라는 파일을 찾습니다.  
`bootcode.bin` 파일을 찾으면 코드를 Local 128K Cache에 올리고, 코드를 실행(Jump)합니다.
아래는 Boot Mode Process 입니다:

- 2837 boots
- Boot ROM에서 OTP를 읽어 활성화된 Boot Mode를 읽습니다.
- `program_gpio_bootmode`를 사용하여 GPIO 22~26또는 29~43을 읽어서 기본 값이 `0`(low)인지 확인하여 일부 모드를 비활성화 합니다.
  - `0`(low)이면, SD1, SD2, NAND, SPI, USB 각각에 대해 해당 Boot Mode를 비활성화 합니다.
  - `1`(HIGH)이면, 부팅모드가 활성화됩니다.
    - 하지만 OTP에서 아직 활성화되지 않은 Boot Mode를 활성화 할 수는 없습니다)
  - If enabled: Primary SDCard에서 `bootcode.bin`를 확인 (GPIO 48~53)
    - Success - Boot
    - Fail - Timeout (5초)
  - If enabled: Secondary SDCard에서 `bootcode.bin`를 확인
    - Success - Boot
    - Fail - Timeout (5초)
  - If enabled: NAND 확인
  - If enabled: SPI 확인
  - If enabled: USB 확인

#### Step 3) Read `config.txt`

`config.txt`에서 설정 값을 읽어옵니다.

#### Step 4) Read `start.elf`

`start.elf`를 실행하여, CPU 코어들을 활성화합니다.

#### Step 5) Read Kernel File

**Step 4**에서 CPU 코어들이 활성화 되면, Kernel Image를 읽어 실행합니다.
