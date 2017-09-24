---
layout: post
title:  "WebGoat 5.4 - Discover Clues in the HTML 풀이"
date:   2017-09-24 19:01:52 +0900
category: Computer-Security
---

**'Discover Clues in the HTML'** 문제는 간단한 문제입니다.

말 그대로 'HTML 코드에서 단서를 찾아라(Discover Clues in the HTML)' 인데, HTML 코드를 열어보면 아래와 같이 `<!-- FIXME admin:adminpw  --><!-- Use Admin to regenerate database  -->`라는 주석을 발견할 수 있습니다.

User Name에 `admin`, Password에 `adminpw`를 입력하면 됩니다.

![WebGoat 5.4 - Discover Clues in the HTML]({{ site.url }}/assets/image/2017-09-24-WebGoat-Discover-Clues-in-the-HTML-Solution_1.png)

![WebGoat 5.4 - Discover Clues in the HTML]({{ site.url }}/assets/image/2017-09-24-WebGoat-Discover-Clues-in-the-HTML-Solution_2.png)
