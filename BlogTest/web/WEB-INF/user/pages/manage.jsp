<%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/19
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理文章</title>
    <link rel="stylesheet" type="text/css" href="/static/css/article_manage.css">
    <link href="/static/css/open-iconic-bootstrap.min.css" rel="stylesheet">
</head>
<body>
<% String tips = (String) request.getAttribute("tips");%>
<%@include file="../warning_tips.jsp" %>
<%--头部引入--%>
<%@include file="../header.jsp" %>

<div class="content_container">
    <div class="container-fluid manage_container">
        <div class="row manage_content">
            <%@include file="../manage_nav.jsp" %>
            <div class="col-md-6 manage_right wow bounceInDown" data-wow-duration="2s">
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#home">全部(0)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#profile">公开(0)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#">私密(0)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#">草稿箱(0)</a>
                    </li>
                </ul>
                <hr>
                <div id="myTabContent" class="tab-content table_style">
                    <div class="row article_search">
                        <div class="col-md-2">
                            <div class="form-group has-success">
                                <input type="text" class="form-control" placeholder="年份">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group has-success">
                                <input type="text" class="form-control" placeholder="月份">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group has-success">
                                <input type="text" class="form-control" placeholder="文章类型">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group has-success">
                                <input type="text" class="form-control" placeholder="个人分类">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <form class="form-inline my-2 my-lg-0">
                                <input class="form-control mr-sm-2" type="text" placeholder="筛选">
                                <button class="btn btn-secondary my-2 my-sm-0" type="submit">筛选</button>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane fade show active" id="home">
                        <table class="table table-hover table_border">
                            <thead class="w-100">
                            <tr class="row">
                                <th class="col-1">ID</th>
                                <th class="col-5">ArticleTitle</th>
                                <th class="col-2">AddDate</th>
                                <th class="col-2">Status</th>
                                <th class="col-2">Operator</th>
                            </tr>
                            </thead>
                            <tbody class="w-100">
                            <c:forEach items="${pageInfo.list}" var="article">
                                <tr class="row table-primary over_hidden">
                                    <td class="col-1">${article.articleId}</td>
                                    <td class="col-5">${article.articleTitle}</td>
                                    <td class="col-2">${article.articleAdd}</td>
                                    <td class="col-2">${article.articleStatus}</td>
                                    <td class="col-2">
                                        <a href="/user/showArticleById?articleId=${article.articleId}">
                                            <span class="oi oi-eye view_img"></span></a>
                                        <a href="/user/editorArticleById?articleId=${article.articleId}">
                                            <span class="oi oi-pencil edit_img"></span></a>
                                        <a href="/user/delArticleById?articleId=${article.articleId}">
                                            <span class="oi oi-trash trash_img"></span>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <ul class="pagination pagination-sm" style="margin: auto;">
                                <li class="page-item">
                                    <c:if test="${pageInfo.hasPreviousPage}">
                                        <a class="page-link" href="/user/manage?pn=${pageInfo.pageNum-1}">&laquo;</a>
                                    </c:if>
                                </li>
                                <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->
                                <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                                    <c:if test="${page_num==pageInfo.pageNum}">
                                        <li class="page-item active">
                                            <a class="page-link" href="#">${page_num}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page_num!=pageInfo.pageNum}">
                                        <li class="page-item">
                                            <a class="page-link" href="/user/manage?pn=${page_num}">${page_num}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <%--下一页--%>
                                <li class="page-item">
                                    <c:if test="${pageInfo.hasNextPage}">
                                        <a class="page-link" href="/user/manage?pn=${pageInfo.pageNum+1}">&raquo;</a>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile">
                        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.
                            Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan
                            four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft
                            beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda
                            labore aesthetic magna delectus mollit.</p>
                    </div>
                    <div class="tab-pane fade" id="dropdown1">
                        <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic
                            lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork
                            tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica.
                            DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>
                    </div>
                    <div class="tab-pane fade" id="dropdown2">
                        <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out
                            master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan
                            DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY
                            salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--底部引入--%>
<%@include file="../footer.jsp" %>

</body>
<script type="text/javascript" src="/static/js/jquery.3.4.1.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</html>
