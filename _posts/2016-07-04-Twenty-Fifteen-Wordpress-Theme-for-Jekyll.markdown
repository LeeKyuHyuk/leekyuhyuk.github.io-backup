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
