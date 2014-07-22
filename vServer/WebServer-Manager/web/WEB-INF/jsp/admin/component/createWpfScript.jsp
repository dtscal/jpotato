<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 12-12-13
  Time: 下午2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加组件-修改WPF脚本</title>
    <jsp:include page="../_header.jsp"/>
    <link rel="stylesheet" media="screen" href="resource/css/userdef.css"/>
    <script type="text/javascript">
        function editdb()
        {
            Ext.Ajax.request({
                url :"component/componentmain/wpfscript/update",
                params : {
                    pid:'${resource.pid}',
                    context:Ext.get('context').getValue(),
                    remark:Ext.get('remark').getValue()
                },
                method : 'POST',
                success : function(resp,opts) {
                    var respText = Ext.decode(resp.responseText);
                    if(respText.success)
                        Ext.Msg.alert("成功", "修改成功");
                    else
                        Ext.Msg.alert("失败", respText.message);
                },
                failure : function() {
                    Ext.Msg.alert("提示", "方法调用失败");
                }
            });
        }
        function returnurl()
        {
            window.top.location.href=rootPath+ "component/componentmain";
        }
    </script>
</head>
<body class="bodygrey">

<div class="defaultbody">
    <div class="header">
        <jsp:include page="../_adminTitle.jsp?titlename=修改WPF脚本"/>
    </div>
    <div class="sidebar bodyleft">
        <jsp:include page="../_adminLeft.jsp"/>
    </div>
    <div class="maincontent">
        <div id="navigation">
            <div></div>
            <div>
                <table class="selftable">
                    <tr">
                        <td class="selftablelef">名称:</td>
                        <td>${resource.name}</td>
                    </tr>
                    <tr>
                        <td>说明:</td>
                        <td><input id="remark" type="text" value="${resource.remark}"/></td>
                    </tr>
                    <tr>
                        <td>wpfscript:</td>
                        <td><textarea id="context" rows="5" cols="40">${resource.context}</textarea></td>
                    </tr>

                </table></div>
            <div>
                <input class="selfbutton" type="button" onclick="javascript:editdb();" value="修改">
                <input class="selfbutton" type="button" onclick="javascript:returnurl();" value="返回">
            </div>
        </div>
    </div>
    <BR clear=all>
    <div class=footer>
        <jsp:include page="../_footer.jsp"/>
    </div>
</div>
</body>
</html>