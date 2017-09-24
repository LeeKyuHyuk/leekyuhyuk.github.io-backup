---
layout: post
title:  "WebGoat 5.4 - Off-by-One Overflows 풀이"
date:   2017-09-24 20:41:21 +0900
category: Computer-Security
---

**'Off-by-One-Overflows'** 문제는 Overflow를 이용하여 해결할 수 있습니다.

First Name에 'KyuHyuk', Last Name에 'Lee'를 넣고, Room Number에는 '1' 10,000개를 입력하였습니다.

Python에서 `"1"*10000`를 입력하여 간편하게 생성하였습니다.

![WebGoat 5.4 - Off-by-One Overflows]({{ site.url }}/assets/image/2017-09-24-WebGoat-Off-by-One-Overflows-Solution_1.png)

모두 진행하면, 아래와 같은 화면이 나오게 되는데 VIP 회원의 First/Last Name을 사용하여 접속하라고 합니다.

아래 화면에서, <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>C</kbd>를 눌러 개발자 도구를 띄워줍니다. (Google Chrome 기준)

![WebGoat 5.4 - Off-by-One Overflows]({{ site.url }}/assets/image/2017-09-24-WebGoat-Off-by-One-Overflows-Solution_2.png)

소스 코드에서 위에서 입력했던 10,000개의 1이 있는 부분을 찾으면 `hidden` 값의 VIP 회원 정보가 나오게 됩니다.

![WebGoat 5.4 - Off-by-One Overflows]({{ site.url }}/assets/image/2017-09-24-WebGoat-Off-by-One-Overflows-Solution_3.png)

이 정보를 사용하여 진행하면 완료됩니다.

![WebGoat 5.4 - Off-by-One Overflows]({{ site.url }}/assets/image/2017-09-24-WebGoat-Off-by-One-Overflows-Solution_4.png)

![WebGoat 5.4 - Off-by-One Overflows]({{ site.url }}/assets/image/2017-09-24-WebGoat-Off-by-One-Overflows-Solution_5.png)
