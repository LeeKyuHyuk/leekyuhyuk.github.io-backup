---
layout: post
title:  "Node.js - 이벤트"
date:   2017-02-19 01:20:53 +0900
category: Nodejs
---

> Node.js®는 [Chrome V8 JavaScript 엔진](https://developers.google.com/v8/)으로 빌드된 JavaScript 런타임입니다. **Node.js는 이벤트 기반**, 논 블로킹 I/O 모델을 사용해 가볍고 효율적입니다. Node.js의 패키지 생태계인 npm은 세계에서 가장 큰 오픈 소스 라이브러리 생태계이기도 합니다.
> [https://nodejs.org/ko/](https://nodejs.org/ko/)

위의 설명을 보면 Node.js는 이벤트 기반이라는 것을 알 수 있습니다. 그만큼 Node.js에서 '이벤트'는 제일 중요한 부분입니다.

## [`on(eventName, listener)`](https://nodejs.org/dist/latest-v6.x/docs/api/events.html#events_emitter_on_eventname_listener)

- 이벤트를 연결합니다.

Node.js API 문서를 참고하면 이벤트 이름과 이벤트 리스너 형태를 알 수 있습니다.

예) [Node.js v6.9.5 Documentation - process](https://nodejs.org/dist/latest-v6.x/docs/api/process.html)

![Node.js v6.9.5 Documentation - process]({{ site.url }}/assets/image/2017-02-19-Nodejs-Event.png)

위의 문서를 참고하여 `process` 객체에 [`exit`](https://nodejs.org/dist/latest-v6.x/docs/api/process.html#process_event_exit)와 [`uncaughtException`](https://nodejs.org/dist/latest-v6.x/docs/api/process.html#process_event_uncaughtexception) 이벤트를 연결해 봅시다.

***Example:***

```js
// process 객체에 exit 이벤트를 연결합니다.
process.on('exit', function (code) {
  console.log('[exit Event] 종료!');
  console.log('[exit Event] code:', code);
});

// process 객체에 uncaughtException 이벤트를 연결합니다.
process.on('uncaughtException', function (error) {
  console.log('[uncaughtException Event] 예외 발생!');
  console.log('[uncaughtException Event] error:', error);
});

errorMaker();
```

***Result:***

```
[uncaughtException Event] 예외 발생!
[uncaughtException Event] error: [ReferenceError: errorMaker is not defined]
[exit Event] 종료!
[exit Event] code: 0
```

## [`removeAllListeners([eventName])`](https://nodejs.org/dist/latest-v6.x/docs/api/events.html#events_emitter_removealllisteners_eventname)

- 모든 이벤트 리스너를 제거합니다.

## [`removeListener(eventName, listener)`](https://nodejs.org/dist/latest-v6.x/docs/api/events.html#events_emitter_removelistener_eventname_listener)

- 특정 이벤트의 이벤트 리스너를 제거합니다.

***Example:***

```js
var runUncaughtException = function (error) {
  console.log('예외 발생!');
  process.removeListener('uncaughtException', runUncaughtException);
  console.log('%s 이벤트의 %s 리스너를 제거합니다.', 'uncaughtException', 'runUncaughtException');
};

process.on('exit', function (code) {
  console.log('종료!');
});

process.on('uncaughtException', runUncaughtException);

var makeException = function () {
  setTimeout(makeException, 1000);
  errorMaker();
};

setTimeout(makeException, 1000);
```

***Result:***

```
예외 발생!
uncaughtException 이벤트의 runUncaughtException 리스너를 제거합니다.
종료!
/home/leekyuhyuk/examples.js:15
  errorMaker();
  ^

ReferenceError: errorMaker is not defined
    at makeException [as _onTimeout] (/home/leekyuhyuk/examples.js:15:3)
    at Timer.listOnTimeout (timers.js:92:15)
```

## [`once(eventName, listener)`](https://nodejs.org/dist/latest-v6.x/docs/api/events.html#events_emitter_once_eventname_listener)

- 이벤트 리스너를 한 번만 연결합니다.

## [`emit(eventName[, ...args])`](https://nodejs.org/dist/latest-v6.x/docs/api/events.html#events_emitter_emit_eventname_args)

- 이벤트를 강제로 실행합니다.

***Example:***

```js
process.on('exit', function (code) {
  console.log('종료!');
});

process.on('uncaughtException', function (error) {
  console.log('예외 발생!');
});

process.emit('uncaughtException');
process.emit('uncaughtException');
process.emit('uncaughtException');

console.log('속았죠?! 아무 문제도 없었지롱!');
```

***Result:***

```
예외 발생!
예외 발생!
예외 발생!
속았죠?! 아무 문제도 없었지롱!
종료!
```

## [`setMaxListeners(n)`](https://nodejs.org/dist/latest-v6.x/docs/api/events.html#events_emitter_setmaxlisteners_n)

- 한 이벤트에는 10개의 이벤트 리스너를 연결할 수 있습니다. `setMaxListeners(n)`을 사용하면 이벤트 리스너 연결 개수를 변경할 수 있습니다.
