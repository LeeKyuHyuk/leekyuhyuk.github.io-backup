---
layout: post
title:  "2장: if, while, random"
date:   2015-09-25 22:01:54 +0900
category: Python
image:  2015-09-24-Python-Hello-World.jpg
---

2장에서는 아래의 내용을 설명할 것입니다:

- 이스케이프 시퀀스
- `if` 조건문
- `while` 반복문
- `break`
- `random.randint(a, b)`
- `import`
- Boolean
- 비교 연산자

#### **이스케이프 시퀀스**

만약 "What's your name?"를 출력하고 싶다면 어떻게 해야 할까요?

``` python
print '"What's your name?"'
```

만약 위와 같이 코드를 작성하면 문법 오류가 발생하게 됩니다.

하지만 이스케이프 시퀀스를 사용한다면 간단하게 해결할 수 있습니다.

##### **이스케이프 시퀀스 종류**

| 시퀀스 | 의미 |
| :-----------: | :------------ |
| `\\` | 백슬래시 (\)|
| `\'` | 작은따옴표 (') |
| `\"` | 큰따옴표 (")|
| `\a` | 벨(경고) |
| `\b` | 백스페이스 |
| `\f` | 폼 피드 |
| `\n` | 줄 바꿈 |
| `\r` | 캐리지 리턴 |
| `\t` | 탭 |


``` python
print '"What\'s your name?"'
```
```
"What's your name?"
```

 '이스케이프 시퀀스'를 사용하지 않고 작성하는 법도 있습니다.

``` python
print '''"What's your name?"'''

print '''"What's
your
name?"'''
```
``` bash
"What's your name?"
"What's
your
name?"
```

#### **`if` 조건문**

``` python
#-*- coding: utf-8 -*-
print '나이를 입력해주세요.'
age = input()
if age > 19:
        print '성인인증이 완료되었습니다.'
else:
        print '미성년자는 접근이 불가합니다.'
```

```
나이를 입력해주세요.
18
미성년자는 접근이 불가합니다.
```

```
나이를 입력해주세요.
24
성인인증이 완료되었습니다.
```

`if`는 아래와 같이 사용 가능합니다.

``` python
if 조건:
	# 내용
```

`if` 뒤에 조건이 성립한 경우 아래의 명령이 작동합니다.

조건은 아래와 같이 표기 가능합니다.

**논리 연산자 종류**

| 연산자 | 조건 |
| :-----------: | :------------ |
| `a==b` | a와 b가 같다 |
| `a!=b` | a와 b가 다르다 |
| `a>b` | a가 b보다 크다 |
| `a<b` | a가 b보다 작다 |
| `a>=b` | a가 b보다 같거나 크다 |
| `a<=b` | a가 b보다 같거나 작다 |

여기서 가장 중요한 건 <kbd>Tab</kbd>키로 들여 쓰기를 해줘야 합니다.

***옳은 사용방법:***

``` python
if age > 19:
        print '성인인증이 완료되었습니다.'
else:
        print '미성년자는 접근이 불가합니다.'
```

***옳지 않은 사용방법:***

``` python
if age > 19:
print '성인인증이 완료되었습니다.'
else:
print '미성년자는 접근이 불가합니다.'
```

만약 <kbd>Tab</kbd>을 사용하여 구분을 해주지 않으면 오류가 발생하게 됩니다.

예제의 `if` 구문 아래의 `else`는 앞에서 지정한 `if`의 조건이 아닐 경우 실행됩니다.

`if int(age) > 19`의 `else`의 조건은 `if int(age) <= 19`와 같습니다.


#### **`while` 반복문**

``` python
number = 1
while number <= 10:
        print number
        number += 1 # number += 1은
			        # number = number + 1과 같습니다.
```

```
1
2
3
4
5
6
7
8
9
10
```

`while` 반복문은 조건이 성립할 때까지 아래의 명령이 작동합니다.

##### **`while` 반복문 작동 과정**

![Python while loop]({{ site.url }}/assets/image/2015-09-25-Python-While.gif)


``` python
#-*- coding: utf-8 -*-
# 이 프로그램은 0부터 사용자가 입력한 숫자까지의 합을 구합니다.
print '값 n을 입력해주세요.'
number = input()
count = 0
total = 0
while count <= number:
	total = total + count
	count = count + 1
print '0부터 ' + str(number) + '의 합은 ' + str(total) + '입니다.'
```

```
값 n을 입력해주세요.
10
0부터 10의 합은 55입니다.
```

#### **`break`**

`break`는 현재 위치에서 제일 가까운 반복문을 멈추는 명령입니다.

``` python
number = 1
while number <= 100:
	if number == 5:
		print "Break!"
		break
	print number
	number += 1
```

`if number == 5`로 number가 5였을 때 `break`을 사용하여 반복문을 중단하였습니다.

만약 위 프로그램에서 `break` 부분이 없다면 1부터 100까지 출력되었을 것입니다.

#### **random을 사용하여 난수 생성하기**

`random.randint(a, b)`으로 정수의 난수 N (a ≤ N ≤ b )을 생성할 수 있습니다.

`random.randint(a, b)`을 사용하려면 `import random`를 미리 선언해야 합니다.

`import`는 이미 만들어진 Python 모듈을 사용할 수 있게 해주는 명령어입니다.

`random`에는 `randint` 말고도 여러 가지 함수가 있습니다.

'[Python  - random](https://docs.python.org/2/library/random.html) 문서 참조'

이 모듈에 있는 함수들을 이용하기 위해서 `import`를 사용하는 것입니다.

```python
#-*- coding: utf-8 -*-
import random

number = random.randint(1, 10)
print '제가 고른 숫자를 알아맞혀 보세요!'
print '숫자의 범위는 1부터 10까지입니다!'
answer = input()
if (number == answer):
        print '정답입니다! 어떻게 맞추셨어요?'
else:
        print '땡~ 틀렸어요. 정답은 ' + str(number) + '이었습니다!'
```
```
제가 고른 숫자를 알아맞혀 보세요!
숫자의 범위는 1부터 10까지입니다!
9
정답입니다! 어떻게 맞추셨어요?
```
```
제가 고른 숫자를 알아맞혀 보세요!
숫자의 범위는 1부터 10까지입니다!
3
땡~ 틀렸어요. 정답은 2이었습니다!
```

#### **Boolean**

변수에는 정수, 실수, 문자열 그리고 Boolean도 저장이 가능합니다.

Boolean은 True, False를 저장하는 자료형입니다.

``` python
#-*- coding: utf-8 -*-
import random

checkDoor = False

if checkDoor:
        print "잘했어요."
else:
        print "헉! 문 잘 잠그고 왔는지 확인하세요!
"
```
```
헉! 문 잘 잠그고 왔는지 확인하세요!
```

#### **Assignment 3**

숫자를 입력받아 구구단을 출력해보세요.

`>>`은 입력받는 표시입니다.

``` python
>> 8
8 x 1 = 8
8 x 2 = 16
8 x 3 = 24
8 x 4 = 32
8 x 5 = 40
8 x 6 = 48
8 x 7 = 56
8 x 8 = 64
8 x 9 = 72
```

[📎 '2015-09-25-python_assignment3.py' 다운로드]({{ site.url }}/assets/file/2015-09-25-python_assignment3.py)

#### **Assignment 4**

컴퓨터가 1부터 31 숫자 중 하나를 고르게 한 뒤, 사용자가 숫자를 알아맞히는 게임을 만들어보세요.

기회는 총 5번이 주어지며, 숫자를 입력하면 사용자가 입력한 숫자가 컴퓨터가 선택한 숫자보다 큰지 작은지 알려줍니다.

```
컴퓨터가 1부터 31의 숫자 중 하나를 골랐습니다! 맞춰보세요!
총 5번의 기회가 있습니다.
>> 11
11보다 큰 숫자를 말해보세요.
>> 20
20보다 큰 숫자를 말해보세요.
>> 25
25보다 큰 숫자를 말해보세요.
>> 30
30보다 작은 숫자를 말해보세요.
>> 27
잘하셨어요! 정답은 숫자 27이었습니다.
```
```
컴퓨터가 1부터 31의 숫자 중 하나를 골랐습니다! 맞춰보세요!
총 5번의 기회가 있습니다.
>> 15
15보다 큰 숫자를 말해보세요.
>> 16
16보다 큰 숫자를 말해보세요.
>> 17
17보다 큰 숫자를 말해보세요.
>> 18
18보다 큰 숫자를 말해보세요.
>> 19
19보다 큰 숫자를 말해보세요.
기회를 모두 사용해버렸습니다.
정답은 22이었습니다.
```

[📎 '2015-09-25-python_assignment4.py' 다운로드]({{ site.url }}/assets/file/2015-09-25-python_assignment4.py)
