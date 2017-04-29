---
title: "Add README.md for Hexo"
layout: page
date: 2017-04-28 18:20:12
---

`Github`上一个项目总是会有个`README.md`的介绍文档，但是`Hexo`在部署文章时会渲染`*.md`文件，我的解决方案如下：

在`\source`目录下添加`README.md`文件。

在全局`config.yml`文件中找到`skip_render`,修改为：

```yml
skip_render: README.md
```

然后在`GitBash`中重新部署。

``` bash
hexo clean
hexo generate
hexo deploy
```

然后在目录中可以看到`README.md`文件成功添加上。

![GithubBlogContents](http://oneqpwfpv.bkt.clouddn.com/blogcontent.jpg)

>参考链接：[怎么用hexo上传一个README.md到github?](https://www.zhihu.com/question/28058973)
