---
layout: post
title:  "WebGoat 5.4 - HTTP Splitting 풀이"
date:   2017-09-24 18:26:02 +0900
category: Computer-Security
---

**'HTTP Splitting'** 문제는 두 가지의 스테이지가 있습니다.

하나는 HTTP Request 헤더를 변조하여 원하는 화면을 띄우는 것이고, 나머지 하나는 캐시를 사용하여 서버가 변조된 페이지를 응답하도록 하는 것입니다.

첫 번째 스테이지에서는 `CR (%0d)`와 `LF (%0a)`를 사용하여 해결합니다. `CR (%0d)`와 `LF (%0a)`는 줄을 바꾸기 위해 사용되는 개행문자 인데, 이를 이용하여 공격자가 원하는 HTTP Request를 생성할 수 있습니다.

'Search by country'에 Korea라고 입력한뒤, 'Search!' 버튼을 누르면 `language=korea`로 서버에 전송됩니다.

이때 우리가 서버에 보내지는 데이터를

```
language=korea
Content-length: 0
```

로 전송하게 되면, 서버는 `Content-length`가 0으로 알고 body에 아무것도 없는 줄 알게 되어 데이터의 내용을 감출 수 있게 됩니다.

이때 `language=korea` 다음 줄에 `Content-length: 0`를 넣기 위해 `CR (%0d)`와 `LF (%0a)`를 사용합니다.

WebGoat에서 '[PHP Charset Encoder](http://yehg.net/encoding/)'를 사용하면 유용할 거라고 힌트를 주고 있는데, 접속하여 `Content-length: 0`를 encodeURIComponent 합니다.

나온 값 `Content-length%3A%200` 앞에 `korea%0d%0a`를 추가하여 `korea%0d%0aContent-length%3A%200`를 'Search by country'에 입력한뒤, 'Search!' 버튼을 누르면 성공했다는 문자가 나옵니다.

![WebGoat 5.4 - HTTP Splitting]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Splitting-Solution_1.png)

![WebGoat 5.4 - HTTP Splitting]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Splitting-Solution_2.png)

![WebGoat 5.4 - HTTP Splitting]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Splitting-Solution_3.png)

다음 단계는, `Last-Modified` 헤더를 추가한 뒤 미래의 날짜로 설정하여 변조된 페이지를 띄워주면 됩니다.

`Last-Modified`의 값이 맞지 않으면 브라우저는 `If-Modified-Since` 요청을 보내게 되는데, 서버에서는 브라우저가 보낸 `If-Modified-Since`를 확인해서 다르다면 새로운 내용을 전송해주고, 동일하다면 변경되지 않았다고만 응답을 하고 데이터는 전송하지 않습니다.

서버가 보내는 응답을 가로 채 '304 Not Modified'로 변조할 수 있는데 이것을 이용하면 됩니다.

```
korea
Content-length: 0

HTTP/1.1 200 OK
Content-Type : text/html
Last-Modified: Sun, 4 Oct 2020 14:30:00 GMT
Content-length: 47
<html><H1>Hello world!</H1></html> 
```

위의 내용을 '[PHP Charset Encoder](http://yehg.net/encoding/)'에 접속하여 encodeURIComponent 합니다.
%0d%0a
나온 값 `korea%0d%0aContent-length%3A%200%0d%0a%0d%0aHTTP%2F1.1%20200%20OK%0d%0aContent-Type%20%3A%20text%2Fhtml%0d%0aLast-Modified%3A%20Sun%2C%204%20Oct%202020%2014%3A30%3A00%20GMT%0d%0aContent-length%3A%2034%0d%0a%3Chtml%3E%3CH1%3EHello%20world!%3C%2FH1%3E%3C%2Fhtml%3E`을 'Search by country'에 입력한 뒤, 'Search!' 버튼을 눌러 확인해봅니다.

![WebGoat 5.4 - HTTP Splitting]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Splitting-Solution_4.png)

![WebGoat 5.4 - HTTP Splitting]({{ site.url }}/assets/image/2017-09-24-WebGoat-HTTP-Splitting-Solution_5.png)
