<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 13-1-23
  Time: 上午11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>创建文件资源</title>
    <jsp:include page="../../_header.jsp" />
</head>
<body class="detailsbody">
<div class="headerspace"></div>
<jsp:include page="../../common/noTop.jsp"/>

<div class="detailscontent">
    <div class="breadcrumbs">
        <a href="javascript:void(0);">填写基础信息</a>
        <a href="javascript:void(0);">编辑组件内容</a>
        <a href="javascript:void(0);"> <span>编辑预览图和详情</span></a>
        <a href="javascript:void(0);">  <span>组件权限分配</span></a>
        <a href="javascript:void(0);"><span>加入导航</span></a>
        <span>完成</span>
    </div>
        <h1 class="pageTitle">创建文件资源</h1>
        <form method="post" action="/component/resource/doAdd" enctype="multipart/form-data">
            <div class="form_default">
                <fieldset style="width :100%; margin :5px 5px 5px 0; padding: 5px; border :1px solid #666; background :#F7F7F7;">
                    <legend style="font-size: 16px;">上传文件</legend>
                    <p>
                        <label for="name">名称</label>
                        <input type="hidden" name="pid" id="pid" value="${fileresource.pid}">
                        <input type="text" class="sf" name="name" id="name" value="${fileresource.name}"/>
                    </p>
                    <p>
                        <label for="remark">说明</label>
                        <textarea rows="3" cols="50" class="mf"  name="remark" id="remark">${fileresource.remark}</textarea>
                    </p>
                    <p>
                        <label for="param">参数设置</label>
                        <textarea rows="" cols="" class="mf" id="param" name="strParams">${fileresource.strParams}</textarea>
                    </p>
                    <p>
                        <label for="resourcefile">选择文件</label>
                        <input type="file" class="sf" name="resourcefile" style=" width: 380px;" id="resourcefile"/>
                        <span style="color: red;">${error}</span>
                    </p>

                </fieldset>

            </div>
            <div class="bottombtn">
                <button class="button button_red" type="button" onclick="del();" >删除</button>
                <button class="button button_blue" type="submit" onclick="next();" >下一步</button>
                <button class="button button_black" type="submit" onclick="finish();">完成</button>
            </div>
        </form>
    </div>
</div>
<div class="footer">
    <jsp:include page="../../common/_footer.jsp" />
</div>
<jsp:include page="../common/deleteDialog.jsp" >
    <jsp:param name="pid" value="${fileresource.pid}"></jsp:param>
    <jsp:param name="category" value="${fileresource.category}"></jsp:param>
</jsp:include>
</body>
</html>