---
layout: post
title:  "[Bare Metal] Chapter 4: GPIO를 제어해보자! (C)"
date:   2019-02-27 21:23:44 +0900
category: Raspberry-Pi
---
'[Chapter 3: GPIO를 제어해보자! (ARM Assembly)](http://kyuhyuk.kr/article/raspberry-pi/2019/02/27/Raspberry-Pi-Zero-W-Bare-Metal-Chapter-3)'에서는 ARM Assembly를 사용하여 GPIO를 제어했습니다.  
이번에는 ARM Assembly에서 C함수를 호출하여 GPIO를 제어해보도록 하겠습니다.

### Raspberry Pi Zero ACT LED Toggle

이번 장에서는 ACT LED가 계속 꺼졌다가 켜지는 것을 구현해보도록 하겠습니다.  

ARM Assembly 코드에서는 `bl main`으로 C코드에 있는 `main()` 함수를 호출합니다.
**`boot.S`:**  
```assembly
.section ".text.boot"
.globl _start

_start:
  mov sp,#0x8000   @ Stack Pointer를 Kernel이 시작하는 지점인 0x8000으로 설정합니다.
  bl main          @ C함수 중에서 main이라는 함수를 호출합니다.

.end
```

GPIO를 C로 제어하기 전에 간단한 함수를 구현하도록 하겠습니다.  
예를 들어 `GPFSEL4`에 `0x1`를 설정하기 위해서는,  

```c
*(volatile uint32_t *)GPFSEL4 = 0x1;
```

위와 같이 입력을 해야 하는데 더 간단하고 가독성 좋게 바꾸어 봅시다.  

**`macro.h`:**  
```c
#include <stddef.h>
#include <stdint.h>

// Memory-Mapped I/O output
void mmio_write(uint32_t reg, uint32_t data);

// Memory-Mapped I/O input
uint32_t mmio_read(uint32_t reg);

// Loop <delay> times in a way that the compiler won't optimize away
void delay(int32_t count);
```

**`macro.c`:**  
```c
#include "macro.h"

// Memory-Mapped I/O output
void mmio_write(uint32_t reg, uint32_t data) {
  *(volatile uint32_t *)reg = data;
}

// Memory-Mapped I/O input
uint32_t mmio_read(uint32_t reg) {
  return *(volatile uint32_t *)reg;
}
```

위와 같이 `mmio_write`와 `mmio_read`를 구현해놓으면, 아래처럼 사용이 가능합니다.

```c
mmio_write(GPFSEL4, 0x1);
mmio_read(GPFSEL4)
```

준비과정은 다 끝났습니다. 이제 `main.c`에서 GPIO를 제어해봅시다.  

**`main.c`:**  
```c
#include "macro.h"

enum {
  // Peripheral Base Address
  PERI_BASE = 0x20000000,
  // GPIO Base Address
  GPIO_BASE = (PERI_BASE + 0x00200000),
  // GPFSEL4, GPSET1, GPCLR1 Address
  GPFSEL4 = (GPIO_BASE + 0x10),
  GPSET1 = (GPIO_BASE + 0x20),
  GPCLR1 = (GPIO_BASE + 0x2C),
};

int main(void) {
  volatile uint32_t delay;

  mmio_write(GPFSEL4, 1 << 21); // GPFSEL4의 21번 비트를 1로 설정합니다.

  while (1) {
    mmio_write(GPSET1, 1 << 15); // GPSET1의 15번 비트를 1로 설정합니다.
                                 // GPIO 47번을 LOW (ACT LED ON)
    for (delay = 0; delay < 1000000; delay++)
      ;
    mmio_write(GPCLR1, 1 << 15); // GPCLR1의 15번 비트를 1로 설정합니다.
                                 // GPIO 47번을 HIGH (ACT LED OFF)
    for (delay = 0; delay < 1000000; delay++)
      ;
  }

  return 0;
}
```

**`linker.ld`:**  
```
SECTIONS
{
    . = 0x8000;
    .text : { *(.text.boot) }
}
```

**`Makefile`:**  
```
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
CFLAGS = -O2 -Wall -fpic -ffreestanding

all: clean kernel.bin

boot.o: boot.S
	arm-none-eabi-gcc $(CFLAGS) -c boot.S -o boot.o

%.o: %.c
	arm-none-eabi-gcc $(CFLAGS) -c $< -o $@

kernel.bin: boot.o $(OBJS)
	arm-none-eabi-gcc -T linker.ld -o kernel.elf -ffreestanding -O2 -nostdlib boot.o $(OBJS)
	arm-none-eabi-objcopy kernel.elf -O binary kernel.bin
	arm-none-eabi-objdump -D kernel.elf > kernel.dump

clean:
	rm kernel.elf kernel.bin kernel.dump *.o >/dev/null 2>/dev/null || true
```

### 작성한 코드를 빌드하여 실제 Raspberry Pi Zero에서 실행해보자!

위와 같이 `Makefile`까지 모두 작성했다면 터미널에 `make`를 입력하여 빌드합니다.  
빌드가 완료되면 `kernel.bin` 파일이 생성됩니다.

SDCard를 FAT32로 포맷합니다.  
그리고, [/References/boot](https://github.com/LeeKyuHyuk/Simple-ARM-Operating-System/tree/raspberry-pi-zero/References/boot)에 있는 `bootcode.bin`, `config.txt`, `start.elf`를 모두 복사합니다.  
방금 빌드한 `kernel.bin`도 함께 복사합니다.  
![SDCard files]({{ site.url }}/assets/image/2019-02-27-Raspberry-Pi-Zero-W-Bare-Metal-Chapter-3_4.png)  
> SDCard에 있는 `config.txt`에는 `kernel=kernel.bin`이라는 설정만 있습니다. 이 설정은 `kernel.bin`을 사용하여 부팅하겠다는 뜻입니다.

SDCard를 Raspberry Pi Zero에 넣고, 부팅하면 아래와 같이 ACT LED가 켜지고 꺼지는 것을 확인할 수 있습니다.  
![Raspberry Pi Zero ACT LED On Off]({{ site.url }}/assets/image/2019-02-27-Raspberry-Pi-Zero-W-Bare-Metal-Chapter-4.gif)

### `volatile`을 왜 사용할까요?

```c
int main(void) {
  volatile uint32_t delay;
  /* ... 생략 ... */
  while (1) {
    /* ... 생략 ... */
    for (delay = 0; delay < 1000000; delay++)
      ;
    /* ... 생략 ... */
  }
  return 0;
}
```

방금 작성한 C코드에서 Delay를 구현할 때 `volatile`으로 변수를 생성했는데,  
C에서 `volatile`는 Compiler의 Compiler Optimization를 막아주는 역할을 합니다.

만약, `volatile uint32_t delay;`가 아닌 `uint32_t delay;`으로 선언했다면 C Compiler Optimization으로 인해 `for (delay = 0; delay < 1000000; delay++);` 동작은 필요 없는 동작으로 Compiler에게 인식되어 생략될 것입니다. **(Delay 효과를 볼 수가 없습니다)**
