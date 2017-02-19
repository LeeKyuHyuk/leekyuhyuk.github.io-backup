---
layout: post
title:  "Node.js - http"
date:   2017-02-19 04:19:13 +0900
category: Nodejs
---

웹 서버 개발을 하기 위해 필요한 `http` 모듈에 대해 간단하게 설명하겠습니다.

아래는 웹서버를 열고, 5초뒤에 서버를 종료하는 코드입니다.

- [`http.Server`](https://nodejs.org/dist/latest-v6.x/docs/api/http.html#http_class_http_server) class method

| Name | Description |
|---------------------------------------------------|--------------------|
| [`listen([port][, hostname][, backlog][, callback])`](https://nodejs.org/dist/latest-v6.x/docs/api/http.html#http_server_listen_port_hostname_backlog_callback) | 서버를 실행합니다. |
| [`close([callback])`](https://nodejs.org/dist/latest-v6.x/docs/api/http.html#http_server_close_callback) | 서버를 종료합니다. |

- [`http.ServerResponse`](https://nodejs.org/dist/latest-v6.x/docs/api/http.html#http_class_http_serverresponse) class method

| Name | Description |
|---------------------------------------------------|--------------------|
| [`writeHead(statusCode[, statusMessage][, headers])`](https://nodejs.org/dist/latest-v6.x/docs/api/http.html#http_response_writehead_statuscode_statusmessage_headers) | 응답(Request) 헤더를 작성합니다. |
| [`end([data][, encoding][, callback])`](https://nodejs.org/dist/latest-v6.x/docs/api/http.html#http_response_end_data_encoding_callback) | 응답(Request) 본문을 작성합니다. |

***Example:***

```js
// http 모듈을 불러옵니다.
var http = require('http');

// server 객체를 생성합니다.
var server = http.createServer(function (request, response) {
  response.writeHead(200, { "Content-Type": "text/html"});
  response.end("<h1>Hello, Node.js</h1>");
});

// 포트를 8000으로 설정하고 서버를 실행합니다.
server.listen(8000, function() {
  console.log('Server running at http://127.0.0.1:8000');
});

// 5초뒤에 서버를 종료합니다.
var closeServer = function() {
  server.close();
};
setTimeout(closeServer, 5000);
```

위의 예제에서는 `response.end()`를 사용하여 본문을 작성하였습니다. 더 좋은 방법은 없을까요?

[`File System`](https://nodejs.org/dist/latest-v6.x/docs/api/fs.html) 모듈을 사용하면 HTML를 사용하여 출력할수있습니다.

- [`readFile(file[, options], callback)`](https://nodejs.org/dist/latest-v6.x/docs/api/fs.html#fs_fs_readfile_file_options_callback): 비동기적으로 파일의 전체 내용을 읽습니다.

- [`readFileSync(file[, options])`](https://nodejs.org/dist/latest-v6.x/docs/api/fs.html#fs_fs_readfilesync_file_options): `readFile()`의 동기 버전입니다. 파일의 내용을 반환합니다.

***Example:***

`example.js`

```js
// http, file system 모듈을 불러옵니다.
var http = require('http');
var fs = require('fs');

// server 객체를 생성합니다.
var server = http.createServer(function (request, response) {
  fs.readFile('example.html', function (error, data) {
    response.writeHead(200, { "Content-Type": "text/html"});
    response.end(data);
  });
});

// 포트를 8000으로 설정하고 서버를 실행합니다.
server.listen(8000, function() {
  console.log('Server running at http://127.0.0.1:8000');
});
```

`example.html`

```html
<!DOCTYPE html>
<html>
<body>

<h1>Hello Node.js!</h1>

<img src="http://nodejs.org/static/images/logo.svg" style="background: black;">

</body>
</html>
```
