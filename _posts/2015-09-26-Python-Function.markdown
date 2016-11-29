---
layout: post
title:  "3장: Function"
date:   2015-09-26 03:41:01 +0900
category: Python
image:  2015-09-24-Python-Hello-World.jpg
---

3장에서는 아래의 내용을 설명할 것입니다:

- `def`를 사용하여 함수 생성
- `time.sleep()`

#### **`def`를 사용하여 함수 생성**

프로그래밍을 하다 보면 같은 내용을 반복해서 작성해야 할 때가 가끔 있을 것입니다. 그걸 일일이 치는 것은 손가락도 아프고 소스 코드 가독성도 나빠지게 됩니다. 이럴 때 함수라는 것을 구현해놓으면 더 간편해지게 됩니다.

여기서 말하는 함수는 고등학교 때 배웠던 `f(x) = x * 2` 이런 함수와 같다고 볼 수 있습니다.

함수는 아래와 같이 선언이 가능합니다.

``` python
def 함수이름(입력 인수):
        내용
```

예제로 숫자를 넣으면 2배가 되는 함수를 작성해보면 아래와 같이 작성할 수 있습니다:

``` python
def double(x):
        return x * 2
number = input()
print 'double(' + str(number) + ') = ' + str(double(number))
```
```
1024
double(1024) = 2048
```

'입력 인수'는 여러 개 넣을 수 있습니다.

```python
def multiplication(x, y, z):
        return x * y * z
print multiplication(1024, 2048, 4096)
```
```
8589934592
```


#### **Dungeon of University**

함수를 사용하여 'Dungeon of University'라는 간단한 게임을 만들어보도록 하겠습니다.

```
새학기가 시작되어 수업에 들어왔다!
학생의 예상 학점은 4.5이다!
1. 공부하기
2. 잠자기
3. 밤샘
>> 1
-----------------------------
학생의 공부하기!
효과는 뛰어났다!
-----------------------------
=============================
교수님의 쪽지시험!
=============================
학생의 예상 학점은 4.5이다!
1. 공부하기
2. 잠자기
3. 밤샘
>> 1
-----------------------------
학생의 공부하기!
효과는 조금 부족한 듯 하다.
-----------------------------
=============================
교수님의 과제!
=============================
학생의 예상 학점은 4.3이다!
1. 공부하기
2. 잠자기
3. 밤샘
>> 3
-----------------------------
학생은 밤을 새워 페이스북을 했다!
아무 일도 일어나지 않았다.
-----------------------------
=============================
교수님의 영어수업!
학생의 멘탈이 붕괴되었다!
=============================
학생의 예상 학점은 4.1이다!
1. 공부하기
2. 잠자기
3. 밤샘
>> 2
-----------------------------
학생의 잠자기!
학생은 잠들어버렸다!
태도 점수가 감점되었다!
-----------------------------
=============================
교수님의 쪽지시험!
=============================
학생의 예상 학점은 3.9이다!
1. 공부하기
2. 잠자기
3. 밤샘
>> 1
-----------------------------
학생의 공부하기!
효과는 조금 부족한 듯 하다.
-----------------------------
=============================
교수님의 쪽지시험!
=============================
학생의 예상 학점은 3.8이다!
1. 공부하기
2. 잠자기
3. 밤샘
>> 1
-----------------------------
학생의 공부하기!
효과는 뛰어났다!
-----------------------------
=============================
<< 교수님은 중간고사를 공지했다 >>
=============================
학생의 예상 학점은 3.9이다!
1. 공부하기
2. 잠자기
3. 밤샘
>> 3
-----------------------------
학생은 밤을 새워 페이스북을 했다!
아무 일도 일어나지 않았다.
-----------------------------
=============================
교수님의 중간고사!
효과는 뛰어났다!
=============================
학생의 예상 학점은 2.4이다!
학생은 지니고 있던 장학금을 잃어버렸다!
학생은 녹색병에 든 액체를 마셨다.
시야가 흐려진다...
```

```python
#-*- coding: utf-8 -*-

import random
import time

credit = 4.5
examNotice = False
giveup = False
turn = 0

def intro():
	print '새학기가 시작되어 수업에 들어왔다!'

def showCredit():
	print '학생의 예상 학점은 ' + str(credit) + '이다!'

def chooseSkill():
	global credit

	print '1. 공부하기'
	print '2. 잠자기'
	print '3. 밤샘'
	skillNumber = input('>> ')
	print '-----------------------------'
	if skillNumber == 1:
		print '학생의 공부하기!'
		time.sleep(1)
		if random.randint(0, 1) == 1:
			print '효과는 뛰어났다!'
			credit += 0.1
		else:
			print '효과는 조금 부족한 듯 하다.'

	if skillNumber == 2:
		print '학생의 잠자기!'
		time.sleep(1)
		print '학생은 잠들어버렸다!'
		time.sleep(1)
		print '태도 점수가 감점되었다!'
		credit -= 0.1

	if skillNumber == 3:
		print '학생은 밤을 새워 페이스북을 했다!'
		time.sleep(1)
		print '아무 일도 일어나지 않았다.'
	print '-----------------------------'

def professorSkill():
	global credit
	global examNotice
	global giveup
	global turn

	print '============================='
	if examNotice == False:
		if turn < 5:
			skillNumber = random.randint(1, 3)
			if skillNumber == 1:
				print '교수님의 영어수업!'
				time.sleep(1)
				print '학생의 멘탈이 붕괴되었다!'
				credit -= 0.2

			if skillNumber == 2:
				print '교수님의 쪽지시험!'
				time.sleep(1)
				credit -= 0.1

			if skillNumber == 3:
				print '교수님의 과제!'
				time.sleep(1)
				credit -= 0.2
		else:			
			print '<< 교수님은 중간고사를 공지했다 >>'
			time.sleep(2)
			examNotice = True
	else:
		print '교수님의 중간고사!'
		time.sleep(1)
		print '효과는 뛰어났다!'
		credit -= 1.5
		giveup = True
	turn += 1
	print '============================='

def end():
	showCredit()
	print '학생은 지니고 있던 장학금을 잃어버렸다!'
	time.sleep(1)
	print '학생은 녹색병에 든 액체를 마셨다.'
	time.sleep(1)
	print '시야가 흐려진다...'

intro()
while giveup == False:
	showCredit()
	chooseSkill()
	professorSkill()
end()
```
[📎 'dungeon_of_university.py' 다운로드]({{ site.url }}/assets/file/2015-09-26-dungeon_of_university.py)

#### **Flow Chart**

'Dungeon of University'의 흐름도를 간단하게 그려보면 아래와 같습니다.

프로그래밍을 할 때 간단하게 흐름도를 그리고 시작하면 작업하기가 수월해집니다.

![Dungeon of University - Flow Chart]({{ site.url }}/assets/image/2015-09-26-Dungeon-of-University-Flow-Chart.png)

#### **`global` 변수**

`def`로 구현한 함수에서는 함수밖에 있는 변수에 접근을 할 수 없습니다. 만약 함수밖에 있는 변수에 접근하려면 `global`을 사용하면 됩니다.

```python
credit = 4.5
def showCredit():
	print '학생의 예상 학점은 ' + str(credit) + '이다!'
showCredit()
```

#### **`time.sleep()`**

`time.sleep(n)`을 사용하면 n초만큼 파이썬 프로그램을 일시 중지합니다.

```python
print '학생은 지니고 있던 장학금을 잃어버렸다!'
time.sleep(1)
print '학생은 녹색병에 든 액체를 마셨다.'
time.sleep(1)
print '시야가 흐려진다...'
```

위와 같이 프로그래밍을 하게 되면 1줄 출력되고 1초 멈춘 다음다음 문장을 출력하게 됩니다.
