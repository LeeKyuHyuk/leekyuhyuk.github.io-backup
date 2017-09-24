---
layout: post
title:  "WebGoat 5.4 - Fail Open Authentication Scheme 풀이"
date:   2017-09-24 23:48:17 +0900
category: Computer-Security
---

**'Fail Open Authentication Scheme'** 문제에서 'Due to an error handling problem in the authentication mechanism, it is possible to authenticate as the 'webgoat' user without entering a password. Try to login as the webgoat user without specifying a password.'라는 설명이 있습니다.

간단하게 설명하자면 인증 과정에서 발생되는 오류 핸들링 과정에 문제가 있어 암호를 지정하지 않고 로그인하면 'webgoat' 유저로 로그인이 가능하다는 뜻입니다.

로그인 창에서 'User Name'과 'Password'에 'webgoat'를 입력한 뒤, Login을 클릭합니다.

![WebGoat 5.4 - Fail Open Authentication Scheme]({{ site.url }}/assets/image/2017-09-24-WebGoat-Fail-Open-Authentication-Scheme-Solution_1.png)

'Burp Suite'에서 `&Password=webgoat` 부분을 삭제한 뒤,  'Forward' 버튼을 눌러주면 끝입니다.

![WebGoat 5.4 - Fail Open Authentication Scheme]({{ site.url }}/assets/image/2017-09-24-WebGoat-Fail-Open-Authentication-Scheme-Solution_2.png)

![WebGoat 5.4 - Fail Open Authentication Scheme]({{ site.url }}/assets/image/2017-09-24-WebGoat-Fail-Open-Authentication-Scheme-Solution_3.png)
