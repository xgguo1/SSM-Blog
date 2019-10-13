<%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/24
  Time: 1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/ckeditor/plugins/codesnippet/lib/highlight/styles/monokai_sublime.css">
    <script src="/static/ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js"></script>
    <script type="text/javascript">
        hljs.initHighlightingOnLoad();
    </script>
</head>
<body>
<div style="margin: auto;width: 60%;">
    ${article.articleContent}
</div>
</body>
</html>
