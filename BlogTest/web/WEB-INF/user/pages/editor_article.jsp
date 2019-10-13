<%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/20
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑文章</title>
    <link href="/static/ckeditor/plugins/codesnippet/lib/highlight/styles/default.css" rel="stylesheet">
    <link href="/static/css/editor_article.css" rel="stylesheet">
    <script src="/static/ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js"></script>
    <script type="text/javascript" src="/static/ckeditor/ckeditor.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="content_container">
    <div class="editor_container">
        <div class="form-group tips_margin">
            <span for="select" class="badge badge-success">选择代码块样式:</span>
            <select class="form-control" id="select"></select>
        </div>
        <form action="/user/save" method="post">
            <div class="form-group tips_margin">
                <span for="select" class="badge badge-danger">输入文章标题：</span>
                <input type="text" class="form-control articleTitle" placeholder="文章标题(必须)，不超过100字">
            </div>
            <textarea cols="80" id="editor1" name="editor1" rows="10" style="resize: none;"></textarea>
            <div class="form-group tips_margin article_summary">
                <span for="select" class="badge badge-info">文章摘要：</span>
                <div class="row">
                    <div class="col-md-7">
                        <textarea id="summary_text" class="form-control" rows="3"
                                  placeholder="文章摘要(可选),字数不超250字"></textarea>
                    </div>
                    <div class="col-md-3">
                        <button type="button" class="btn btn-primary btn-sm getSummaryBtn">从正文中截取</button>
                    </div>
                </div>
            </div>
            <div class="row article_tips">
                <div class="col-md-6">
                    <span class="tips_title">文章标签：</span>
                    <span class="badge badge-primary">Java</span>
                    <span class="badge badge-secondary">PHP</span>
                    <span class="badge badge-success">算法</span>
                    <span class="badge badge-danger">Python</span>
                    <span class="badge badge-warning">工具</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-1 type_title">文章类型：</div>
                <div class="col-md-2">
                    <div class="form-group">
                        <select class="form-control">
                            <option>原创</option>
                            <option>转载</option>
                            <option>翻译</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-1 type_title">文章分类：</div>
                <div class="col-md-2">
                    <div class="form-group">
                        <select class="form-control">
                            <option>前端</option>
                            <option>后端</option>
                            <option>算法</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-1 private_title">
                    <span class="">私密文章：</span>
                </div>
                <div class="col-md-10">
                    <div class="form-group">
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="customSwitch1" checked="">
                            <label class="custom-control-label private_tips"
                                   for="customSwitch1">温馨提示：请勿发布涉及政治、广告、营销、翻墙、违反国家法律法规等内容</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row submit_container">
                <div class="col-md-12">
                    <input type="button" class="btn btn-success publishBtn" value="发&nbsp;&nbsp;布">
                    <input type="button" class="btn btn-warning saveBtn" value="保存为草稿">
                    <input type="button" class="btn btn-danger backBtn" value="返&nbsp;&nbsp;回">
                </div>
            </div>
        </form>
    </div>
</div>
<%--引入底部--%>
<%@include file="../footer.jsp" %>
</body>
<script type="text/javascript">

    $(function () {
        var articleId = 0;
        var articleStatus = 0;
        var submitUrl = "/user/saveOrPublishArticle";//插入记录接口
        // 保存文章,不发布
        $(".saveBtn").click(function () {
            if (articleId != 0) {//更新新记录
                submitUrl = "/user/updateOrPublishArticle";
            }
            articleStatus = 0;
            submitFunc(submitUrl, articleStatus);
        });
        //保存并发布
        $(".publishBtn").click(function () {
            articleStatus = 1;
            if (articleId != 0) {
                submitUrl = "/user/updateOrPublishArticle"
            }
            submitFunc(submitUrl, articleStatus);
        });

        //返回
        $(".backBtn").click(function () {
            window.location.href="/user/manage";
        });
        //提交请求
        function submitFunc(submitUrl, articleStatus) {
            var codeTheme = $("#select").val();
            var articleTitle = $(".articleTitle").val();
            //获取文本内容(带标签)
            var contentText = CKEDITOR.instances.editor1.getData();
            var summaryText = $("#summary_text").val();
            // alert(summaryText)
            if (codeTheme != "" && articleTitle != "" && contentText != "" && summaryText != "") {
                $.ajax({
                    data: {
                        "codeTheme": codeTheme,
                        "articleTitle": articleTitle,
                        "contentText": contentText,
                        "summaryText": summaryText,
                        "articleId": articleId,
                        "articleStatus": articleStatus
                    },
                    type: "POST",
                    url: submitUrl,
                    success: function (msg) {
                        // console.log(msg)
                        if (isNaN(parseInt(msg))) {
                            alert("更新成功！");//更新成功
                        } else {
                            if (msg > 0) {
                                articleId = msg;
                                console.log(articleId)
                                alert("保存成功！")
                            } else {
                                alert("保存失败！")
                            }
                        }
                    },
                    error: function (err) {
                        alert("提交失败！");
                    }
                });
            }else {
                alert("文章内容填写不完整！")
            }
        };

        // 获取概要内容(纯文本)
        $(".getSummaryBtn").click(function () {
            var summaryText = CKEDITOR.instances.editor1.document.getBody().getText();
            // console.log(summaryText)
            subStr = summaryText.substring(0, 250);
            $("#summary_text").html(subStr);
        });

        //--------------------------ekeditor------------------------------
        CKEDITOR.disableAutoInline = true;
        // 引入全局配置和覆盖全局配置
        var config = {
            customConfig: './CustomConfig.js',
            height: 537
        };
        //自定义配置代替默认配置
        CKEDITOR.replace('editor1', config);

        initThemeChange();

        function initThemeChange() {
            var templates = [
                    'monokai_sublime', 'default', 'arta', 'ascetic', 'atelier-dune.dark', 'atelier-dune.light', 'atelier-forest.dark', 'atelier-forest.light', 'atelier-heath.dark', 'atelier-heath.light', 'atelier-lakeside.dark', 'atelier-lakeside.light', 'atelier-seaside.dark', 'atelier-seaside.light', 'brown_paper', 'dark', 'docco', 'far', 'foundation', 'github', 'googlecode', 'idea', 'ir_black', 'magula', 'mono-blue', 'monokai', 'obsidian', 'paraiso.dark', 'paraiso.light', 'pojoaque', 'railscasts', 'rainbow', 'school_book', 'solarized_dark', 'solarized_light', 'sunburst', 'tomorrow-night-blue', 'tomorrow-night-bright', 'tomorrow-night-eighties', 'tomorrow-night', 'tomorrow', 'vs', 'xcode', 'zenburn'
                ],
                select = CKEDITOR.document.getById('select'),
                codeTemplate = 'CKEDITOR.replace( \'editor1\', {\n' +
                    '   <strong>extraPlugins: \'codesnippet\',</strong>\n' +
                    '   codeSnippet_theme: \'{tpl}\'\n' +
                    '} );',
                name, option;

            while ((name = templates.shift())) {
                option = CKEDITOR.document.createElement('option', {
                    attributes: {
                        value: name
                    }
                });

                option.setText(name);
                select.append(option);
            }

            select.$.onchange = function () {
                if (CKEDITOR.instances.editor1)
                    CKEDITOR.instances.editor1.destroy();

                CKEDITOR.replace('editor1', CKEDITOR.tools.extend({}, config, {
                    codeSnippet_theme: this.value
                }, true));
            };
        }

        //----------------------ckeditor----------------------------------
    }());
</script>
<script type="text/javascript" src="/static/js/jquery.3.4.1.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</html>
