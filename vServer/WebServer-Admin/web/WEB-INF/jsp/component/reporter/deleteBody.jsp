<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="detailscontent">
        <h1 class="pageTitle">准备删除填报组件</h1>
        <div class="notification msgalert">
            <p>删除改组件可能引起其他使用改组件组件或应用无法正常使用！</p>
        </div>
    <div class="invoice">
        <div class="invoice_inner">
            <jsp:include page="../common/detailsBase.jsp"/>
            <br clear="all"><br>
            <jsp:include page="../common/useDetails.jsp"/>
        </div><!-- invoice_inner -->

    </div><!-- invoice three_fourth last -->
        <div class="bottombtn">
            <span><a class="iconlink" href="component/${type!=null?'main':fn:toLowerCase(resource.category)}/view">返回</a>　&nbsp;<a class="iconlink" href="javascript:del();">删除</a></span>
        </div>
    <br clear="all">
</div>