---
layout: post
title:  "WebGoat 5.4 - HTTP Basics 풀이"
date:   2017-09-24 18:26:02 +0900
category: Computer-Security
---

**'HTTP Basics'** 문제에서는 브라우저와 웹 애플리케이션 간의 데이터 전송을 이해하는 기본 사항과 HTTP 프록시를 사용하여 요청 및 응답을 트래핑 하는 방법에 대해 설명합니다.

이 문제를 해결하기 위해서는 프록시 툴을 사용해야 합니다.  
이 글에서는 [Burp Suite Free Edition](https://portswigger.net/burp/freedownload)을 사용했습니다.

Google Chrome에서 '설정' - '시스템' - '프록시 설정 열기'하면 나오는 창에서 'LAN 설정'을 클릭한 뒤, 아래와 같이 설정합니다.

![WebGoat 5.4 - HTTP Basics]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Basics-Solution_1.png)

![WebGoat 5.4 - HTTP Basics]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Basics-Solution_2.png)

'Burp Suite'에서는 다음과 같이 설정한 뒤 체크 표시를 해줍니다.

![WebGoat 5.4 - HTTP Basics]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Basics-Solution_3.png)

'Enter your name'에 내용을 적고 'Go!' 버튼을 누르면 'Burp Suite'에서 다음같이 출력됩니다.

![WebGoat 5.4 - HTTP Basics]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Basics-Solution_4.png)

`/WebGoat/attack?Screen=16&menu=10`로  `person=leekyuhyuk&SUBMIT=Go%21` 데이터를 POST 방식으로 보내고 있습니다.

만약 `person=leekyuhyuk` 부분을 `person=cba`로 변경한 뒤, Forward를 누르게 되면, WebGoat 화면에는 'abc'가 출력되게 됩니다.

![WebGoat 5.4 - HTTP Basics]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Basics-Solution_5.png)
