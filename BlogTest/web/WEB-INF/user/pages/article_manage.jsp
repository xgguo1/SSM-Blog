<%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/19
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理文章</title>
    <link rel="stylesheet" type="text/css" href="./css/article_manage.css">
</head>
<body>
<div class="container-fluid warning_tips">
    <div class="row">
        <div class="col-md-12 alert alert-dismissible alert-warning wow flash" data-wow-duration="2s"
             data-wow-delay="3s" data-wow-iteration="1">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <p class="mb-0">这里可以写一些警告信息，或者最新通知<a href="#" class="alert-link">详情点击我</a>。</p>
        </div>
    </div>
</div>
<%--头部引入--%>
<%@include file="header.jsp" %>

<div class="content_container">
    <div class="container-fluid manage_container">
        <div class="row manage_content">
            <div class="col-md-2 offset-2 manage_left wow slideInUp">
                <div class="card border-primary mb-3 list-group" style="max-width: 20rem;">
                    <a href="#" class="list-group-item list-group-item-action disabled">编辑工具
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        Markdown编辑器
                    </a>
                    <a href="editor_article.jsp" class="list-group-item list-group-item-action">富文本编辑器
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">查看个人主页
                    </a>
                    <a href="#" class="list-group-item list-group-item-action disabled">文章中心
                    </a>
                    <a href="#" class="list-group-item list-group-item-action active">
                        文章管理
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">评论管理
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">个人管理分类
                    </a>
                    <a href="#" class="list-group-item list-group-item-action disabled">个人中心
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        个人资料
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">我的收藏
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">我的关注
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">我的粉丝
                    </a>
                </div>
            </div>
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
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Type</th>
                                <th scope="col">Column heading</th>
                                <th scope="col">Column heading</th>
                                <th scope="col">Column heading</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="table-primary">
                                <th scope="row">Primary</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            <tr class="table-primary">
                                <th scope="row">Primary</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            <tr class="table-primary">
                                <th scope="row">Primary</th>
                                <td>Column content</td>
                                <td>Column content</td>
                                <td>Column content</td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="row">
                            <ul class="pagination pagination-sm" style="margin: auto;">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">&laquo;</a>
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
                                    <a class="page-link" href="#">&raquo;</a>
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
<%@include file="footer.jsp" %>

</body>
<script type="text/javascript" src="./js/jquery.3.4.1.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
</html>
