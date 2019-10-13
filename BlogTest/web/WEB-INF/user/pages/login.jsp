<%@ page import="org.apache.ibatis.annotations.Param" %><%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/19
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/css/login.css">
</head>
<body>
<%
    String tips = (String) request.getAttribute("tips");
    if(tips!=null){
%>
<%@include file="../warning_tips.jsp"%>
<%}%>
<%--引入头部--%>
<%@include file="../header.jsp" %>
<div class="content_container">
    <div class="login_container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 login_register_brand">
                    <h3 class="text-white">
                        Sign&nbsp;in&nbsp;&nbsp;&&nbsp;&nbsp;Sign&nbsp;up
                    </h3>
                    <span class="text-white">sign in or create an account</span>
                </div>
            </div>
            <div class="row login_content">
                <div class="col-md-6 login_content_left">
                    <div class="card border-secondary mb-3 wow bounceInRight" data-wow-duration="2s" style="max-width: 45rem;">
                        <div class="card-header">Already&nbsp;a&nbsp;member&nbsp;?&nbsp;Sign&nbsp;in:</div>
                        <div class="card-body">
                            <form action="login.do" method="post">
                                <fieldset>
                                    <div class="form-group">
                                        <label>UserName</label>
                                        <input type="text" class="form-control" name="userName"
                                               placeholder="Enter UserName" autocomplete="new-name">
                                        <small id="emailHelp" class="form-text text-muted">UserName should be between 8
                                            and 12 characters long
                                        </small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" name="passWord"
                                               placeholder="Password" autocomplete="new-password">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Sign into your account</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 login_content_right">
                    <div class="card border-danger mb-3 wow bounceInLeft" data-wow-duration="2s" style="max-width: 29rem;">
                        <div class="card-header">Create&nbsp;a &nbsp;new&nbsp; account:</div>
                        <div class="card-body">
                            <form action="register.do" method="post">
                                <fieldset>
                                    <div class="form-group row">
                                        <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" readonly="" class="form-control-plaintext"
                                                   id="staticEmail" value="email@example.com">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Email address</label>
                                        <input type="email" name="userEmail" required="required" class="form-control" placeholder="Enter email">
                                        <small class="form-text text-muted">We'll never share your email
                                            with anyone else.
                                        </small>
                                    </div>
                                    <div class="form-group">
                                        <label>UserName</label>
                                        <input type="text" class="form-control" required="required" autocomplete="new-name" name="userName" placeholder="Enter UserName">
                                        <small class="form-text text-muted">May contain letters,digits
                                            and underscores,and shuld be between 8 and 12 characters long.
                                        </small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" required="required" autocomplete="new-password" name="passWord" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <fieldset class="form-group">
                                        <legend></legend>
                                        <div class="form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" value="" checked="">
                                                Sign up to receive the weekly newsletter
                                            </label>
                                        </div>
                                    </fieldset>
                                    <button type="submit" class="btn btn-danger">Create your account</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../footer.jsp" %>
</body>
<script type="text/javascript" src="/static/js/jquery.3.4.1.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</html>
