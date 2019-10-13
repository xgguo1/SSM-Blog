<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/19
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>博客首页</title>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
</head>
<body>
<%
    //    时间日期处理
    SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
    String tips = (String) request.getAttribute("tips");
    if (tips != null) {
%>
<%@include file="../warning_tips.jsp" %>
<%}%>
<%--头部引入--%>
<%@include file="../header.jsp" %>
<%--内容--%>
<div class="content_container">
    <div class="container-fluid">
        <div class="row content">
            <div class="col-md-9 content_left wow bounceInUp" data-wow-duration="2s">
                <c:forEach items="${articleList}" var="Article">
                    <div class="row">
                        <div class="col-md-11 content_item_left">
                            <div class="row article_title">
                                <a href="/user/showArticleById?articleId=${Article.articleId}" target="_blank">
                                    <h3>${Article.articleTitle}</h3>
                                </a>
                            </div>
                            <div class="row article_info">
                                <div class="col-md-3">
                                        <span>时间:<fmt:parseDate value="${Article.articleAdd}" var="date"
                                                                pattern="yyyy-MM-dd HH:mm"/>
                                        <fmt:formatDate value="${date}" pattern="yy-MM-dd HH:mm"/></span>
                                </div>
                                <div class="col-md-3">
                                    <span>作者:${Article.user.userNick}</span>
                                </div>
                                <div class="col-md-3">
                                    <span>评论:${Article.articleComment}</span>
                                </div>
                                <div class="col-md-3">
                                    <span>浏览:${Article.articleView}</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 article_content">
                                    <img src="/static/images/test.png" style="width: 100%;">
                                </div>
                                <div class="col-md-8 article_content">
                                    <span style="font-size: 20px;">${Article.articleSummary}</span>
                                </div>
                            </div>
                            <div class="row article_tips">
                                <div class="col-md-9">
                                    <button type="button" class="btn btn-outline-primary btn-sm">javascript</button>
                                    <button type="button" class="btn btn-outline-secondary btn-sm">java</button>
                                    <button type="button" class="btn btn-outline-success btn-sm">python</button>
                                    <button type="button" class="btn btn-outline-info btn-sm">Info</button>
                                    <button type="button" class="btn btn-outline-warning btn-sm">Warning</button>
                                    <button type="button" class="btn btn-outline-danger btn-sm">Danger</button>
                                </div>
                                <div class="col-md-2 offset-1">
                                    <a href="/user/showArticleById?articleId=${Article.articleId}" target="_blank">
                                        <span>查看详情</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br>
                </c:forEach>
                <!-- 分页 -->
                <div class="row article_page">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link preBtn" href="#">&laquo;</a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">&raquo;</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3 content_right wow bounceInDown" data-wow-duration="2s">
                <div class="row test_border">博主信息</div>
                <br><br>
                <div class="row test_border">广告位</div>
                <br><br>
                <div class="row test_border">热门文章</div>
                <br><br>
                <div class="row test_border">标签</div>
                <br><br>
                <div class="row test_border">友情链接</div>
                <br><br>
                <div class="row test_border">联系方式</div>
            </div>
        </div>
    </div>
</div>
<%--<button type="button" class="endBtn">点击</button>--%>
<%--底部引入--%>
<%@include file="../footer.jsp" %>

</body>
<script type="text/javascript" src="/static/js/jquery.3.4.1.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".endBtn").click(function () {
            $.ajax({
                data: {
                    // "pn": 2,
                },
                type: "GET",
                url: "/user/page",
                success: function (msg) {
                    console.log(msg)
                },
                error: function (err) {
                    alert("提交失败！");
                }
            });
        });
    });
</script>
</html>
