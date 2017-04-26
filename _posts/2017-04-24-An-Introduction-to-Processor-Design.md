---
layout: post
title:  "프로세서 설계 소개"
date:   2017-04-24 06:56:13 +0900
category: Embedded-System
---

## ARM이 무엇인가요?

- Advanced RISC Machines

- 저전력을 사용하도록 설계되어 임베디드 시스템 용 [SoC(System on chip)](https://ko.wikipedia.org/wiki/단일_칩_체제)에서 가장 많이 사용되는 마이크로프로세서 중 하나

## 명명법

- Computer Architecture
  - 사용자가 보는 컴퓨터
  - 명령어 세트, 사용자가 볼 수 있는 레지스터, 메모리 관리 테이블 구조, 예외 처리 모델

- Computer Organization
  - 사용자에게 보이지 않는 아키텍처 구현
  - CPU, 메모리, 주변장치에서 이를 고속화하기 위한 각종 트릭(Pipeline, Cache 등) 들과 주변장치와의 효율적인 인터페이스를 위한 통신방식(Polling, Interrupt, DMA)

- Processor
  - 메모리에 저장된 명령어를 실행하는 유한 상태(Finite State)의 자동장치
  - State : 메모리 및 레지스터 값
    - 명령(Instructions)의 실행으로 값이 변경된다.

- Stored-program computer
  - 동일한 메모리 시스템에 명령과 데이터를 보관합니다.
  - 명령을 데이터로 처리하도록 허용합니다.
    - 자체 수정 코드 기능 → 디버깅하기 어려워짐
    - 특정 프로세스(서비스)를 큰 덩어리로 나누는 것으로 사용
      - 디스크에서 새 프로그램을 불러옵니다. (이전 프로그램에 덮어쓰기)

## 왜 추상화(Abstraction)를 할까?

- 하위 계층 동작을 추상화
  - 복잡성 감소
  - 복잡한 시스템 설계를 보다 쉽게 처리할 수 있습니다.

- 임베디드 시스템의 추상화 계층
  - 핸드폰, PC, 엔진 컨트롤러
  - 인쇄 회로 기판 (PCB)
  - 통합 시스템 칩
  - 프로세서, 주변 셀, 캐시 메모리, 메모리 관리 장치
  - 프로세서, 캐시 및 메모리 관리 조직
  - ALU (산술 논리 유닛), 배럴 쉬프터, 레지스터 뱅크, 메모리 블록
  - 워드 와이드 덧셈기, 멀티플렉스, 디코더, 레지스터, 버스
  - 단일 비트 덧셈기, 멀티플렉스, 디코더, 플립플롭
  - 논리 게이트, 메모리 셀, 특수 회로 트랜지스터

## MU0가 무엇인가요?

- 맨체스터 대학교에서 만든 아주 간단한 프로세서

- 제한된 명령 집합(Instruction Set)이 구현되어 있습니다.

- 맨체스터가 설계한 기계
  - 제한된 구성 요소 집합(Component Set)만으로도 제한된 명령 집합을 구현할 수 있습니다.
  - MUn, 1 ≤ n ≤ 6
  - MU0은 교육 목적으로 가장 간단한 프로세서입니다.

- 기본 구성 요소(Components)
  - 프로그램 카운터 (PC)
  - 누산기 (ACC)
  - 산술 논리 장치 (ALU)
  - 명령어 레지스터 (IR)
  - 명령어 디코드 및 제어 로직

## MU0 명령어 세트

- 명령어 형식

  ![MU0 Instruction Format]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_1.png)

  - 16 비트 명령어
    - 처음 4 비트 : opcode
    - 마지막 12 비트 : 주소 공간 (S)

  - 최대 8KB - 4096 (212) 개의 주소 지정이 가능한 16 비트 위치

- MU0 명령어 목록

  - 16개의 사용 가능한 opcode 중 8개만 사용합니다.

| Instruction | Opcode | Effect |
| :---------: | :----: | :----- |
| `LDA S` | 0000 | ACC := mem16[S] |
| `ADD S` | 0010 | ACC := ACC + mem16[S] |
| `STO S` | 0001 | mem16[S] := ACC |
| `SUB S` | 0011 | ACC := ACC - mem16[S] |
| `JMP S` | 0100 | PC := S |
| `JGE S` | 0101 | if ACC >= 0 PC := S |
| `JNE S` | 0110 | if ACC !=0 PC := S |
| `STP` | 0111 | stop |

## MU0 명령어 세트 구현

- 디자인을 두 가지 구성 요소로 분리

  - 데이터 경로 (Datapath)
    - 모든 구성 요소가 병렬로 많은 비트를 운반, 저장 또는 처리합니다.
      - 누산기, 프로그램 카운터, 산술 논리 장치, 명령어 레지스터
      - 레지스터 전송 레벨 (RTL: Register Transfer Level) 설계

  - 제어 로직 (Control Logic)
    - 유한 상태 기계 (FSM: finite state machine) 접근법


![A view inside the controller and datapath]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_2.png)

## 데이터 경로 설계

- 데이터 경로를 구현하는 방법은 여러 가지가 있습니다.

- 다음과 같은 가정을 고려합니다:
  - 메모리는 데이터 경로 설계의 걸림돌(제한 요소)입니다.
  - 각 메모리 접근에는 1클럭 사이클이 소요됩니다.
  - 각 명령어는 반드시 수행해야 하는 메모리 접근 횟수로 정의된 클럭 사이클 수만큼 소요됩니다.
    - 2클럭 사이클 명령어들:
      - `LDA S` / `STO S` / `ADD S` / `SUB S`
    - 1클럭 사이클 명령어들:
      - `JMP S` / `JGE S` / `JNE S` / `STP`

## MU0 데이터 경로 예제

![MU0 Datapath]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_3.png)

- 데이터 경로의 2 단계 작업:
  - 메모리 피연산자(Memory Operand) 접근 및 원하는 작업 수행
  - 실행될 다음 명령어 가져오기

## 초기화

- 항상 동일한 상태에서 프로세서는 동작해야 합니다.

- Reset 입력이 필요합니다.

- ALU를 0으로 초기화 한 다음, PC=0000로 초기화합니다.

## 데이터 경로 RTL(Register Transfer Level) 설계

- 멀티플렉서 및 제어 신호 추가

- 모든 8개의 명령어에 대한 단일 하드웨어

- 데이터 경로가 전체 작업 집합을 수행하는 데 필요한 제어 신호를 정확하게 결정합니다.

- 클럭의 하강 에지(Falling Edge)에서 상태가 변경되었다고 가정합니다.

- 신호 사용

  - 예 : PC
    - Pcce = '1'일 때는 상태 변경
    - Pcce = '0'일 때는 변경하지 않습니다.

  ![Datapath RTL]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_4.png)

## 제어 로직 (Control Logic)

- 현재 명령어를 디코드하고 데이터 경로 제어 신호를 생성합니다.
  - 데이터 경로의 제어 입력 사용

- 간단한 유한 상태 기계 (FSM: Finite State Machine)
  - 두 가지 상태 만 있습니다.
  - '가져오기(fetch)'와 '실행(execute)' 그리고 1 비트의 상태 (Ex/ft)

  ![Control Logic]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_5.png)

## 데이터 경로에서 ALU 설계

- 다섯 가지 기능을 수행합니다.
  - A + B
  - A-B
  - B
  - B + 1
  - 0
    - 리셋에 사용됨

- ALU는 이진 가산기(Binary Adder)를 확장하여 설계 가능합니다.

## 명령어 형식 (n-Address Instructions)

- **4주소 명령어**
  - `ADD d, s1, s2, next_i; d := s1 +s2`
  - 명령어 종류를 나타내기 위한 비트, 두 출발지 주소와 목적지를 나타내기 위한 비트, 다음 명령어의 주소를 나타내기 위한 비트가 필요합니다.
  - 각 피연산자 주소가 `n`bit, opcode가 `f`bit 이면 명령어당 `4n + f`bit가 필요합니다.

  ![4주소 명령어]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_6.png)

- **3주소 명령어**
  - `ADD d, s1, s2; d = s1 +s2`
  - `next_i`를 줄이면 `3n + f`bit가 필요합니다.
  - PC는 해당 크기만큼 자동으로 증가합니다.
  - 장점:
    - 연산 시 원래의 자료를 파괴하지 않습니다.
    - 다른 형식의 명령어를 이용하는 것보다 프로그램 전체의 길이를 짧게 할 수 있습니다.
    - 전체 프로그램 실행 시 명령 인출을 위하여 주기억장치를 접근하는 횟수가 줄어듭니다.
  - 단점
    - 명령어 한 개의 길이가 너무 길어집니다.
    - 하나의 명령을 수행하기 위해서 최소한 4번 기억장소에 접근해야 하므로 수행 시간이 길어집니다.

  ![3주소 명령어]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_7.png)

- **2주소 명령어**
  - `ADD d, s1; d := d + s1`
  - `d`는 출발지 및 목적지입니다.
  - 장점
    - 실행 속도가 빠르고 기억 장소를 많이 차지하지 않습니다.
    - 3주소 명령에 비해 명령어의 길이가 짧음.
    - 계산 결과가 기억장치에 기억되고 중앙처리장치에도 남아 있어서 계산 결과를 시험할 필요가 있을 때 시간이 절약됩니다.
  - 단점
    - 연산의 결과는 주로 Operand 1에 저장되므로 Operand 1에 있던 원래의 자료가 파괴
    - 전체 프로그램의 길이가 길어집니다.

  ![2주소 명령어]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_8.png)

- **1주소 명령어**
  - `ADD s1; accumulator := accumulator + s1`
  - 암시적인 대상 레지스터 → 누산기

  ![1주소 명령어]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_9.png)

- **0주소 명령어**
  - `ADD; top_of_stack := top_of_stack + next_on_stack`

  ![0주소 명령어]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_10.png)


- **n-Address 사용의 예**
  - 0주소 : Inmos Transputer(Evaluation 스택 구조)
  - 1주소 구조 : MU0
  - 2주소 구조 : ARM의 Thumb 명령어 세트
  - 3주소 구조 : ARM 명령어 세트
  - 4주소 명령어는 거의 사용되지 않습니다.

## 명령어 유형 (Instruction types)

- 데이터 처리 명령
  - 더하기, 빼기, 곱하기, ...
- 데이터 이동 명령
  - 로드, 저장, ...
- 제어 흐름 명령
  - 프로그램의 한 부분에서 다른 부분으로 실행 전환
- 특별 지침
  - 프로세서의 실행 상태 제어
  - 예) 특권 모드로 전환하여 OS 기능을 수행

## 주소 지정 방식 (Addressing modes)

Addressing mode: 데이터 처리, 데이터 이동 명령어의 피연산자를 접근하는 방법

- 원하는 위치를 지정하는 방법
  - 데이터 처리, 데이터 이동 : 피연산자 위치
  - 제어 흐름 : 비 순차적인 명령 흐름

- 전형적인 어드레싱 모드
  - Immediate : 원하는 값이 명령에 포함되어 있습니다.
  - Absolute : 전체 주소가 명령에 포함되어 있습니다.
  - Indirect : 위치를 가리키는 메모리의 주소
  - Register : 레지스터에는 값이 들어가 있고, Instruction에는 레지스터 번호가 들어가게 됩니다.
  - Register Indirect : 레지스터는 메모리 주소를 담고 있고, Instruction은 레지스터 번호를 담게 됩니다.
  - Base + offset : 레지스터에 Base가 있고 명령에 Offset이 있습니다.
  - Base + index : 레지스터에 Base가 있고 명령에 Index가 있습니다.
  - Base + scaled index : 위와 같지만 Index에는 상수가 곱해집니다
  - Stack : 암시적 또는 지정된 레지스터(스택 포인터)는 메모리(스택) 영역을 가리킵니다. 항목이 Push되거나 Pop 됩니다. (LIFO 기준)

- 무한 개의 어드레싱 모드가 가능합니다.

## 비 순차적인 명령 흐름 (Non-sequential instruction flow)

- 무조건 분기
  - 항상 지정된 위치로 건너뜁니다.

- 조건 분기
  - 조건에 따라 위치 이동

- 조건 코드 레지스터
  - 데이터 처리 명령어의 결과 기록
    - 0 / + / - / overflow / carry output,…
  - 조건 분기 명령은 결과에 의해 제어됩니다

- 서브루틴 호출
  - 요청된 곳으로 다시 돌아오기 위해 복귀 주소를 저장해야 합니다.
  - 복귀 주소는 프로세서에 따라 메모리, 스택, 레지스터에 저장됩니다.

- 서브프로그램 리턴
  - 복귀 주소를 프로그램 카운터 (PC)에 복원합니다.

- 시스템 호출
  - 입출력 주변장치 접근 등의 프로세서의 특별한 기능은 사용자 코드로부터 보호되어야 합니다.
  - 이러한 특별 기능을 사용할 때는 시스템 호출을 사용합니다.

- 예외 (Exceptions)
  - 프로그램 실행에서 예상하지 못한 변화
  - 하드웨어 인터럽트, 소프트웨어 인터럽트, 메모리 시스템에서의 오류

## 프로세서 설계 원칙

- CISC vs RISC
  - CISC: Complex Instruction Set Computer
  - RISC: Reduced Instruction Set Computer
  - RISC는 사실상 현대 마이크로프로세서의 표준입니다.

- 명령어 세트는 프로그래머에게 유용하고 구현하기 효율적인 기능들을 지원해야 합니다.

- 컴파일러 작성이 용이하고 고급 언어를 효율적으로 지원해야 합니다.

## 파이프라인 (Pipelining)

- 처리량 증가를 위한 가장 일반적인 방법

- 현재 명령이 끝나기 전에 다음 명령을 시작합니다.
  - 동시 실행을 활용

![Pipelining]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_11.png)

## 파이프라인 해저드 (Pipeline Hazard)

- 파이프라인이 속도가 느려지는 경우를 해저드라고 합니다.

- 데이터 해저드는 예상된 시각에 연산자가 사용 불가능할 경우에 일어납니다.

- 구조적 해저드(Structural Hazards):
  - 하드웨어가 여러 명령들의 수행을 지원하지 않아 발생한다.
  - 자원 충돌 (Resource Conflicts)

- 데이터 해저드(Data Hazards):
  - 명령이 현재 파이프라인에서 수행중인 이전 명령의 결과에 종속되는 경우 발생한다.

- 제어 해저드(Control Hazards):
  - 분기 명령어에 의해 발생한다.

- 데이터 해저드 종류
  - Read after write (RAW)
  - Write after read (WAR)
  - Write after Write (WAW)
  - Read after Read (RAR) → 문제가 되지 않는다!

- Read after write (RAW) 해저드 예시:

![Read after write (RAW) 해저드 예시]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_12.png)

- 제어 해저드(Control Hazards) 예시:

![제어 해저드(Control Hazards) 예시]({{ site.url }}/assets/image/2017-04-24-An-Introduction-to-Processor-Design_13.png)

- 패널티를 줄이려면 어떻게 해야 할까?
  - 이전 분기 상태에 따라 분기를 결정하는 동적 예측 알고리즘을 사용한다.

----
## Reference

- [ARM 아키텍처 - 위키피디아](https://ko.wikipedia.org/wiki/ARM_아키텍처)

- [단일 칩 체제 - 위키피디아](https://ko.wikipedia.org/wiki/단일_칩_체제)

- [Computer Organization이 무엇인가요??](https://kldp.org/node/155724)

- [유한 상태 기계 - 위키피디아]((https://ko.wikipedia.org/wiki/유한_상태_기계)

- [프로그램 내장식 컴퓨터 - 위키피디아](https://ko.wikipedia.org/wiki/프로그램_내장식_컴퓨터)

- [coarse-grained? fine-grained?](http://moonlighting.tistory.com/90)

- [MU0 - a simple computer](http://www.cs.man.ac.uk/~pjj/cs1001/arch/node1.html)

- [프로세서 레지스터 - 위키피디아](https://ko.wikipedia.org/wiki/프로세서_레지스터)

- [산술 논리 장치 - 위키피디아](https://ko.wikipedia.org/wiki/산술_논리_장치)

- [명령어 형식](http://devkim93.tistory.com/entry/명령어-형식)

- [명령어 파이프라인 - 위키피디아](https://ko.wikipedia.org/wiki/명령어_파이프라인)

- [파이프라인 해저드 (Pipeline Hazards)](http://blog.naver.com/iamhmin05/30021850112)
