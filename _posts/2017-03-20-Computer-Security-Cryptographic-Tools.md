---
layout: post
title:  "컴퓨터 보안 - 2. 암호화 도구(Cryptographic Tools)"
date:   2017-03-20 16:47:23 +0900
category: Computer-Security
---

## 대칭 암호화 (Symmetric Encryption)

- 전송되거나 저장된 데이터에 대한 기밀성을 제공하기 위한 보편적인 기술

- 널리 사용되고 있는 암호화 또는 단일 키 암호화라고도 합니다.

- 1970년대에 공개키 암호화가 생기기 전에는 유일한 대안이었지만 지금도 여전히 많이 사용하고 있습니다.

- 안전한 사용을 위한 두 가지 요구 사항 :
	- 강력한 암호화 알고리즘 필요
	- 발신자와 수신자는 안전한 방식으로 비밀 키의 사본을 확보해야 하며 키를 안전하게 보관해야 합니다.

- 구성 요소:
	- 평문
	- 암호화 알고리즘
	- 비밀 키
	- 암호문
	- 암호 해독 알고리즘

아래의 그림과 같이 평문을 비밀키를 사용하여 암호화한 뒤, 암호문을 발송합니다.

수신자는 비밀키를 사용하여 복호화 하여 평문을 얻습니다.

이때 사용하는 비밀키는 발신자와 수신자 모두 같은 비밀키여야 합니다.

![Simplified Model of Symmetric Encryption]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_0.png)

## 대칭 암호화 공격

### 암호 해독 공격 (Cryptanalytic Attacks)

- 아래에 의존합니다:
	- 알고리즘의 특성
	- 평문의 일반적인 특징에 대한 약간의 지식
	- 일부 '평문(plaintext) - 암호문(ciphertext)' 쌍의 샘플

- 특정 평문이나 사용된 키를 추론하려고 알고리즘의 특성을 활용합니다.
	- 성공하면 해당 키로 암호화된 모든 메시지가 유출됩니다.

### 무작위 대입 공격 (Brute-Force Attack)

- 암호를 풀기 위해 가능한 모든 값을 대입합니다.
	- 성공을 위해 모든 가능한 키의 평균의 절반을 시도해야 합니다.

## 파이스텔 (Feistel) 암호 구조

![Classical Feistel Network]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_1.jpg)

파이스텔 암호(Feistel cipher)는 블록 암호의 일종으로, 암호화 방식이 특정 계산 함수의 반복으로 이루어집니다.

각 과정에 사용되는 함수는 라운드 함수(Round Function)라고 합니다.

### 블록 암호화 구조

- 대칭 블록 암호는 다음으로 구성됩니다:
	- 라운드 순서
	- 키에 의해 제어되는 치환(Substitution) 및 전치(Permutations)

## Data Encryption Standard (DES)

- 가장 널리 사용되는 암호화 체계
	- FIPS PUB 46
	- 데이터 암호화 알고리즘 (Data Encryption Algorithm, DEA)
	- 64 비트 평문 블록과 56 비트 키를 사용하여 64 비트 암호문 블록 생성

- 견고성의 우려:
	- 알고리즘에 대한 염려
		- DES는 현재 가장 많이 연구된 암호화 알고리즘입니다.
	- 56 비트 키 사용
		- 전자 프론티어 재단(EFF)은 1998년 7월에 DES 암호화가 깨졌다고 발표했습니다.

## Triple DES (3DES)

- 두 개 또는 세 개의 고유 키를 사용하여 기본 DES 알고리즘을 세 번 반복합니다.
- 1985 년 ANSI 표준 X9.17의 금융 응용 프로그램에 처음으로 표준화되었습니다.
- 장점:
	- 168 비트 키 길이가 DES의 무차별 공격에 대한 취약점을 극복합니다.
	- 기본 암호화 알고리즘은 DES와 동일합니다.
- 단점:
	- 알고리즘이 소프트웨어에서 느림.
	- 64 비트 블록 크기를 사용합니다.

## Advanced Encryption Standard (AES)

- Triple DES (3DES)를 대체하기 위해 생겼습니다.
	- 3DES는 장기간 사용하기에 합리적이지 않았습니다.
- NIST는 1997년에 개선된 암호 기법을 공모하였으며, 선정될 암호의 정식 명칭은 AES로 정해졌다.
	- 3DES와 같거나 그보다 우수한 보안 강도를 가져야 했다.
	- 효율성 향상
	- 대칭 블록 암호
	- 128 비트 데이터 및 128/192/256 비트 키
- 2001년 11월에  Rijndael이 AES로 최종 선택되었다.
	- FIPS 197로 공포하였다.

## 암호 기법 (Cryptography)

- 세 가지로 분류합니다:
	- 평문을 암호문으로 변환하는 데 사용되는 연산 유형:
		- **치환(Substitution)**: 평문의 각 요소는 다른 요소에 매핑됩니다.
		- **전치(Transposition)**: 텍스트의 순서가 재배열됩니다.
	- 사용된 키의 수:
		- 발신자와 수신자가 동일한 키 - **대칭(Symmetric)**
		- 발신자와 수신자가 서로 다른 키 - **비대칭(Asymmetric)**
	- 평문이 처리되는 방식:
		- 블록 암호(block cipher): 한 번에 한 블록의 요소 입력을 처리합니다.
		- 스트림 암호(stream cipher): 입력 요소를 연속적으로 처리합니다

## 컴퓨터 보안 암호화 체계

- 암호화는 다음과 같은 경우 계산상으로 안전합니다:
	- 해독 비용이 복호화 된 정보의 가치를 초과
	- 해독 시간이 정보의 유효한 수명주기를 초과
- 무작위 대입 공격의 시간/비용을 예측 가능

## 현실적인 보안 문제

- 일반적으로 대칭 암호화는 단일 64 비트 또는 128 비트 블록보다 큰 데이터 단위에 적용됩니다.
- 전자 코드북(ECB: Electronic Code Book) 모드는 다중 블록 암호화에 대한 가장 간단한 접근법입니다.
	- 평문의 각 블록은 동일한 키를 사용하여 암호화됩니다.
	- 동일한 평문 블록에 대해 항상 동일한 암호문이 출력되므로 암호 해독이 쉽습니다.
- 작동 모드
	- 커다란 시퀀스에 대한 대층 블록 암호화의 보안을 강화한 대체 기술을 개발
	- ECB의 약점을 극복

## 블록 암호 운용 방식

### 전자 코드북 (ECB:  Electronic Code Book)

- 가장 단순한 모드
- 평문(plaintext)은 한 번에 b 비트 씩 처리되며 각 블록은 동일한 키를 사용하여 암호화됩니다.
- 각 평문 블록에 대해 고유 한 암호문 값을 갖고 있기 때문에 "코드북"이라고 합니다.
	- 반복되는 암호문에서 반복되는 일반 텍스트가 보이기 때문에 긴 메시지에 대해 보안되지 않습니다.
- 동일한 평문 블록을 반복한다면 보안 결함을 극복하기 위해 다른 암호문 블록을 생성하는 기술이 필요합니다.

### 암호 블록 체인 방식 (CBC: Cipher Block Chaining)

- 평문의 각 블록은 XOR연산을 통해 이전 암호문과 연산되고 첫번째 암호문에 대해서는 IV(Initial Vector)가 암호문 대신 사용. 이 때, IV는 제 2의 키가 될 수 있습니다.
- 암호화가 병렬처리가 아닌 순차적으로 수행되어야 합니다.

![CBC Encryption]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_2.png)

![CBC Decryption]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_3.png)

### 암호 피드백 (CFB: Cipher Feedback)

- 블록 암호화를 스트림 암호화처럼 구성해 평문과 암호문의 길이가 같습니다.

![CFB Encryption]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_4.png)

![CFB Decryption]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_5.png)

### 카운터 (CTR: Counter)

- 블록을 암호화할 때마다 1씩 증가해 가는 카운터를 암호화 해서 키 스트림을 만듭니다.
- 카운터를 암호화한 비트열과 평문블록과의 XOR를 취한 결과가 암호문 블록이 됩니다.

![CTR Encryption]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_6.png)

![CTR Decryption]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_7.png)

## 블록 및 스트림 암호

### 블록 암호 (Block Cipher)

- 입력 요소를 한 번에 하나씩 처리합니다.
- 각 입력 블록에 대한 출력 블록을 생성합니다.
- 키 재사용 가능

### 스트림 암호 (Stream Cipher)
- 입력 요소를 지속적으로 처리합니다.
- 한 번에 한 요소 씩 출력합니다.
- 주요 이점은 거의 항상 빠르며 코드 사용이 훨씬 적다는 것입니다.
- 한 번에 한 바이트 씩 평문을 암호화합니다.
- 의사 난수 스트림은 입력 키를 알지 못하면 예측할 수없는 스트림입니다.
- 설계 고려 사항 :
	- 암호화 시퀀스에 큰 기간이 있어야 합니다.
	- 키 스트림은 난수 속성과 유사합니다.
	- 충분히 긴 키 사용

## 메시지 인증 ((Message Authentication)

- 공격으로부터 보호합니다.
- 수신된 메시지가 진짜임을 확인합니다.
	- 내용이 변경되지 않았나 확인
	- 확실한 출처로부터 왔나 확인
	- 순서와 시간이 정확 한가 확인
- 기존의 암호화를 사용 가능합니다.
	- 발신자와 수신자 만 키 공유

## 메시지 인증 코드 (Message Authentication Codes)

- MAC(Message Authentication Codes) 알고리즘은 비밀 키를 입력받고, 임의-길이의 메시지를 인증합니다.

- MAC 값은 검증자(비밀 키를 소유한 사람)의 허가에 의해서 메시지의 데이터 인증과 더불어 무결성을 보호합니다.

![Message Authentication Using a Message Authentication Code]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_7.png)

## 해시(Hash) 함수 요구 사항

- 모든 크기의 데이터 블록에 적용할 수 있어야 합니다.
- 고정 길이 출력을 생성해야 합니다.
- H(x)는 주어진 x에 대해 상대적으로 계산하기 쉬워야 합니다.
- 임의의 해시값이 주어질 때 그것에 해당하는 입력값을 구하는 것이 계산상 불가능해야 합니다.
	- `H(x) = h`가 되는 `x`를 찾기란 계산 상 불가능해야 합니다.
- 입력값과 해당 해시값이 있을 때, 이 해시값에 해당하는 또 다른 입력값을 구하는 것은 계산상 불가능해야 합니다.
	- H (y) = H (x)가 되도록 y ≠ x를 찾기 란 계산상 불가능해야 합니다.
- 같은 해시값을 가지는 서로 다른 입력이 없어야 합니다.
	- H (x) = H (y)가 되도록 어떤 쌍 (x, y)을 찾는 것은 계산상 불가능해야 합니다.

## 해시 함수의 보안

- 해시 함수를 공격하는 데는 두 가지 방법이 있습니다:
	- **암호 해독(Cryptanalysis)**: 알고리즘의 논리적 약점을 이용
	- **무작위 대입 공격(Brute-Force Attack)**: 해시 함수의 강도는 알고리즘에 의해 생성된 해시 코드의 길이에만 의존합니다.

- SHA는 가장 널리 사용되는 해시 알고리즘입니다.

- 부가적인 해시 함수 응용 프로그램 :
	- **암호(Passwords)**: 암호 해시는 운영 체제에 의해 저장됩니다
	- **침입 탐지(Intrusion Detection)**: 시스템의 각 파일에 대해 H(F)를 저장하고 해시 값을 보호합니다.

## Secure Hash Algorithm (SHA)

- SHA는 NIST에서 개발했습니다.
- 1993 년 FIPS 180으로 발표
- 1995 년에 SHA-1로 개정되었습니다.
   - 160 비트 해시 값 생성
- NIST는 2002년에 개정된 FIPS 180-2를 발표했습니다.
	- SHA의 세 가지 추가 버전을 추가: *SHA-256*, *SHA-384*, *SHA-512*
	- 256 / 384 / 512 비트 해시 값 포함
	- SHA-1과 동일한 기본 구조이지만 더 강력한 보안성을 가지고 있습니다.
- 2005년, 중국의 한 학자에 의해 SHA1 해시 알고리즘이 해독되었습니다.

## SHA-3

- SHA-1과 SHA-2를 대체하기 위해 만들어졌습니다.
- SHA-3 평가 기준:
	- SHA-2가 지원하는 주요 애플리케이션에 대한 요구 사항을 반영하도록 설계되었나
		- 디지털 서명, 해시 된 메시지 인증 코드, 키 생성 및 의사 난수 생성
	- 보안:
		- SHA-2 함수에 대한 잠재적인 공격에 저항할 수 있도록 설계되어야 합니다.
	- 비용:
		- 다양한 하드웨어 플랫폼에서 시간과 메모리 모두 효율적이어야 합니다.
- NIST는 2015년에 SHA-3을 발표하였습니다.

## HMAC (Hash-based Message Authentication Code)

- 암호화 해시 코드에서 파생된 MAC을 개발하는 데 관심이 있었습니다:
	- 암호화 해시 함수는 일반적으로 더 빠르게 실행됩니다.
	- SHA-1은 비밀 키에 의존하지 않으므로 MAC 용으로 설계되지 않았습니다.

- IP 보안을 위한 필수 MAC 구현으로 선택:
	- TLS (Transport Layer Security) 및 SET (Secure Electronic Transaction)과 같은 인터넷 프로토콜에 사용됩니다.

## HMAC 디자인 목표

- 수정 없이 사용 가능한 해시 함수 사용
- 간단한 방법으로 키를 사용하고 처리
- 현저한 성능 저하 없이 해시 함수의 본래 성능을 보존
- 더 빠르고 안전한 해시 함수가 있거나 필요하다면 기존의 해시 함수를 쉽게 바꿀 수 있도록 합니다.
- 내장된 해시 함수가 충분히 강하다면 인증 메커니즘의 강도에 대한 암호해독의 정도를 확실히 파악할 수 있도록 합니다.

## 공개키 암호화 (Public-Key Encryption)

- 1976년 Diffie와 Hellman이 제안
- 수학적 함수에 기초
- 비대칭 (Asymmetric)
	- 두 개의 개별 키 사용
	- 공개 키 및 개인 키
	- 공개 키는 다른 사람들이 사용할 수 있도록 공개됩니다.
- 배포를 위해 프로토콜이 필요합니다.

![Public-Key Cryptography]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_9.png)

- 평문(Plaintext): 판독 가능 메시지 또는 입력으로서 알고리즘에 공급되는 데이터
- 암호화 알고리즘(Encryption Algorithm): 일반 텍스트에 대한 변환을 수행합니다.
- 공개 키 및 개인 키(Public and Private Key): 한 쌍의 키, 하나는 암호화 용, 다른 하나는 암호 해독 용
- 암호문(Ciphertext): 출력으로 생성되어 암호화된 메시지
- 해독 키(Decryption Key): 원래의 평문을 만들게 합니다.

![Applications for Public-Key Cryptosystems]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_10.png)

## 공개 키 암호 시스템에 대한 요구 사항

- 계산적으로 간단하게 키 쌍 생성
- 각 역할에 대해 키를 사용할때 유용해야한다.
- 계산적으로 송신자가 공개 키로 메시지를 암호화하는게 간단해야한다.
- 상대방이 원본 메시지를 복구 할 수 없다는게 계산상 불가능해야한다.
- 수신자가 비밀 키를 알고 암호문을 해독하는 것이 계산적으로 간단해야한다.
- 상대방이 공개 키에서 개인 키를 판별하는 것이 계산상 불가능해야한다.

## 비대칭 암호화 알고리즘

### RSA (Rivest, Shamir, Adleman)

- 라이베스트(Rivest), 샤미르(Shamir), 애들먼(Adleman)이 1977년 MIT에서 만들었습니다.
- 가장 널리 사용되는 공개키 암호시스템
- 평문과 암호문이 일부 n에 대해 0과 n-1 사이의 정수인 블록 암호

### 디피-헬만 키 교환 알고리즘 (Diffie-Hellman key exchange algorithm)

- 암호 키를 교환하는 하나의 방법
- 두 사람이 암호화되지 않은 통신망을 통해 공통의 비밀 키를 공유

## 기타 공개 키 알고리즘

### 전자 서명 표준 (DSS: Digital Signature Standard)

- SHA-1을 사용한 디지털 서명 기능만 제공
- 암호화 또는 키 교환에 사용할 수 없습니다.
- 디지털 서명 기능 만 제공하도록 설계된 알고리즘을 사용합니다.

### 타원 곡선 암호화 (ECC: Elliptic Curve Cryptography)

- RSA가 제시한 공개 키 암호 표준(PKCS) 중 타원 곡선 암호에 기반을 둔 공개 키 기술
- 타원 곡선으로 알려진 수학적 구조를 기반으로 합니다.
- RSA보다 작은 크기에 비해 동일한 보안
- ECC의 신뢰 수준은 아직 RSA의 신뢰 수준만큼 높지 않습니다.

## 전자 서명 (Digital Signatures)

- 소스 및 데이터 무결성을 인증하는 데 사용됩니다.
- 해시 코드를 개인 키로 암호화하여 생성
- 기밀성을 제공하지 않습니다.
	- 완전한 암호화의 경우에도 마찬가지입니다.
	- 메시지는 변조로부터 안전하지만 도청은 안전하지 않습니다.

![Digital Signatures]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_11.png)

- 문서 A를 전자 서명하는 방법:
	1. 문서의 데이터의 해시값을 생성합니다.
	2. 생성된 해시값을 비밀키(Private key)로 암호화(Encryption) 한 후 문서에 첨부합니다.

- 문서 A의 전자 서명을 확인하는 방법:
	1. 서명 부분만 분리하여 공개키(Public key)로 복호화(Decryption) 합니다.
	2. 문서에서 서명을 제외한 데이터의 해시값을 생성합니다.
	3. 두 개의 값이 일치하는지 확인합니다.
		- 일치하면 서명된 문서
		- 그렇지 않으면 서명되지 않은 문서

## 키 배포 (Key Distribution)

- 다른 사람이 키를 볼 수 없도록 데이터를 교환하려는 두 당사자에게 키를 전달하는 방법

- 두 당사자 (A와 B)는 다음을 통해 키를 배포할 수 있습니다.
	1. 키는 A에 의해 선택되고 B에 물리적으로 전달
	2. 제 3자가 키를 선택하여 A와 B에게 물리적으로 전달
	3. A와 B가 이전에 그리고 최근에 키를 사용했다면, 한 당사자는 새로운 키를 다른 키로 전송하고 이전 키를 사용하여 암호화
	4. A와 B 각각이 제 3 자 C와 암호화된 연결을 가지고 있다면 C는 A와 B에 대한 암호화된 링크에 키를 전달

![Automatic Key Distribution for Connection-Oriented Protocol]({{ site.url }}/assets/image/2017-03-20-Computer-Security-Cryptographic-Tools_12.jpg)

## 커베로스 (Kerberos)

- MIT에서 개발되었습니다.
- 소프트웨어 유틸리티는 공개 도메인과 상업적으로 지원되는 버전으로 제공됩니다.
- 인터넷 표준으로 발행되었으며 원격 인증을 위한 표준입니다.
- 전반적인 계획은 신뢰할 수 있는 제 3자 인증 서비스의 계획입니다.
- 사용자는 호출된 각 서비스에 대한 자신의 신원을 증명하고 서버가 클라이언트에게 신원을 증명하도록 요구합니다.
- 신뢰를 바탕으로 한 제 3기관에 의한 인증

## 커베로스 (Kerberos) Protocol

- 클라이언트, 응용 프로그램 서버 및 커베로스  (Kerberos) 서버 관련:
	- 클라이언트 / 서버 통신 보안에 대한 다양한 위협에 대응할 수 있도록 설계되었습니다.
	- 확실한 보안 위험은 흉내 내는 것(impersonation) 입니다.
	- 서버는 서비스를 요청한 클라이언트의 신원을 확인할 수 있어야 합니다.
- 인증 서버 (AS: Authentication Server) 사용:
	- 사용자는 처음에 신원 확인을 위해 인증서버와 통신합니다.
	- 인증서버는 신원을 확인한 뒤 응용 프로그램 서버로 정보를 전달합니다. 그런 다음 응용 프로그램 서버는 클라이언트의 서비스 요청을 수락합니다.
- 아래의 내용을 안전하게 하는 방법을 찾아야 합니다:
	- 클라이언트가 네트워크를 통해 사용자의 암호를 인증서버로 전송하면 상대방이 암호를 볼 수 있습니다.
	- 상대방은 인증서버인척하면서 잘못된 확인을 보낼 수 있습니다.

## 커베로스 (Kerberos) 성능 문제

- Kerberos 서버를 별도의 격리된 시스템에 두면 대규모 Kerberos 보안에서의 Kerberos 성능 영향을 가장 잘 보장할 수 있습니다.

- 다중 영역에 대해서는 성능과 관련이 없으며 관리에 관련 있습니다.

## 인증 기관 (CA: Certificate Authority)

- 인증서는 다음으로 구성됩니다:
	- 공개 키와 키 소유자의 사용자 ID
	- 신뢰할 수 있는 제 3자의 서명
	- 일반적으로 제 3자는 사용자 커뮤니티(예 : 정부 기관 또는 금융 기관)가 신뢰하는 인증 기관입니다.

- 사용자는 자신의 공개 키를 안전한 방식으로 기관에 제시하고 인증서를 얻을 수 있습니다.
	- 그런 다음 사용자는 인증서를 사용할 수 있습니다.

## X.509 인증 서비스

- 공개키 인증서와 인증 알고리즘의 표준 가운데에서 공개 키 기반의 표준입니다.
	- IPsec, SSL, SET 및 S / MIME을 비롯한 네트워크 보안 응용 프로그램에 널리 사용됩니다.

- CCITT X.500 디렉터리 서비스 표준의 일부

- 공개 키 암호화와 디지털 서명에 사용됩니다.
	- 알고리즘은 표준화되지 않았지만 RSA를 권장합니다.

----
## Reference

- [Classical Encryption Techniques](https://notes.shichao.io/cnspp/ch2/)

- [Introduction to data encryption](https://morf.lv/introduction-to-data-encryption)

- [블록 암호 운용 방식 - 위키피디아](https://ko.wikipedia.org/wiki/블록_암호_운용_방식)

- [블록 암호 운용 방식](http://brownbears.tistory.com/302)

- [메시지 인증 코드 - 위키피디아](https://ko.wikipedia.org/wiki/메시지_인증_코드)

- [RSA와 전자서명](http://techpedia.tistory.com/9)
