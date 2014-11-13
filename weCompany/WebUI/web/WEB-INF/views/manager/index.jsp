<%--
  Created by IntelliJ IDEA.
  User: dp
  Date: 14-11-13
  Time: 下午1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>洋芋网站管理系统</title>
    <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.2.6/themes/gray/easyui.css"/>
    <script type="text/javascript" src="/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/style/manager.css"/>
    <script type="text/javascript">
        function addTab(title, url){
            if ($('#tabs').tabs('exists', title)){
                $('#tabs').tabs('select', title);//选中并刷新
                var currTab = $('#tabs').tabs('getSelected');
                var url = $(currTab.panel('options').content).attr('src');
                if(url != undefined && currTab.panel('options').title != 'Home') {
                    $('#tabs').tabs('update',{
                        tab:currTab,
                        options:{
                            content:createFrame(url)
                        }
                    })
                }
            } else {
                var content = createFrame(url);
                $('#tabs').tabs('add',{
                    title:title,
                    content:content,
                    closable:true
                });
            }
            tabClose();
        }
        function createFrame(url) {
            var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            return s;
        }

        function tabClose() {
            /*双击关闭TAB选项卡*/
            $(".tabs-inner").dblclick(function(){
                var subtitle = $(this).children(".tabs-closable").text();
                $('#tabs').tabs('close',subtitle);
            })
            /*为选项卡绑定右键*/
            $(".tabs-inner").bind('contextmenu',function(e){
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });

                var subtitle =$(this).children(".tabs-closable").text();

                $('#mm').data("currtab",subtitle);
                $('#tabs').tabs('select',subtitle);
                return false;
            });
        }
        //绑定右键菜单事件
        function tabCloseEven() {
            //刷新
            $('#mm-tabupdate').click(function(){
                var currTab = $('#tabs').tabs('getSelected');
                var url = $(currTab.panel('options').content).attr('src');
                if(url != undefined && currTab.panel('options').title != 'Home') {
                    $('#tabs').tabs('update',{
                        tab:currTab,
                        options:{
                            content:createFrame(url)
                        }
                    })
                }
            })
            //关闭当前
            $('#mm-tabclose').click(function(){
                var currtab_title = $('#mm').data("currtab");
                $('#tabs').tabs('close',currtab_title);
            })
            //全部关闭
            $('#mm-tabcloseall').click(function(){
                $('.tabs-inner span').each(function(i,n){
                    var t = $(n).text();
                    if(t != 'Home') {
                        $('#tabs').tabs('close',t);
                    }
                });
            });
            //关闭除当前之外的TAB
            $('#mm-tabcloseother').click(function(){
                var prevall = $('.tabs-selected').prevAll();
                var nextall = $('.tabs-selected').nextAll();
                if(prevall.length>0){
                    prevall.each(function(i,n){
                        var t=$('a:eq(0) span',$(n)).text();
                        if(t != 'Home') {
                            $('#tabs').tabs('close',t);
                        }
                    });
                }
                if(nextall.length>0) {
                    nextall.each(function(i,n){
                        var t=$('a:eq(0) span',$(n)).text();
                        if(t != 'Home') {
                            $('#tabs').tabs('close',t);
                        }
                    });
                }
                return false;
            });
            //关闭当前右侧的TAB
            $('#mm-tabcloseright').click(function(){
                var nextall = $('.tabs-selected').nextAll();
                if(nextall.length==0){
                    //msgShow('系统提示','后边没有啦~~','error');
                    alert('后边没有啦~~');
                    return false;
                }
                nextall.each(function(i,n){
                    var t=$('a:eq(0) span',$(n)).text();
                    $('#tabs').tabs('close',t);
                });
                return false;
            });
            //关闭当前左侧的TAB
            $('#mm-tabcloseleft').click(function(){
                var prevall = $('.tabs-selected').prevAll();
                if(prevall.length==0){
                    alert('到头了，前边没有啦~~');
                    return false;
                }
                prevall.each(function(i,n){
                    var t=$('a:eq(0) span',$(n)).text();
                    $('#tabs').tabs('close',t);
                });
                return false;
            });

            //退出
            $("#mm-exit").click(function(){
                $('#mm').menu('hide');
            })
        }

        $(function() {
            tabCloseEven();
            $('.cs-navi-tab').click(function() {
                var $this = $(this);
                var href = $this.attr('src');
                var title = $this.text();
                addTab(title, href);
            });
        });
    </script>
</head>
<body class="easyui-layout">
<div region="north" border="true" class="cs-north">
    <div class="cs-north-bg"><div class="cs-north-logo">洋芋网站后台管理系统</div></div>
</div>
<div region="west" border="true" split="true" title="导航" class="cs-west">
    <div class="easyui-accordion" fit="true" border="false">

        <div title="主要功能">
            <a href="javascript:void(0);" src="/forum/index" class="cs-navi-tab">栏目管理</a></p>
            <a href="javascript:void(0);" src="demo/draggable.html" class="cs-navi-tab">分类管理</a></p>
        </div>
        <!--动态读取所有栏目-->
        <div title="Layout">
            <a href="javascript:void(0);" src="demo/accordion.html" class="cs-navi-tab">accordion</a></p>
            <a href="javascript:void(0);" src="demo/layout.html" class="cs-navi-tab">layout</a></p>
            <a href="javascript:void(0);" src="demo/layout1.html" class="cs-navi-tab">layout1</a></p>
            <a href="javascript:void(0);" src="demo/layout2.html" class="cs-navi-tab">layout2</a></p>
            <a href="javascript:void(0);" src="demo/panel.html" class="cs-navi-tab">panel</a></p>
            <a href="javascript:void(0);" src="demo/panel2.html" class="cs-navi-tab">panel1</a></p>
            <a href="javascript:void(0);" src="demo/tabs.html" class="cs-navi-tab">tabs</a></p>
        </div>
        <div title="Menu and Button">
            <a href="javascript:void(0);" src="demo/menu.html" class="cs-navi-tab">menu</a></p>
            <a href="javascript:void(0);" src="demo/menubutton.html" class="cs-navi-tab">menubutton</a></p>
            <a href="javascript:void(0);" src="demo/linkbutton.html" class="cs-navi-tab">linkbutton</a></p>
            <a href="javascript:void(0);" src="demo/splitbutton.html" class="cs-navi-tab">splitbutton</a></p>
        </div>
        <div title="Form">
            <a href="javascript:void(0);" src="demo/form.html" class="cs-navi-tab">form</a></p>
            <a href="javascript:void(0);" src="demo/validatebox.html" class="cs-navi-tab">validatebox</a></p>
            <a href="javascript:void(0);" src="demo/combo.html" class="cs-navi-tab">combo</a></p>
            <a href="javascript:void(0);" src="demo/combobox.html" class="cs-navi-tab">combobox</a></p>
            <a href="javascript:void(0);" src="demo/combotree.html" class="cs-navi-tab">combotree</a></p>
            <a href="javascript:void(0);" src="demo/combogrid.html" class="cs-navi-tab">combogrid</a></p>
            <a href="javascript:void(0);" src="demo/numberbox.html" class="cs-navi-tab">numberbox</a></p>
            <a href="javascript:void(0);" src="demo/numberbox2.html" class="cs-navi-tab">numberbox1</a></p>
            <a href="javascript:void(0);" src="demo/datebox.html" class="cs-navi-tab">datebox</a></p>
            <a href="javascript:void(0);" src="demo/datetimebox.html" class="cs-navi-tab">datetimebox</a></p>
            <a href="javascript:void(0);" src="demo/calendar.html" class="cs-navi-tab">calendar</a></p>
            <a href="javascript:void(0);" src="demo/timespinner.html" class="cs-navi-tab">timespinner</a></p>
            <a href="javascript:void(0);" src="demo/numberspinner.html" class="cs-navi-tab">numberspinner</a></p>
            <a href="javascript:void(0);" src="demo/slider.html" class="cs-navi-tab">slider</a></p>
        </div>
        <div title="Window">
            <a href="javascript:void(0);" src="demo/window.html" class="cs-navi-tab">window</a></p>
            <a href="javascript:void(0);" src="demo/dialog.html" class="cs-navi-tab">dialog</a></p>
            <a href="javascript:void(0);" src="demo/messager.html" class="cs-navi-tab">messager</a></p>
        </div>
        <div title="DataGrid and Tree">
            <a href="javascript:void(0);" src="demo/datagrid.html" class="cs-navi-tab">datagrid</a></p>
            <a href="javascript:void(0);" src="demo/propertygrid.html" class="cs-navi-tab">propertygrid</a></p>
            <a href="javascript:void(0);" src="demo/tree.html" class="cs-navi-tab">tree</a></p>
            <a href="javascript:void(0);" src="demo/tree2.html" class="cs-navi-tab">tree1</a></p>
            <a href="javascript:void(0);" src="demo/treegrid.html" class="cs-navi-tab">treegrid</a></p>
            <a href="javascript:void(0);" src="demo/treegrid2.html" class="cs-navi-tab">treegrid1</a></p>
            <a href="javascript:void(0);" src="demo/treegrid3.html" class="cs-navi-tab">treegrid2</a></p>
        </div>
    </div>
</div>

<div id="mainPanle" region="center" border="true" border="false">
    <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
        <div title="Home">
            <div class="cs-home-remark">
                <h1>洋芋网站后台管理系统</h1> <br>
                制作：洋芋 <br>
                博客：<a href="http://www.dtscal.cn" target="_blank">www.dtscal.cn</a><br>
                说明：
            </div>
        </div>
    </div>
</div>

<div region="south" border="false" class="cs-south">作者:洋芋 dpyang@live.com</div>
<!--tab右键-->
<div id="mm" class="easyui-menu cs-tab-menu">
    <div id="mm-tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="mm-tabclose">关闭</div>
    <div id="mm-tabcloseother">关闭其他</div>
    <div id="mm-tabcloseall">关闭全部</div>
</div>
<!--tab右键end-->
</body>
</html>
