---
layout: post
title:  "카테고리: Python"
---

## 'Python' 카테고리의 새 글

{% for post in site.categories.Python %}
  - [{{ post.title }}]({{ post.url | prepend: site.baseurl }})
{% endfor %}
