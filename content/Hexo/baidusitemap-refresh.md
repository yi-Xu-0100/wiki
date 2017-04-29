---
title: "Refresh baidusitemap"
layout: page
date: 2017-04-29 11:55:08
---

个人`Blog`收录百度之路尤为崎岖。为了在百度站长平台提交`sitemap`，实验了许久。

按照正常的主题内容指导，我配置了相关的内容，安装了`hexo-generator-baidu-sitemap`。

但由于`Blog`从`Github`搬运到了`coding`上，`baidusitemap`的提交一直显示连接不上。

我从网上找了各种方法，但对于我的情况并没有任何改善。终于让我发现了可疑之处。

我发现在我生成的`baidusitemap.xml`中有如下显示：

``` xml
-<url>
    <loc>https://yi-xu-0100.github.io/2017-03-21/hello-world/</loc>
    <lastmod>2017-04-13T10:00:50.598Z</lastmod>
    -<data>
        -<display>
            <title>Hello World</title>
            <pubTime>2017-03-21T01:17:43.000Z</pubTime>
            <tag>hexo</tag>
            <breadCrumb title="其他分享" url="https://www.yixuju.cn/categories/other/"/>
        </display>
    </data>
</url>
```

在`baidusitemap.xml`中的标签`<loc>`中链接地址居然是`Github`的。要知道这个`baidusitemap.xml`我就是专门不想它爬`Github`的，我也是因为这样我才搬到`coding`上的。

然后，意外的是，我重新安装`hexo-generator-baidu-sitemap`，并未有任何变化。

终于，我找到`\node_modules\hexo-generator-baidu-sitemap\baidusitemap.ejs`，显示如下：

``` xml
<loc><%- encodeURI("https://yi-xu-0100.github.io/" + post.path) %></loc>
```

好吧，居然定死了，可能是我个人原因，技术不精，难以修复，直接暴力修改如下：

``` xml
<loc><%- encodeURI("https://www.yixuju.cn/" + post.path) %></loc>
```

结果完美解决，记下。
