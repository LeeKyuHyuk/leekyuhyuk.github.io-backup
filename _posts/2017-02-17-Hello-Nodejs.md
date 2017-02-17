---
layout: post
title:  "Hello, Node.js!"
date:   2017-02-17 17:23:57 +0900
category: Nodejs
---

## 콘솔에 'Hello, Node.js'를 출력해보자

아래의 내용을 `hello.js`로 저장합니다.

```js
console.log('Hello, Node.js')
```

`node hello.js` 명령으로 위의 코드를 실행합니다.

## 'Hello, Node.js'를 출력하는 웹 서버를 만들어보자

아래의 내용을 `hello_server.js`로 저장합니다.

```js
// http 모듈을 불러옵니다.
var http = require('http');

// 모든 요청에 'Hello, Node.js'로 응답하도록 http 서버를 설정합니다.
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/html"});
  response.end("<h1>Hello, Node.js</h1>");
});

// 포트를 8000으로 설정하고 서버를 실행합니다.
server.listen(8000);
console.log("Server running at http://127.0.0.1:8000/");
```

`node hello_server.js` 명령으로 위의 코드를 실행한뒤, [http://127.0.0.1:8000/](http://127.0.0.1:8000/)에 접속해봅니다.

서버를 종료하려면 터미널에서 <kbd>ctrl</kbd> + <kbd>c</kbd>를 눌러주세요.

## 전역 변수

- [`__dirname`](https://nodejs.org/api/globals.html#globals_dirname): 실행 중인 코드의 폴더 경로

- [`__filename`](https://nodejs.org/api/globals.html#globals_filename): 실행 중인 코드의 파일 경로

***Example:***

```js
console.log('__dirname:', __dirname);
console.log('__filename:', __filename);
```

***Result:***

```
__dirname: /home/leekyuhyuk
__filename: /home/leekyuhyuk/example.js
```

## 전역 객체

### [`console`](https://nodejs.org/api/console.html)

#### [`console.log()`](https://nodejs.org/api/console.html#console_console_log_data_args)

- 콘솔에 로그를 출력합니다

***Example:***

```js
console.log('My favorite number is %d', 7);
console.log('%d * %d = %d', 128, 256, 128 * 256);
console.log('My name is %s', 'KyuHyuk Lee');
console.log('JSON Data: %j', { name: 'KyuHyuk Lee', age: 23 });
```

***Result:***

```
My favorite number is 7
128 * 256 = 32768
My name is KyuHyuk Lee
JSON Data: {"name":"KyuHyuk Lee","age":23}
```

#### [`console.time()`](https://nodejs.org/api/console.html#console_console_time_label)

- 시간 측정을 시작합니다.

#### [`console.timeEnd()`](https://nodejs.org/api/console.html#console_console_timeend_label)

- 시간 측정을 종료합니다.

***Example:***

```js
console.time('Duration time');
var result = 0;
for (var i = 0; i <= 50; i++) {
  console.log('2^%d = %d', i, Math.pow(2, i));
}
console.timeEnd('Duration time');
```

***Result:***

```
2^0 = 1
2^1 = 2
2^2 = 4
...
2^49 = 562949953421312
2^50 = 1125899906842624
Duration time: 4ms
```

### [`process`](https://nodejs.org/api/process.html)

#### [`process.argv`](https://nodejs.org/api/process.html#process_process_argv)

- 매개변수를 나타냅니다.

***Example:***

```js
process.argv.forEach(function (item, index) {
  console.log(index + ' : ' + typeof (item) + ' :' , item);
  if (item == '--name') {
    var name = process.argv[index + 1];
    console.log('Your name is %s!', name);
  }
});
```

***Result:***

`node example.js --name KyuHyuk`

```
0 : string : /usr/bin/node
1 : string : /home/leekyuhyuk/example.js
2 : string : --name
Your name is KyuHyuk!
3 : string : KyuHyuk
```

`node example.js`

```
0 : string : /usr/bin/node
1 : string : /home/leekyuhyuk/example.js
```

#### [`process.arch`](https://nodejs.org/api/process.html#process_process_arch)

- 프로세스 아키텍처를 나타냅니다. (`'arm'`, `'ia32'`, 또는 `'x64'`)

#### [`process.env`](https://nodejs.org/api/process.html#process_process_env)

- 사용자 환경(User Environment)을 나타냅니다.

#### [`process.platform`](https://nodejs.org/api/process.html#process_process_platform)

- 운영체제 플랫폼을 나타냅니다. (`'darwin'`, `'freebsd'`, `'linux'`, `'sunos'` 또는 `'win32'`)

#### [`process.release`](https://nodejs.org/api/process.html#process_process_release)

-  현재 릴리스와 관련된 메타 데이터가 포함 된 객체를 반환합니다.

#### [`process.version`](https://nodejs.org/api/process.html#process_process_version)

- Node.js 버전

#### [`process.versions`](https://nodejs.org/api/process.html#process_process_versions)

- Node.js와 종속된 프로그램들의 버전

***Example:***

```js
console.log("process.arch:", process.arch);
console.log("process.argv:", process.argv);
console.log("process.env:", process.env);
console.log("process.platform:", process.platform);
console.log("process.release:", process.release);
console.log("process.version:", process.version);
console.log("process.versions:", process.versions);
```

***Result:***

```
process.arch: arm
process.argv: [ '/usr/bin/node', '/home/leekyuhyuk/example.js' ]
process.env: { HISTFILESIZE: '1000',
  USER: 'leekyuhyuk',
  MAIL: '/var/mail/leekyuhyuk',
  HOSTNAME: 'qnas',
  SHLVL: '1',
  OLDPWD: '/home/leekyuhyuk',
  HOME: '/home/leekyuhyuk',
  SSH_TTY: '/dev/pts/0',
  PAGER: '/bin/more ',
  LOGNAME: 'leekyuhyuk',
  TERM: 'xterm-256color',
  PATH: '/bin:/usr/bin',
  HISTSIZE: '1000',
  SHELL: '/bin/ash',
  PWD: '/home/leekyuhyuk',
  EDITOR: '/bin/vi' }
process.platform: linux
process.release: { name: 'node',
  lts: 'Boron',
  sourceUrl: 'https://nodejs.org/download/release/v6.9.5/node-v6.9.5.tar.gz',
  headersUrl: 'https://nodejs.org/download/release/v6.9.5/node-v6.9.5-headers.tar.gz' }
process.version: v6.9.5
process.versions: { http_parser: '2.7.0',
  node: '6.9.5',
  v8: '5.1.281.89',
  uv: '1.9.1',
  zlib: '1.2.11',
  ares: '1.10.1-DEV',
  modules: '48',
  openssl: '1.0.2k' }
```

#### [`process.exit([code])`](https://nodejs.org/api/process.html#process_process_exit_code)

- 프로그램을 종료합니다.

- 주로 0은 정상 종료를, 1은 비정상 종료를 의미합니다.

#### [`process.memoryUsage()`](https://nodejs.org/api/process.html#process_process_memoryusage)

- 메모리 사용 정보 객체를 반환합니다.

#### [`process.uptime()`](https://nodejs.org/api/process.html#process_process_uptime)

- 프로그램이 실행된 시간을 반환합니다.

***Example:***

```js
console.log("process.memoryUsage():", process.memoryUsage());
console.log("process.uptime():", process.uptime());
process.exit(0);
```

***Result:***

```
process.memoryUsage(): { rss: 21417984, heapTotal: 8388608, heapUsed: 3545548 }
process.uptime(): 1.305
```

## `exports`와 모듈

- 모듈을 생성할 때 `exports` 객체를 사용합니다.

- 모듈을 추출할 때는 `require()`를 사용합니다.

***Example:***

`module.js`

```js
// number의 제곱을 구합니다.
exports.square = function (number) {
  return number * number;
}

// start부터 end의 합을 구합니다.
exports.sum = function (start, end) {
  var result = 0;
  for (var i = start; i <= end; i++) {
    result += i;
  }
  return result;
}
```

`example.js`

```js
var module = require('./module.js');
console.log('square(14) = %d', module.square(14));
console.log('sum(1, 100) = %d', module.sum(1, 100));
```

***Result:***

`node examples.js`

```
square(14) = 196
sum(1, 100) = 5050
```
