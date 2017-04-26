---
layout: post
title:  "ARM 아키텍처"
date:   2017-04-26 01:17:58 +0900
category: Embedded-System
---

## ARM의 기능

- Berkeley RISC와 같은 ARM 특징
  - Load-store 구조
  - 32 비트 고정 명령어 길이
  - 3주소 명령어 형식

- Berkeley RISC와 다른 ARM 특징
  - 레지스터 윈도우 (Register windows)
    - Berkeley RISC 프로세서는 많은 레지스터를 사용
  - 지연 분기 명령어 (Delayed branches)
    - 대부분의 RISC 프로세서가 파이프라인 제어 해저드를 해결하기 위해 도입
    - 예외 처리를 복잡하게 하고 분기 예측 메커니즘에서 나쁘게 상호 작용하여 ARM에서는 사용 안 함
  - 모든 명령어의 싱글 사이클 실행
    - 데이터 이동 명령어는 명령어와 데이터를 위해 두 번의 메모리 접근이 필요
    - 싱글 사이클 동작을 위해 명령어와 데이터 메모리가 별도로 필요
    - ARM은 이러한 제약을 없애기 위해 멀티 사이클 실행 명령어를 추가
    - 메모리 접근에 효율적인 어드레싱 모드를 추가

## ARM 프로그램 모델

- 다음의 조합:
  - 명령어 세트
  - 프로그래머가 볼 수 있는 시스템 상태

- 명령어 세트:
  - 프로그래머가 프로세서를 포함하는 시스템의 상태를 변경하는 데 사용할 수 있는 작업

- 프로그래머가 볼 수 있는 시스템 상태:
  - 프로세서의 사용자가 볼 수 있는 레지스터
  - 시스템의 메모리

- 명령과 시스템 상태 간의 관계
  - 각 명령어는 시스템 상태를 변경합니다.

## ARM의 사용자가 볼 수 있는 레지스터

![ARM's visible registers]({{ site.url }}/assets/image/2017-04-26-The-ARM-Architecture_1.png)

- 사용자 레벨 프로그래밍
  - 범용 레지스터
    - `r0` – `r14` (32 bit 레지스터)
  - 프로그램 카운터 (PC: Program Counter)
    - `r15`
  - 현재 프로그램 상태 레지스터
    - `CPSR` (Current Program Status Register)
- 시스템 레벨 프로그래밍 및 예외(Exceptions) 용도
  - 기타
- `r13`: 일반적으로 스택 포인터로 사용됩니다.
- `r14`: 링크 레지스터로 사용됩니다.

## 프로그램 카운터 (PC: Program Counter)

- 프로세서가 ARM 상태에서 실행 중일 때 :
  - 모든 명령어의 길이는 32 비트입니다.
  - 모든 명령어는 단어와 일치해야 합니다.

- PC 값은 비트 [31:2]에 저장됩니다.
  - 비트 [1 : 0] = 0

- `r14`는 서브루틴 링크 레지스터(LR: Link Register)로 사용되며 PC에서 계산된 분기 연결(BL: Branch with Link) 작업이 수행될 때 복귀 주소를 저장합니다.

- 연결된 지점에서 돌아가려면
  - `MOV r15, r14`
  - `MOV pc, lr`

## CPSR (Current Program Status Register)

- 조건 코드 비트를 저장하는 데 사용됩니다.
  - 예)
    - 비교 작업의 결과 기록
    - 조건부 분기 수행 여부 제어

- 레지스터로 조건 분기 여부를 결정하기 위해 사용됩니다.

![CPSR (Current Program Status Register)]({{ site.url }}/assets/image/2017-04-26-The-ARM-Architecture_2.png)

- 모드 : 프로세서 모드
- ARM7 TDMI
- **사용자 모드 (usr)**: 일반 프로그램 실행 모드
- **고속 인터럽트 모드 (fiq)**: 고속 데이터 전송 또는 채널 프로세스 지원
- **인터럽트 모드 (irq)**: 범용 인터럽트 처리에 사용됩니다
- **관리자 모드 (svc)**: 운영 체제의 보호 모드
- **중단 모드 (abt)**: 가상 메모리 및 또는 메모리 보호 기능을 구현합니다.
- **시스템 모드 (sys)**: 운영 체제에 대한 권한 있는 사용자 모드. (OS 작업 실행)
- **정의되지 않은 모드 (und)**: 하드웨어 코프로세서(Coprocessors)의 소프트웨어 에뮬레이션을 지원합니다.


- **모드 비트 요약**

| M[4:0] | Mode       | Visible Thumb-state registers             | Visible Thumb-state registers                |
|--------|------------|-------------------------------------------|----------------------------------------------|
| 10000  | User       | r0–r7, SP, LR, PC, CPSR                   | r0–r14, PC, CPSR                             |
| 10001  | FIQ        | r0–r7, SP_fiq, LR_fiq, PC, CPSR, SPSR_fiq | r0–r7, r8_fiq–r14_fiq, PC, CPSR, SPSR_fiq    |
| 10010  | IRQ        | r0–r7, SP_irq, LR_irq, PC, CPSR, SPSR_irq | r0–r12, r13_irq, r14_irq, PC, CPSR, SPSR_irq |
| 10011  | Supervisor | r0–r7, SP_svc, LR_svc, PC, CPSR, SPSR_svc | r0–r12, r13_svc, r14_svc, PC, CPSR, SPSR_svc |
| 10111  | Abort      | r0–r7, SP_abt, LR_abt, PC, CPSR, SPSR_abt | r0–r12, r13_abt, r14_abt, PC, CPSR, SPSR_abt |
| 11011  | Undefined  | r0–r7, SP_und, LR_und, PC, CPSR, SPSR_und | r0–r12, r13_und, r14_und, PC, CPSR, SPSR_und |
| 11111  | System     | r0–r7, SP, LR, PC, CPSR                   | r0–r14, PC, CPSR                             |

- T: ARM 또는 Thumb 명령어 세트

- ARM7TDMI
  - ARM :이 상태에서 32 비트 워드 정렬 ARM 명령어가 실행됩니다.
  - Thumb :이 상태에서 16 비트, 하프워드 정렬 Thumb 명령어가 실행됩니다.

- ARM과 Thumb 간의 전환
  - `BX` 명령어 사용
  - Syntax: `BX {<cond>} <Rm>`

- IF
  - 인터럽트 활성화 및 사용자 프로그램에 의한 변경 방지

- NZCV
  - 조건 코드 플래그
  - 마지막 ALU 작업 결과
    - N : 네거티브 (Negative)
    - Z : 0 (Zero)
    - C : 캐리 아웃 (Carry-out)
    - V : 오버플로 (Overflow)

## SPSR (Saved Program Status Register)

- 지금 실행되고 있는 Mode를 실행하기 바로 전의 CPSR을 저장하는 레지스터

- 목적
  - 예외 발생 시 CPSR와 함께 로드 됩니다.

- 형식
  - CPSR과 동일합니다.

- 기능
  - CPSR과 동일합니다.
  - 가장 최근에 수행된 ALU 작업에 대한 정보를 보유합니다.
  - 인터럽트의 활성화 및 비활성화를 제어합니다.
  - 프로세서 작동 모드 설정

## 메모리 시스템

- 선형 바이트 배열로 간주됩니다.
  - 0에서 2³² -1까지 번호가 매겨집니다.

![ARM Memory Organization]({{ site.url }}/assets/image/2017-04-26-The-ARM-Architecture_3.png)

- 데이터 크기:
  - Byte: 8-bits
  - Half-word: 16-bits
  - Word: 32-bits

- 정렬:
  - Word : 4 바이트 경계
  - 하프워드 : 짝수 바이트 경계에 있습니다.

- Little-Endian과 Big-Endian 모두 지원

## Supervisor mode

- 사용자 코드에 의한 동작으로부터 프로세서를 보호하기 위해, 사용자가 접근할 수 없는 Supervisor mode를 지원합니다.

- 시스템 레벨 기능에만 접근할 수 있습니다.
  - 지정된 Supervisor 호출을 통하여

## Load-store 구조

- 레지스터에 있는 값만 데이터 처리를 할 수 있으며, 결과를 레지스터에 저장합니다.

- 메모리와 관련된 연산:
  - Load : 메모리에서 레지스터로 데이터 복사
  - Store : 레지스터에서 메모리로 데이터 복사

- ARM 명령어 카테고리
  - 데이터 처리 명령 (Data processing instruction)
    - 산술 논리 명령어
    - 오직 레지스터 값만 사용하고 변경합니다.
  - 데이터 이동 명령어 (Data transfer instruction)
    - 메모리에서 레지스터로, 레지스터에서 메모리로 데이터 복사
    - Load, Store, Exchange 명령어
  - 제어 흐름 명령어 (Control flow instruction)
    - 다른 주소로 전환합니다.
      - 원래 시퀀스를 다시 시작하기 위해 복귀 주소 저장
      - 시스템 코드 트래핑
      - Branch, Branch and Link, Supervisor call 명령어

## ARM 명령어 세트

- 주목할만한 특징
  - 3주소 데이터 처리 명령
  - 모든 명령의 조건부 실행
  - 강력한 다중 레지스터 전송 명령어 포함
  - 단일 클럭 사이클에서 실행되는 단일 명령어의 일반 시프트(shift)/ALU 연산
  - 프로그래머 모델에 새 레지스터 및 데이터 유형을 추가하는 것을 포함하여 코프로세서 명령어 세트를 통해 명령어 세트를 확장합니다.
  - Thumb 아키텍처에서 ARM 명령어 세트의 16비트로 압축된 형식

## I/O 시스템

- 주변장치(I/O장치)를 인터럽트 지원 하의 Memory-Mapped 장치로 간주합니다.

- I/O장치의 내부 레지스터는 메모리 영역 내의 주소가 할당되고 load와 store 명령을 사용하여 읽기, 쓰기를 합니다.

- IRQ나 FIQ 입력을 통해 인터럽트를 요청합니다.

- 주변 장치가 프로세서의 관심을 끌 수 있습니다.
  - IRQ : 정상적인 인터럽트
    -  대부분의 인터럽트 소스가 연결
  - FIQ : 빠른 인터럽트
    - 처리시간이 중요한 한두 개의 소스가 연결
  - 둘 다 레벨에 민감하고 마스킹 가능합니다.

## 예외 (Exceptions)

- 프로그램의 정상적인 실행을 중단
  - 주변 장치의 인터럽트 처리
  - 실행 파이프라인에서 현재 실행된 명령 보장

- **일반적인 예외(Exceptions) 절차**
  - `PC`를 `r14_exc에` 복사하고 `CPSR`을 `SPSR_exc`에 복사하여 현재 상태를 저장합니다.
    - exc는 Exceptions Type를 나타냅니다.
  - 프로세서 작동 모드가 적절한 예외 모드로 변경됩니다.
  - PC는 Exceptions Type에 따라 00 ₁₆에서 IC ₁₆ 사이의 값으로 강제 설정됩니다.

- **Exceptions Type**
  - IRQ(Interrupt ReQuest)
    - nIRQ 입력에서 LOW 레벨로 인한 일반 인터럽트
  - FIQ (Fast Interrupt reQuest)
    - nFIQ 입력을 LOW로 외부에서 생성
    - 데이터 또는 채널 전송을 빠르게 처리
  - ABORT
    - 외부 ABORT 입력 신호
    - 현재 메모리 접근을 완료할 수 없음을 나타냅니다.
  - Software interrupt
    - 소프트웨어 인터럽트 명령 (SWI: Software Interrupt Instruction)에 의해 생성됩니다.
    - Supervisor mode으로 전환합니다.
    - 대부분 소프트웨어 인터럽트는 특정 Supervisor 기능을 요청합니다.
  - Undefined instruction trap
    - ARM에서 정의되지 않은 명령을 수행하려고 하거나 코프로세서에서 응답이 없으면 발생합니다.
    - 코프로세서가 이 명령어를 수행할 수 있지만 그동안 사용 중이면 ARM은 코프로세서가 준비될 때까지 대기하거나 인터럽트가 발생할 때까지 대기합니다.
    - 코프로세서가 명령어를 처리할 수없는 경우 ARM은 정의되지 않은 명령어 트랩을 사용합니다

- **Exception 우선 순위**
  1. Reset (가장 높은 우선 순위)
  2. Data abort
  3. FIQ
  4. IRQ
  5. Prefetch abort
  6. Undefined Instruction, Software interrupt

- 예외가 처리되기 전에 해당 인터럽트 핸들러의 코드의 위치를 찾고 실행합니다.
- 이 전에 실행되던 상태가 없어지면 나중에 복귀되었을 때 문제가 발생하므로 레지스터와 프로그램 카운터를 보관하여 CPU의 상태를 보존해야 합니다.
- 인터럽트가 핸들링이 완료되면 이전의 상태로 복귀됩니다.

- **Exception Vectors**

| Address | Exception | Mode on entry |
| :------ | :-------: | :------------ |
| `0x00000000` | Reset | Supervisor |
| `0x00000004` | Undefined Exception | Undefined |
| `0x00000008` | Software Interrupt | Supervisor |
| `0x0000000C` | Abort (prefetch) | Abort |
| `0x00000010` | Abort (data) | Abort |
| `0x00000014` | Nothing | Nothing |
| `0x00000018` | IRQ | IRQ |
| `0x0000001C` | FIQ | FIQ |

- **Exception이 발생할 때**
  1. 적절한 링크 레지스터(`r14`)에 다음 명령어의 주소를 보존합니다.
  2. `CPSR`을 적절한 `SPSR`에 복사합니다.
  3. `CPSR` 모드 비트를 Exception에 따라 달라지는 값으로 설정합니다.
  4. `PC`가 관련 Exception vectors에서 다음 명령어를 가져오도록 합니다.

- **Exception에서 나올 때**
  1. 링크 레지스터를 `PC`로 이동합니다.
  2. `SPSR`을 `CPSR`에 다시 복사합니다.
  3. 인터럽트 금지 플래그가 설정된 항목을 지웁니다.

----
## Reference

- [ARM7TDMI Technical Reference Manual](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0210c/CIHIAAGE.html)

- [Exception Vector Table (EVT)과 각 Handler의 구현](http://recipes.egloos.com/5035801)
