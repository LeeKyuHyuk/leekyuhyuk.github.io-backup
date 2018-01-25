---
layout: post
title:  "C 연습문제1: 숫자 맞추기"
date:   2011-04-07 16:01:00 +0900
category: C
---

1장~6장에서 배운 문제로 간단한 게임을 만들어봅시다.

```
Hello! What is your name?
>>> KyuHyuk
Well, KyuHyuk, I am thinking of a number between 1 and 31.
Take a guess.
>>> 10
Your guess is too high.
Take a guess.
>>> 2
Your guess is too low.
Take a guess.
>>> 4
Good job, KyuHyuk! You guessed my number in 3 guesses!
```

- 사용자의 이름을 입력받습니다.
- 1에서 31사이의 임의의 숫자를 생성하고, 5번의 숫자를 맞출 기회를 줍니다.
- 사용자가 입력한 숫자와 임의로 생성한 숫자와 비교하여, 입력한 숫자가 큰지 작은지 출력합니다.
- 만약 주어진 기회 안에 맞추지 못하면, 임의로 생성한 숫자를 보여줍니다.

## **풀이**

```c
// guesses_number.c -- Guesses random number
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int guess, guessesTaken, number;
    char name[100];
    srand(time(NULL));
    number = rand()%31+1;

    printf("Hello! What is your name?\n");
    scanf("%s", name);
    printf("Well, %s, I am thinking of a number between 1 and 31.\n", name);
    for (guessesTaken=1 ; guessesTaken<6 ; guessesTaken++) {
        printf("Take a guess.\n");
        scanf("%d", &guess);
        if (guess < number)
            printf("Your guess is too low.\n");
        if (guess > number)
            printf("Your guess is too high.\n");
        if (guess == number)
            break;
    }
    if (guess == number)
        printf("Good job, %s! You guessed my number in %d guesses!\n", name, guessesTaken);
    else
        printf("Nope. The number I was thinking of was %d.\n", number);
    return 0;
}
```
