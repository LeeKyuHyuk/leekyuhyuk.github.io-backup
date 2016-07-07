---
layout: post
title:  "Twenty Fifteen Wordpress Theme for Jekyll"
date:   2016-07-05 10:21:32 +0900
category: Jekyll
---
[Wordpress](https://ko.wordpress.org)의 [Twenty Fifteen](https://wordpress.org/themes/twentyfifteen)를 [Jekyll](https://jekyllrb.com)에서 사용할 수 있게 수정하였습니다.

## Download

[📎 Twenty Fifteen Wordpress Theme for Jekyll 다운로드](https://github.com/LeeKyuHyuk/twenty-fifteen-jekyll-theme/archive/1.0.0.zip)

## How to use

`_config.yml` 파일을 수정하여 사용하면 됩니다.

##### [ Example ]

{% highlight yaml %}
# Site settings
title: KyuDevelop
email: lee@kyuhyuk.kr
description: KyuHyuk Lee Blog
baseurl: ""
permalink: /article/:categories/:year/:month/:day/:title
url: "http://kyuhyuk.kr"
facebook_username: LeeKyuHyuk
twitter_username: LeeKyuHyuk
github_username:  LeeKyuHyuk
generator:  KyuHyuk Lee

# Build settings
markdown: kramdown

# Plugins
gems:
  - jemoji
  - jekyll-sitemap
{% endhighlight %}

**글을 작성할 때**는 아래와 같은 양식을 사용하면 됩니다.

{% highlight markdown %}
---
layout: post
title:  "제목"
date:   1970-01-01 00:00:00 +0900
category: 카테고리-이름
image:  Thumbnail.png
---
내용
{% endhighlight %}

* `title` : 제목
* `date` : 글 작성 날짜
* `category` : 카테고리 (띄워쓰기는 `-`로 구분)
* `image` : 섬네일 이미지. `image` 부분이 없으면 `assets/profile.jpg`를 섬네일로 사용합니다.

**카테고리**는 `category/카테고리_이름.html`으로 생성하여 사용하면 됩니다.

##### [ Example - Android 카테고리 생성 ]
파일 위치 : `category/android.html`
{% highlight markdown %}
---
layout: default
---
<header class="page-header">
  <h1 class="page-title">카테고리: Android</h1>
</header>
｛ % for post in site.categories.Android % ｝
<article class="post type-post status-publish format-standard hentry">
  <header class="entry-header">
    <h2 class="entry-title">
      <a href="{{ post.url | prepend: site.baseurl }}" rel="bookmark">{{ post.title }}</a>
    </h2>
  </header>
  <div class="entry-content">
    <p>{{ post.content | strip_html | truncatewords: 160 }}  <a href="{{ post.url | prepend: site.baseurl }}" class="more-link"><span class="screen-reader-text">{{ post.title }}</span> 더보기</a></p>
  </div>
  <footer class="entry-footer">
    <span class="posted-on">
      <span class="screen-reader-text">작성일자 </span>
      <a href="{{ post.url | prepend: site.baseurl }}" rel="bookmark">
        <time class="entry-date published" datetime="{{ post.date }}">{{ post.date | date: "%Y년 %-m월 %-d일" }}</time>
        <time class="updated" datetime="{{ post.date }}">{{ post.date | date: "%Y년 %-m월 %-d일" }}</time>
      </a>
    </span>
    <span class="cat-links">
      <span class="screen-reader-text">카테고리 </span>
      <a href="/category/{{ post.category | slugify | prepend: site.baseurl }}.html" rel="category">{{ post.category | replace:'-', ' ' }}</a>
    </span>
  </footer>
</article>
｛ % endfor % ｝
{% endhighlight %}

## Screenshot

![Twenty Fifteen Wordpress Theme for Jekyll](https://raw.githubusercontent.com/LeeKyuHyuk/twenty-fifteen-jekyll-theme/master/assets/image/screenshot.png)

## Description
Our 2015 default theme is clean, blog-focused, and designed for clarity. Twenty Fifteen's simple, straightforward typography is readable on a wide variety of screen sizes, and suitable for multiple languages. We designed it using a mobile-first approach, meaning your content takes center-stage, regardless of whether your visitors arrive by smartphone, tablet, laptop, or desktop computer.

* Mobile-first, Responsive Layout
* Custom Colors
* Custom Header
* Social Links
* Menu Description
* Post Formats
* The GPL v2.0 or later license. :) Use it to make something cool.

## Copyright
Twenty Fifteen WordPress Theme, Copyright 2014-2015 WordPress.org & Automattic.com

Twenty Fifteen is distributed under the terms of the GNU GPL

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

Twenty Fifteen Theme bundles the following third-party resources:

HTML5 Shiv v3.7.0, Copyright 2014 Alexander Farkas

Licenses: MIT/GPL2

Source: [https://github.com/aFarkas/html5shiv](https://github.com/aFarkas/html5shiv)


Genericons icon font, Copyright 2013-2015 Automattic.com

License: GNU GPL, Version 2 (or later)

Source: [http://www.genericons.com](http://www.genericons.com)
