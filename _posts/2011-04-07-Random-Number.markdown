---
layout: post
title:  "6장: 난수 생성"
date:   2011-04-07 12:27:51 +0900
category: C
---

6장에서는 아래의 내용을 설명할 것입니다:

- `rand()`
- `srand()`

## **간단한 예제 프로그램**

```c
// random.c -- Generate random number
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int i;
    int number;
    srand(time(NULL));
    for (i=0 ; i<5 ; i++) {
        number = rand()%10+1;
        printf("Random number : %d\n", number);
    }
    return 0;
}
```

#### **< 출력 화면 >**

```
Random number : 6
Random number : 10
Random number : 2
Random number : 8
Random number : 2
```

## 예제에 대한 설명

#### 1. **`stdlib.h`와 `time.h` 헤더 파일**

`rand()`와 `srand()`를 사용하기 위해서 `stdlib.h` 헤더 파일이 필요하고, `time()`을 사용하기 위해 `time.h` 헤더 파일이 필요합니다.

- [srand() - C++ Reference](http://www.cplusplus.com/reference/cstdlib/srand/)
- [time() - C++ Reference](http://www.cplusplus.com/reference/ctime/time/)

#### 2. **`srand()`**

`srand()`를 사용하여 seed를 설정합니다.

만약 `srand()`를 사용하지 않는다면 프로그램을 실행할 때마다 같은 난수가 생성됩니다.

###### **예)**

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int number = rand()%10+1;
    printf("Random number : %d\n", number);
    return 0;
}
```

###### **< 출력 화면 >**

```
$ ./a.out
Random number : 4

$ ./a.out
Random number : 4

$ ./a.out
Random number : 4
```

실행할 때마다 같은 난수를 생성하지 않기 위해 `srand(time(NULL));`를 넣어 실행할 때마다 난수가 변경하도록 설정합니다.

#### 3. **`rand()`**

`rand()`는 난수를 생성하는 함수입니다.  
그냥 `rand()`만 넣게 되면 커다란 숫자가 나오게 됩니다.

###### **예)**

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int i;
    int number;
    srand(time(NULL));
    for (i=0 ; i<5 ; i++) {
        number = rand();
        printf("Random number : %d\n", number);
    }
    return 0;
}

```

###### **< 출력 화면 >**

```
Random number : 1713654117
Random number : 96465429
Random number : 843028018
Random number : 1588662499
Random number : 2056874377
```

만약 0에서 9사이의 숫자가 나오게 하려면 어떻게 해야 할까요?  
`%` 연산자를 사용하면 됩니다.  
`rand()%10`을 하게 되면 0~9사이가 나오게 됩니다. (어떤 숫자든지 10으로 나누게 되면 나머지는 0에서 9사이가 나오게 되기 때문입니다.)  
1에서 10사이의 숫자가 나오게 하려면 어떻게 해야 할까요?  
이 문제도 간단합니다. `rand()%10+1`을 하면 됩니다.
