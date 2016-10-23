---
layout: post
title:  "1장: \"Hello World!\""
date:   2015-09-24 09:20:27 +0900
category: Python
image:  2015-09-24-Python-Hello-World.jpg
---

1장에서는 아래의 내용을 설명할 것입니다:

- Python 설치
- 프로그램 작성
- 연산
- 변수
- 문자열
- `print`
- `raw_input()`

#### **Python 설치**

* Windows 또는 Mac OS X
'[Python 다운로드 페이지](https://www.python.org/downloads/release/python-2712)'에 접속하여 설치 파일을 다운로드해 설치합니다.

* Ubuntu 16.04 LTS

```bash
$ sudo apt install python
$ python --version
```
```
Python 2.7.12
```

#### **Python 사용법과 간단한 수학 계산**

##### **Python 사용법**

* Windows 또는 Mac OS X

`IDLE (Python GUI)`을 실행합니다.

* Ubuntu 16.04 LTS

터미널에 `python` 명령어를 입력하면 실행됩니다.

```bash
$ python
```
``` python
Python 2.7.12 (default, Jul  1 2016, 15:12:24)
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

##### **연산**

`>>>`에 `2+2`를 입력해보겠습니다.

``` python
Python 2.7.12 (default, Jul  1 2016, 15:12:24)
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> 2+2
4
>>>
```

`4`를 출력합니다.

##### **산술 연산자 종류**

| 시퀀스 | 의미 |
| :------------ | :------------ |
| 기본 할당 | a=b |
| 덧셈 | a+b |
| 뺄셈 | a-b |
| 곱셈 | a*b |
| 나눗셈 | a/b |
| 모듈러 (나머지) | a%b |

**예)**

``` python
>>> 2+2+2
6
>>> 1048576*1048576
1099511627776
>>> 2+3*3
11
>>> 2 +       12
14
>>>
```

#### **변수**

변수는 데이터를 저장하는 공간입니다.

변수의 이름은 최대한 의미 있는 이름으로 지어줍니다.

##### **변수의 선언**

아래와 같은 방법으로 선언할 수 있습니다.

``` python
>>> favorite = 1004
```

`favorite` 변수에 값 `1004`을 저장하였습니다.

`>>>`에 변수명을 입력하면 값을 출력할 수 있습니다.

``` python
>>> favorite = 1004
>>> favorite
1004
>>>
```

##### **변수의 연산**

아래와 같이 변수로도 연산이 가능합니다.

``` python
>>> favorite = 4
>>> favorite + 6
10
```

``` python
>>> favorite = 10 + 4
>>> favorite
14
```

``` python
>>> dogs = 2
>>> cats = 1
>>> total = dogs + cats
>>> total
3
```

#### **문자열**

지금까지는 변수에 정수를 저장하였습니다.

이제 변수에 텍스트를 저장해보겠습니다.

``` python
>>> name = 'KyuHyuk Lee'
>>> name
'KyuHyuk Lee'
```

아래와 같이 문자열과 문자열을 합칠 수도 있습니다.

```
>>> name = 'KyuHyuk Lee'
>>> 'Hello, ' + name + '!'
'Hello, KyuHyuk Lee!'
```

하지만 문자열과 정수는 자료형이 달라 합칠 수가 없습니다.

``` python
>>> 'My favorite number is ' + 7
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: cannot concatenate 'str' and 'int' objects
```

정수를 문자열로 입력하거나 형 변환을 해야 합니다.

**예 1)**

``` python
>>> 'My favorite number is ' + '7'
'My favorite number is 7'
```

**예 2)**

``` python
>>> 'My favorite number is ' + str(7)
'My favorite number is 7'
```

#### **프로그램 작성**

* Windows 또는 Mac OS X

1. `IDLE (Python GUI)`을 실행합니다.
2. `File` - `New File`
	단축키: <kbd>Ctrl</kbd> + <kbd>N</kbd>
3. 코드 작성
4. `Run` - `Run Module`
	단축키: <kbd>F5</kbd>

* Ubuntu 16.04 LTS

1. 코드 작성
	예) `vi hello.py`
2. 실행
	예) `python hello.py`


#### **[예제 1] 이름이 어떻게 되시나요?**

``` python
#-*- coding: utf-8 -*-
# 이 프로그램은 이름을 물어보고 인사하는 프로그램입니다.
print '이름이 어떻게 되시나요?'
name = raw_input()
print name + '님 만나서 반가워요!'
```

```
이름이 어떻게 되시나요?
이규혁
이규혁님 만나서 반가워요!
```

##### **Python 소스 코드 인코딩 정의**

소스 코드 첫 줄에  `#-*- coding: utf-8 -*-`를 추가하여 소스 코드 인코딩을 `utf-8` 타입으로 정의할 수 있습니다.

만약 정의를 안 하게 된다면 한글이 모두 깨져서 출력될 것입니다.

자세한 내용은 '[PEP 263 -- Defining Python Source Code Encodings](https://www.python.org/dev/peps/pep-0263)'을 읽어보시길 바랍니다.

##### **주석**

`#` 뒤에 주석을 달수 있습니다. 주석은 어디든지 사용 가능하며 `#` 뒤에 있는 내용은 무시되어 실행되지 않습니다.

여러 줄의 주석 작성은 `'''`을 사용하여 아래와 같이 할 수 있습니다.

``` python
# 한 줄만 작성할 수 있는 주석입니다.
'''
여러 줄
작성할 수 있는
주석입니다.
'''
```

##### **raw_input()**

`raw_input()`는 값을 입력받아 변수에 문자열로 저장합니다.

`favorite = raw_input()`을 하여 받은 값은 `4`가 아닌 `'4'`가 됩니다.

만약 정수나 실수로 변수에 저장하고 싶다면 `input()`을 사용하면 됩니다.

#### **[예제 2] 내가 좋아하는 것들**

``` python
#-*- coding: utf-8 -*-
# 내가 좋아하는 것들
print '좋아하는 음식을 알려주세요!'
favoriteFood = raw_input()

print '좋아하는 숫자를 알려주세요!'
favoriteNumber = raw_input()

# 내가 좋아하는 것들을 출력
print '당신은 아래의 것들을 좋아하시는군요?'
print '음식: ' + favoriteFood
print '숫자: ' + favoriteNumber
```

```
좋아하는 음식을 알려주세요!
신라면
좋아하는 숫자를 알려주세요!
3.14
당신은 아래의 것들을 좋아하시는군요?
음식: 신라면
숫자: 3.14
```

#### **변수 이름 지정**

1. 의미 있는 변수 이름 사용
위의 예제처럼 `favoriteFood`, `favoriteNumber`로 변수의 이름을 사용하는 것이 편할까요? 아니면 `a`, `b`와 같이 변수 이름을 사용하는 것이 더 편할까요? 변수가 사용되는 것에 알맞게 의미를 부여해서 변수 이름을 사용하는 것을 권장합니다.

2. 대문자와 소문자를 사용하여 구분
`favoritenumber`와 `favoriteNumber`와 어느 것이 더 이해가 잘 되나요? 아마 `favoriteNumber`일 것입니다. 대소문자로 구별하여 변수 이름을 더 쉽게 볼 수 있게 할 수 있습니다.
