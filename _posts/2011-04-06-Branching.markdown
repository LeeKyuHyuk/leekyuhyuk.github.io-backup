---
layout: post
title:  "6장: 조건문"
date:   2011-04-06 23:51:44 +0900
category: C
---

6장에서는 아래의 내용을 설명할 것입니다:

- 연산자 `&&`, `||`, `!`
- `if`, `else`
- `break`
- 삼항 연산자 `?:`

## **간단한 예제 프로그램 (1)**

```c
// odd_or_even.c -- Check odd or even number.
#include <stdio.h>

int main(void) {
    int number;
    printf("Input : ");
    scanf("%d", &number);
    if (number%2 == 0) {
        printf("%d is even number.\n", number);
    }
    else {
        printf("%d is odd number.\n", number);
    }
    return 0;
}
```

#### **< 출력 화면 (1) >**

```
Input : 931004
931004 is even number.
```

```
Input : -238371
-238371 is odd number.
```

## 예제에 대한 설명 (1)

```c
if (number%2 == 0) {
		printf("%d is even number.\n", number);
}
else {
		printf("%d is odd number.\n", number);
}
```

#### 1. `if`

```c
if (조건) { ... }
```

위와 같이 사용됩니다.  
조건이 성립되면 `{ ... }` 부분이 작동하게 됩니다.  

#### **논리 연산자 종류**

| 연산자 | 조건 |
| :-----------: | :------------ |
| `a==b` | a와 b가 같다 |
| `a!=b` | a와 b가 다르다 |
| `a>b` | a가 b보다 크다 |
| `a<b` | a가 b보다 작다 |
| `a>=b` | a가 b보다 같거나 크다 |
| `a<=b` | a가 b보다 같거나 작다 |

`if (number%2 == 0)`는 `number`를 2로 나누었을 때, 나머지가 0인 경우에 동작하게 됩니다.

#### 2. `else`

제일 가까운 조건문의 부정의 조건을 말합니다.

예를 들어
- `if (a>b)`의 `else`는 `if (a<=b)`와 같습니다.
- `if (a!=b)`의 `else`는 `if (a==b)`와 같습니다.

예제에 나오는 `else`는 `if (number%2 == 0)`의 부정이니 `if (number%2 != 0)` 일 때 작동하게 됩니다.

## **간단한 예제 프로그램 (2)**

```c
#include <stdio.h>

int main(void) {
    int number;
    printf("Input : ");
    scanf("%d", &number);
    if (number < 25) {
        printf("입력받은 숫자가 25보다 작습니다.\n");
    }
    if (number >= 25 && number <= 70) {
        printf("입력받은 숫자가 25에서 70사이입니다.\n");
    }
    if (number > 70) {
        printf("입력받은 숫자가 70보다 큽니다.\n");
    }
    return 0;
}
```

#### **< 출력 화면 (2) >**

```
Input : 62
입력받은 숫자가 25에서 70사이입니다.
```

```
Input : 73
입력받은 숫자가 70보다 큽니다.
```

```
Input : 3
입력받은 숫자가 25보다 작습니다.
```

## 예제에 대한 설명 (2)

`if`에 `&&`나 `||`를 사용하면 여러 개의 조건을 넣을 수 있습니다.

`if (number >= 25 && number <= 70)`는 `number >= 25`와 `number <= 70`를 모두 만족할 때 작동합니다.

만약 둘 중에 하나라도 성립할 때 작동되게 하고 싶다면 `&&`를 `||`로 바꿔주면 됩니다.

| `&&` | and |
| `||` | or |
| `!` | not |

## **간단한 예제 프로그램 (3)**

```c
// power.c
#include <stdio.h>

int main(void) {
    int number=1;
    int power=0;
    while(1) {
        printf("2^%d = %d\n", power, number);
        number*=2;
        power++;
        if (number > 1000000000)
            break;
    }
    return 0;
}
```

#### **< 출력 화면 (3) >**

```
2^0 = 1
2^1 = 2
2^2 = 4
2^3 = 8
2^4 = 16
2^5 = 32
2^6 = 64
2^7 = 128
2^8 = 256
2^9 = 512
2^10 = 1024
2^11 = 2048
2^12 = 4096
2^13 = 8192
2^14 = 16384
2^15 = 32768
2^16 = 65536
2^17 = 131072
2^18 = 262144
2^19 = 524288
2^20 = 1048576
2^21 = 2097152
2^22 = 4194304
2^23 = 8388608
2^24 = 16777216
2^25 = 33554432
2^26 = 67108864
2^27 = 134217728
2^28 = 268435456
2^29 = 536870912
```

## 예제에 대한 설명 (3)

`for`를 사용하면 간단하게 할 수 있지만 `break`를 설명하기 위해 이런 예제를 만들어 봤습니다.  
반복문 안에서 `number`에 2를 곱하고, `if (number > 1000000000)`로 `number`가 `1000000000`보다 큰지 확인합니다.  
만약 조건이 성립하면 `break`가 작동되는데, `break`는 반복문을 중단하고 탈출할 때 사용됩니다.
```c
for ( ... ) { // 1번 조건문
	for ( ... ) { // 2번 조건문
		for ( ... ) { // 3번 조건문
			break;
		}
	}
}
```
만약 위와 같이 다중 반복문일 경우에는 `break`가 포함된 '3번 조건문'에서만 탈출 됩니다.

## **간단한 예제 프로그램 (4)**

```c
// odd_or_even.c -- Check odd or even number.
#include <stdio.h>

int main(void) {
    int number;
    printf("Input : ");
    scanf("%d", &number);
		number%2 == 0 ? printf("%d is even number.\n", number) : printf("%d is odd number.\n", number);
    return 0;
}
```

#### **< 출력 화면 (4) >**

```
Input : 931004
931004 is even number.
```

```
Input : -238371
-238371 is odd number.
```

## 예제에 대한 설명 (4)

예제 1번을 삼항 연산자를 사용하여 변환했습니다.

```c
if (number%2 == 0) {
		printf("%d is even number.\n", number);
}
else {
		printf("%d is odd number.\n", number);
}
```

```c
number%2 == 0 ? printf("%d is even number.\n", number) : printf("%d is odd number.\n", number);
```

삼항 연산자는 `조건 ? A : B`와 같은 형태로 쓰이게 됩니다.
