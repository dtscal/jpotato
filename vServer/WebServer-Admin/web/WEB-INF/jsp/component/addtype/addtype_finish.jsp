<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Xudong
  Date: 13-1-10
  Time: 上午11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>添加类别</title>
    <jsp:include page="../../_header.jsp" />
    <style type="text/css">
        #context {
            width: 900px;
            height: 500px;
            margin: 10px auto;
        }


    </style>

</head>
<body>
<div class="headerspace"></div>
<jsp:include page="../../common/top.jsp" />
<div>
    <div id="context" style="height: 600px;">
        <div class="breadcrumbs">
            <a href="dashboard.html">添加类别</a>
            <span>完成</span>
        </div>
        <div style="width: 870px; margin: 15px;">

            <h1 class="pageTitle">完成</h1>

            <form method="post" action="">

                <div class="form_default">
                    <fieldset>
                        <legend>添加类别</legend>
                        <a href="../../index.jsp">添加完成返回首页</a>
                    </fieldset>
                </div>
            </form>
        </div>
    </div>
    <br clear="all" />
</div>
<br/>
<div class="footer">
    <jsp:include page="../../common/_footer.jsp" />
</div>
</body>
</html>