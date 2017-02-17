---
layout: post
title:  "Node.js 개발 환경 설정하기"
date:   2017-02-17 17:07:48 +0900
category: Nodejs
---

## Windows

- [Node.js 다운로드 페이지](https://nodejs.org/en/download)에 접속하여 `Windows Installer`를 받아 설치합니다.


## Linux

### `apt` 명령어를 사용하여 설치

- `sudo apt install nodejs-legacy npm`

### `pacman` 명령어를 사용하여 설치

- pacman -S nodejs npm

### 소스코드를 빌드하여 설치

- 소스코드를 빌드하여 설치하려면 `python2`와 `scons`이 필요합니다.

```sh
wget https://nodejs.org/dist/v6.9.5/node-v6.9.5.tar.gz
tar -xzf node-v6.9.5.tar.gz
cd node-v6.9.5
./configure
make
make install
```

## macOS

- [Node.js 다운로드 페이지](https://nodejs.org/en/download)에 접속하여 `macOS Installer`를 받아 설치합니다.
