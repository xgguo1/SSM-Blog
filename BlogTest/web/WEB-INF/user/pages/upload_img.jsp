<%--
  Created by IntelliJ IDEA.
  User: xgguo1
  Date: 2019/6/24
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<div class="form-group">
        <label class="col-sm-2 control-label">身份证正面照片:</label>
        <div class="col-sm-10">
        <input type="hidden" name="img"  id="photoUrl"/>
        <input type="file" name="logoFile" id="logoFile" onchange="setImg(this);">
        <span><img id="photourlShow" src="" width="300" height="197"/></span>
        </div>
</div>
</body>
</html>
