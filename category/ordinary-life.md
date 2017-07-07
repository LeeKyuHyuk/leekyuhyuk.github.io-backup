---
layout: post
title:  "카테고리: Ordinary Life"
---

## 'Ordinary Life' 카테고리의 새 글

{% for post in site.categories.Ordinary-Life %}
  - [{{ post.title }}]({{ post.url | prepend: site.baseurl }})
{% endfor %}
