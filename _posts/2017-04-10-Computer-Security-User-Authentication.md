---
layout: post
title:  "컴퓨터 보안 - 3. 사용자 인증 (User Authentication)"
date:   2017-04-10 14:20:58 +0900
category: Computer-Security
---

## 사용자 인증 (User Authentication)

사용자 신원을 인증하는 것은 아래의 4가지를 기반으로 합니다:

- 개인이 알고 있는 어떤 것: 암호, PIN, 사전 구성된 질문에 대한 답변

- 개인이 소유하고 있는 것 (Token): 스마트카드, 전자 키 카드, 물리적 키

- 정적 생체 인식 (Static Biometrics): 지문, 망막, 얼굴

- 동적 생체 인식 (Dynamic Biometrics): 음성 패턴, 필적, 타이핑 리듬

## 암호 인증 (Password Authentication)

- 많이 사용되는 침입자에 대한 방어 방법
	- 사용자는 이름 / 로그인 및 암호를 제공합니다.
	- 시스템은 지정된 로그인에 대해 저장된 암호와 암호를 비교합니다.

- 사용자 ID:
	- 사용자가 시스템에 액세스할 수 있는 권한이 있는지를 결정합니다.
	- 사용자의 권한을 결정합니다.
	- 임의 액세스 제어에 사용됩니다.

## 암호 취약성 (Password Vulnerabilities)

- 오프라인 사전 공격 (Offline Dictionary Attack)
- 특정 계정 공격 (Specific Account Attack)
- 자주 사용되는 암호 공격 (Popular Password Attack)
- 단일 사용자에 대한 암호 추측 (Password Guessing Against Single User)
- 워크스테이션 하이재킹 (Workstation Hijacking):
	- 컴퓨터를 켜놓고 잠깐 자리를 비운 사이 아직 로그인되어 있는 사이트에 공격자가 앉아서 공격을 하는 방법
- 사용자 실수 착취 (Exploiting User Mistakes)

## 대책

- 암호 파일에 대한 무단 접근을 방지합니다.
- 침입 탐지 대책을 세웁니다.
- 손상된 암호의 신속한 재발행.
- 계정 잠금 처리 방법
- 사용자가 공통 암호를 선택할 수 없도록 하는 정책
- 암호 정책 교육 및 시행
	- 9자 이상의 암호를 사용
	- 대문자/소문자, 특수문자 등등을 포함
- 워크스테이션이 자동으로 로그아웃되게 설정
- 네트워크 장치에서 유사한 암호에 대한 정책

## Salt

![UNIX Password Scheme]({{ site.url }}/assets/image/2017-04-10-Computer-Security-User-Authentication_0.jpg)

- 솔트(Salt)는 단 방향 해시 함수에서 다이제스트를 생성할 때 추가되는 바이트 단위의 임의의 문자열입니다.

## Salt 작동 방식

- Salt가 없는 경우:
	1. 사용자가 사용자 ID `X`, 비밀번호 `P`를 입력합니다.
	2. 시스템은 `X`의 암호 해시에 저장된 `H`를 찾습니다.
	3. 시스템은 `h(P) = H` 인지 여부를 테스트합니다.

- Salt가 있는 경우:
	1. 사용자가 사용자 ID `X`, 비밀번호 `P`를 입력합니다.
	2. 시스템은 `S`와 `H`를 찾으며, `S`는 사용자 ID `X`에 대한 임의의 Salt이고 `H`는 `S`와 `X`의 암호 해시에 저장됩니다.
	3. 시스템이 `h (S || P) = H` 인지 여부를 테스트합니다.

## 암호 크래킹 (Password Cracking)

- 사전 공격 (Dictionary Attacks):
	- 가능한 암호의 커다란 사전을 만들고 암호 파일에 대해 각각을 시도합니다.
	- 각 암호는 각 Salt 값을 사용하여 해시되어야 하고 저장된 해시 값과 비교되어야 합니다.

- 무지개 테이블 공격 (Rainbow Table Attacks):
	- 모든 Salt에 대한 해시 값의 표를 사전에 계산합니다.
	- 거대한 해시 값 테이블
	- 충분히 큰 Salt 값과 충분히 큰 해시 길이를 사용하여 무지개 테이블 공격을 막을 수 있습니다.

## 암호 파일 액세스 제어 (Password File Access Control)

- 암호화된 암호에 대한 액세스를 거부하여 오프라인 추측 공격을 차단할 수 있습니다.
	- 권한이 있는 사용자에게만 제공
	- 섀도(Shadow) 암호 파일:
		- 해시 된 암호가 보관되는 사용자 ID와는 별도의 파일

- 취약점:
	- 파일에 액세스할 수 있는 OS의 약점
	- 읽기 쉬운 권한으로 인한 사고
	- 다른 시스템에서 동일한 암호를 사용하는 사용자
	- 백업 미디어에서 액세스
	- 네트워크 트래픽에서 패스워드 탈취

## 암호 선택 기술 (Password Selection Techniques)

- 사용자 교육:
	- 사용자는 암호를 추측하기 어렵게 설정해야 하는 것이 중요하다는 사실을 알게 하고 강력한 암호를 선택하기 위한 지침을 제공합니다.

- 컴퓨터가 암호를 생성:
	- 사용자가 기억하기 어렵습니다.

- 반응형 암호 검사:
	- 시스템이 주기적으로 자체 암호 크래커를 실행하여 추측할 수 있는 암호를 찾습니다.

- 사전에 암호 확인:
	- 사용자는 자신이 원하는 암호를 설정할 수 있지만, 시스템은 암호가 허용되는지 확인합니다. 추측할 수 있는 암호이면 설정을 거부하고, 다른 사람이 추측할 수 없으면서 사용자가 기억할 수 있는 암호를 선택할 수 있게 합니다.

## 사전 암호 확인 (Proactive Password Checking)

- 규칙 시행:
	- 암호가 준수해야 하는 특정 규칙을 시행합니다.

- 패스워드 크래커:
	- 사용하지 않는 큰 사전의 암호를 컴파일합니다.

- 블룸 필터(Bloom Filter):
	- 사전을 기반으로 해시를 사용하여 테이블을 작성하는 데 사용됩니다.
	- 이 테이블을 사용하여 원하는 비밀번호를 확인합니다.

## 블룸 필터 (Bloom Filter)

블룸 필터(Bloom Filter)는 원소가 집합에 속하는지 여부를 검사하는데 사용되는 확률적 자료 구조입니다.

![Bloom Filter]({{ site.url }}/assets/image/2017-04-10-Computer-Security-User-Authentication_1.png)

블룸 필터(m = 18, k = 3)에 세 원소 x, y, z가 추가되어 있습니다. w의 세 해시값 중에서 블룸 필터 값이 0인 경우가 존재하기 때문에, 해당 값은 집합에 속하지 않는다고 판단할 수 있습니다.

## 암호 보안 - 로그인 득점

- 데이터 요청:
	- IP 주소 (국가, ISP 등등)
	- 브라우저의 사용자 에이전트 (OS, 버전 등등)
	- 타임스탬프
	- 쿠키

- 평판 점수
	- 이전에 본 공격의 IP

- 글로벌 카운터 (Global counters)
	- ISP 또는 국가 수준의 데이터 사용

## 메모리 카드 (Memory Cards)

- 데이터를 저장할 수는 있지만 데이터를 처리할 수는 없습니다.

- 가장 일반적인 것은 마그네틱 카드입니다.

- 내부에 전자 메모리를 포함하고 있습니다

- 물리적 접근을 위해 단독으로 사용될 수 있습니다:
	- ATM
	- 현관문

- 암호 또는 PIN과 결합할 때 훨씬 더 강력한 보안 제공

- 메모리 카드의 단점은 다음과 같습니다 :
	- 특별한 리더기가 필요합니다.
	- 토큰 분실
	- 사용자 불만

## 스마트 카드 (Smartcard)

- 물리적 특성:
	- 마이크로프로세서가 내장되어 있습니다.
	- 은행 카드처럼 보이는 스마트 토큰
	- 계산기, 열쇠, 소형 휴대용 물체처럼 보일 수 있습니다.

- 인터페이스:
	- 수동 인터페이스에는 상호 작용을 위한 키패드 및 디스플레이가 포함됩니다.

- 인증 프로토콜:
	- 정적, 동적 암호 생성자 및 챌린지 응답

----
## Reference

- [안전한 패스워드 저장](http://d2.naver.com/helloworld/318732)

- [블룸 필터 - 위키피디아](https://ko.wikipedia.org/wiki/블룸_필터)