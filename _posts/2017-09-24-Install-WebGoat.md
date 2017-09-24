---
layout: post
title:  "WebGoat 8.0 설치와 실행"
date:   2017-09-24 17:31:23 +0900
category: Computer-Security
---

[WebGoat](https://www.owasp.org/index.php/Category:OWASP_WebGoat_Project)는 Web Application 보안을 공부할 수 있도록 만들어진 [OWASP](https://www.owasp.org)의 프로그램입니다.

WebGoat를 사용하여 다양한 보안 문제와 취약점을 공부할 수 있습니다.

#### **Docker을 사용하여 실행**

Docker을 설치합니다.

```sh
$ curl -s https://get.docker.com/ | sudo s
```

`sudo` 명령어 없이 사용하기 위해 `sudo usermod -aG docker $USER`을 실행합니다.

```sh
$ docker pull webgoat/webgoat-8.0
$ docker run -p 8080:8080 webgoat/webgoat-8.0
```

[http://localhost:8080/WebGoat](http://localhost:8080/WebGoat)으로 접속합니다.

---

#### **소스를 받아 실행**

* 아래의 패키지가 필요합니다.
	- Java 8
	- Maven > 3.2.1
	- Git 또는 Git을 지원하는 IDE

```sh
$ git clone git@github.com:WebGoat/WebGoat.git
$ cd WebGoat
$ git checkout develop
$ mvn clean install
$ mvn -pl webgoat-server spring-boot:run
```

[http://localhost:8080/WebGoat](http://localhost:8080/WebGoat)으로 접속합니다.
