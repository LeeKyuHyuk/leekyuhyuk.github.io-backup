---
layout: post
title:  "모토로라 안드로이드폰 부트로더 언락 방법"
date:   2018-01-24 19:26:24 +0900
category: Android
---

이 문서는 **Moto G5 Plus**를 기준으로 작성되었습니다.

# <span style="color:red">**[WARNING] 부트로더 언락 과정에 휴대폰이 초기화 됩니다!**

- '설정' → '휴대전화 정보'에서 '빌드 번호'를 계속 연타하여 '개발자 옵션'을 켭니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_1.png)

- '설정' → '개발자 옵션'에서 'OEM 잠금 해제'를 활성화합니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_2.png)

- 휴대폰을 종료하고, '볼륨 아래' 버튼과 '전원 버튼'을 눌러 전원을 켭니다.

- [Motorola Unlock your bootloader](https://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-a) 페이지에 접속한 뒤, 'Next' 버튼을 클릭합니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_3.png)

- 로그인합니다. 만약 Motorola 계정이 없다면 가입합니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_4.png)

- Android SDK를 설치합니다. [다운로드](http://developer.android.com/sdk/index.html)

- Motorola USB 드라이버를 설치합니다. [다운로드](https://motorola-global-portal.custhelp.com/app/answers/detail/a_id/88481)

- 컴퓨터와 휴대폰을 연결하고, `fastboot oem get_unlock_data` 명령어를 입력합니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_5.png)

- `(bootloader) Unlock data:`에 나오는 코드를 웹사이트에 한 줄로 입력한 뒤, 'Can my device be unlocked?'를 클릭합니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_6.png)

- 'I Agree'를 선택한 뒤, 'Request Unlock Key'를 클릭합니다.

- 이메일을 확인하면, 'Unlock Code'를 얻을 수 있습니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_7.png)

- `fastboot oem unlock UNLOCK_CODE` 명령어를 입력하여 부트로더를 언락합니다. `UNLOCK_CODE` 부분에 위에서 얻은 'Unlock Code'를 입력합니다.

- 만약 'Please re-run this command to continue.'라는 메시지가 출력되면 위에서 입력했던 명령어를 한 번 더 실행해줍니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_8.png)

- 부팅할 때 아래와 비슷한 화면이 나온다면 부트로더 언락이 완료된 것입니다.

![Unlocking the Bootloader Motorola Android Phones]({{ site.url }}/assets/image/2018-01-24-Unlocking-the-Bootloader-Motorola-Android-Phones_9.png)
