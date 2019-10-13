<%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/21
  Time: 1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/css/article_manage.css">
</head>
<body>
<div class="container-fluid warning_tips">
    <div class="row">
        <div class="col-md-12 alert alert-dismissible alert-warning wow flash" data-wow-duration="2s"
             data-wow-delay="3s" data-wow-iteration="1">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <p class="mb-0" style="font-size: 16px;text-align: center;"><%=tips%><a href="#" class="alert-link">详情点击我</a></p>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="/static/js/jquery.3.4.1.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</html>
