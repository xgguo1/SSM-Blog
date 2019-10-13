<%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/19
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.minty.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/basic.css">
    <link rel="stylesheet" type="text/css" href="/static/css/animate.min.css">
    <script type="text/javascript" src="/static/js/wow.min.js"></script>
</head>
<script type="text/javascript">
    new WOW().init();
</script>
<body>
<div class="container-fluid">
    <!-- 顶部 -->
    <div class="bran_container">
        <div class="float-right ">
            <br>
            <div class="row float-right">
                <button class="btn btn-danger login_btn" onclick="window.location.href='/user/login'">登录</button>
            </div>
            <br><br><br>
            <div class="row">
                <form method="post" action="/search" class="form-inline my-2 my-lg-0 wow bounceInLeft" data-wow-duration="2s">
                    <input class="form-control mr-sm-2" type="text" name="keyWords" placeholder="Search">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
        <div class="brand_title row">
            <h3 style="margin: auto; padding-bottom: 35px;">写bug呢，大雄生</h3>
        </div>
    </div>
    <!-- 导航栏 -->
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark wow bounceInRight" data-wow-duration="2s">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02"
                    aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav mr-auto row">
                    <li class="nav-item active col-md-2">
                        <a class="nav-link" href="/index" id="index">首页<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item col-md-2">
                        <a class="nav-link" href="#">IT资讯</a>
                    </li>
                    <li class="nav-item col-md-2">
                        <a class="nav-link" href="#">算法</a>
                    </li>
                    <li class="nav-item dropdown col-md-2">
                        <a class="nav-link dropdown-toggle" href="#" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            语言
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Java</a>
                            <a class="dropdown-item" href="#">PHP</a>
                            <a class="dropdown-item" href="#">Python</a>
                        </div>
                    </li>
                    <li class="nav-item col-md-2">
                        <a class="nav-link" href="#">工具</a>
                    </li>
                    <li class="nav-item dropdown col-md-2">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            关于
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">个人中心</a>
                            <a class="dropdown-item" href="/user/manage">管理博客</a>
                            <a class="dropdown-item" href="#">关于博主</a>
                            <a class="dropdown-item" href="/user/loginOut">退出</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
</body>
<script type="text/javascript" src="/static/js/jquery.3.4.1.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</html>
