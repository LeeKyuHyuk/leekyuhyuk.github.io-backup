---
layout: post
title:  "[Linux] split: 파일 분할"
date:   2017-01-30 23:30:42 +0900
category: Linux
---

`split`은 파일을 용량별로 분할할 때나 파일을 원하는 줄로 분할할 때 사용됩니다.

**`split --help`:**

```
Usage: split [OPTION]... [FILE [PREFIX]]
Output pieces of FILE to PREFIXaa, PREFIXab, ...;
default size is 1000 lines, and default PREFIX is 'x'.

With no FILE, or when FILE is -, read standard input.

Mandatory arguments to long options are mandatory for short options too.
  -a, --suffix-length=N   generate suffixes of length N (default 2)
      --additional-suffix=SUFFIX  append an additional SUFFIX to file names
  -b, --bytes=SIZE        put SIZE bytes per output file
  -C, --line-bytes=SIZE   put at most SIZE bytes of records per output file
  -d                      use numeric suffixes starting at 0, not alphabetic
      --numeric-suffixes[=FROM]  same as -d, but allow setting the start value
  -e, --elide-empty-files  do not generate empty output files with '-n'
      --filter=COMMAND    write to shell COMMAND; file name is $FILE
  -l, --lines=NUMBER      put NUMBER lines/records per output file
  -n, --number=CHUNKS     generate CHUNKS output files; see explanation below
  -t, --separator=SEP     use SEP instead of newline as the record separator;
                            '\0' (zero) specifies the NUL character
  -u, --unbuffered        immediately copy input to output with '-n r/...'
      --verbose           print a diagnostic just before each
                            output file is opened
      --help     display this help and exit
      --version  output version information and exit

The SIZE argument is an integer and optional unit (example: 10K is 10*1024).
Units are K,M,G,T,P,E,Z,Y (powers of 1024) or KB,MB,... (powers of 1000).

CHUNKS may be:
  N       split into N files based on size of input
  K/N     output Kth of N to stdout
  l/N     split into N files without splitting lines/records
  l/K/N   output Kth of N to stdout without splitting lines/records
  r/N     like 'l' but use round robin distribution
  r/K/N   likewise but only output Kth of N to stdout

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
Full documentation at: <http://www.gnu.org/software/coreutils/split>
or available locally via: info '(coreutils) split invocation'
```

**파일 분할하기:**

`split -d -a 4 -b 25m gcc-6.3.0.tar.bz2 gcc-6.3.0.part`

25mb로 파일이 나누어지며, `gcc-6.3.0.part0001`, `gcc-6.3.0.part0002`, `gcc-6.3.0.part0003`, `gcc-6.3.0.part0004` 이름으로 생성됩니다.

`-a`는 뒤에 붙는 번호의 자릿수를 설정하는 값입니다. `-a`의 값을 1로 변경하면, `gcc-6.3.0.part1`, `gcc-6.3.0.part2`, `gcc-6.3.0.part3`, `gcc-6.3.0.part4` 이름으로 생성됩니다.

**파일 합치기:** `cat gcc-6.3.0.part* > gcc-6.3.0.tar.bz2`
