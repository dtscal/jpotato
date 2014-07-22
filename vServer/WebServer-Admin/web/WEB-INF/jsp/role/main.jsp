<%--
  Created by IntelliJ IDEA.
  User: Xudong
  Date: 12-10-19
  Time: 下午6:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <jsp:include page="../common/_header.jsp" />
    <script type="text/javascript">
        var accounTable;
        jQuery(document).ready(function () {
            jQuery("#queryAccount").bind("click", function () {
                if (accounTable == null || accounTable == undefined) {

                } else {
                    accounTable.fnDestroy();
                }
                accounTable = jQuery('#accounTable').dataTable({
                    bPaginate: true,
                    bSort: false,
                    "sPaginationType": "full_numbers",
                    bFilter: false,
                    "bProcessing": false,
                    "bServerSide": true,
                    "sAjaxSource": "role/list/get?rand=" + Math.random(),
                    "fnServerData": function (sSource, aoData, fnCallback) {
                        aoData.push({ "name": "page", "value": aoData[3].value / aoData[4].value + 1  });
                        aoData.push({ "name": "limit", "value": aoData[4].value  });
                        aoData.push({ "name": "name", "value": jQuery("#name").val()  });
                        aoData.push({ "name": "describe", "value": jQuery("#describe").val() });
                        jQuery.ajax({
                            "dataType": 'json',
                            "type": "get",
                            "url": sSource,
                            "data": aoData,
                            "success": function (rep) {
                                fnCallback(rep);
                                jQuery("#accounTable_length").after( '<div class="dataTables_filter" id="example_filter"><label>' +
                                        '<a class="iconlink" href="role/create"><img src="resource/images/icons/small/white/plus.png" class="mgright5" alt="">' +
                                        '<span>新增</span></a></label></div>');

                            }
                        });
                    },
                    "sAjaxDataProp": "entity.content",
                    "oLanguage": {
                        "sProcessing": "正在加载数据...",
                        'sSearch': '数据筛选:',
                        "sLengthMenu": "每页显示 _MENU_ 项记录",
                        "sZeroRecords": "没有符合项件的数据...",
                        "sInfo": "当前数据为从第 _START_ 到第 _END_ 项数据；总共有 _TOTAL_ 项记录",
                        "sInfoEmpty": "显示 0 至 0 共 0 项",
                        "sInfoFiltered": "(_MAX_)",
                        oPaginate: {
                            "sFirst": "首页",
                            "sNext": "下一页",
                            "sLast": "尾页",
                            "sPrevious": "上一页"
                        }
                    },
                    "aoColumns": [
                        {  "mDataProp": "name", "sClass": "center" },
                        {  "mDataProp": "describe", "sClass": "center" },
                        {  "mDataProp": "isSystem", "sClass": "center", "fnRender": function (obj) {
                            if (obj.aData.isSystem) {
                                return "是";
                            } else {
                                return "否";
                            }
                        }},
                        {  "mDataProp": "createTime", "sClass": "center" },
                        {  "mDataProp": "createAccount", "sClass": "center"},
                        {
                            "sTitle": "操作",
                            "sClass": "center",
                            "fnRender": function (obj) {
                                return     '<a class="iconlink2" href=\"role/detailedByExt/' + obj.aData.name + '\"><img alt=\"详细信息\" src=\"resource/images/icons/small/black/people.png\"></a>' +
                                        '&nbsp;<a class="iconlink2" href=\"role/edit/' + obj.aData.name + '\"><img alt=\"修改\" src=\"resource/images/icons/small/black/edit.png\"></a>' +
                                        '&nbsp;<a class="iconlink2" href=\"role/delete/' + obj.aData.name + '\"><img alt=\"删除\" src=\"resource/images/icons/small/black/close.png\"></a>';
                            }
                        }
                    ]
                });
            })
            accounTable = jQuery('#accounTable').dataTable({
                bPaginate: true,
                bSort: false,
                "sPaginationType": "full_numbers",
                bFilter: false,
                "bProcessing": false,
                "bServerSide": true,
                "sAjaxSource": "role/list/get?rand=" + Math.random(),
                "fnServerData": function (sSource, aoData, fnCallback) {
                    aoData.push({ "name": "page", "value": aoData[3].value / aoData[4].value + 1  });
                    aoData.push({ "name": "limit", "value": aoData[4].value  });
                    jQuery.ajax({
                        "dataType": 'json',
                        "type": "get",
                        "url": sSource,
                        "data": aoData,
                        "success": function (rep) {
                            fnCallback(rep);
                            jQuery("#accounTable_length").after( '<div class="dataTables_filter" id="example_filter"><label>' +
                                    '<a class="iconlink" href="role/create">' +
                                    '<img src="resource/images/icons/small/white/plus.png" class="mgright5" alt="">' +
                                    '<span>新增</span></a></label></div>');

                        }
                    });
                },
                "sAjaxDataProp": "entity.content",
                "oLanguage": {
                    "sProcessing": "正在加载数据...",
                    'sSearch': '数据筛选:',
                    "sLengthMenu": "每页显示 _MENU_ 项记录",
                    "sZeroRecords": "没有符合项件的数据...",
                    "sInfo": "当前数据为从第 _START_ 到第 _END_ 项数据；总共有 _TOTAL_ 项记录",
                    "sInfoEmpty": "显示 0 至 0 共 0 项",
                    "sInfoFiltered": "(_MAX_)",
                    oPaginate: {
                        "sFirst": "首页",
                        "sNext": "下一页",
                        "sLast": "末页",
                        "sPrevious": "上一页"
                    }
                },
                "aoColumns": [
                    {  "mDataProp": "name", "sClass": "center" },
                    {  "mDataProp": "describe", "sClass": "center" },
                    {  "mDataProp": "isSystem", "sClass": "center", "fnRender": function (obj) {
                        if (obj.aData.isSystem) {
                            return "是";
                        } else {
                            return "否";
                        }
                    }},
                    {  "mDataProp": "createTime", "sClass": "center" },
                    {  "mDataProp": "createAccount", "sClass": "center"},
                    {
                        "sTitle": "操作",
                        "sClass": "center",
                        "fnRender": function (obj) {
                            return     '<a class="iconlink2" href=\"role/detailedByExt/' + obj.aData.name + '\"><img alt=\"详细信息\" src=\"resource/images/icons/small/black/people.png\"></a>' +
                                    '&nbsp;<a class="iconlink2" href=\"role/edit/' + obj.aData.name + '\"><img alt=\"修改\" src=\"resource/images/icons/small/black/edit.png\"></a>' +
                                    '&nbsp;<a class="iconlink2" href=\"role/delete/' + obj.aData.name + '\"><img alt=\"删除\" src=\"resource/images/icons/small/black/close.png\"></a>';
                        }
                    }
                ]
            });


        });
    </script>
</head>
<body class="bodygrey">
<div style="display: none;" id="cboxOverlay"></div>
<div style="padding-bottom: 20px; padding-right: 0px; display: none;" class="" id="colorbox">
    <div id="cboxWrapper">
        <div>
            <div style="float: left;" id="cboxTopLeft"></div>
            <div style="float: left;" id="cboxTopCenter"></div>
            <div style="float: left;" id="cboxTopRight"></div>
        </div>
        <div style="clear: left;">
            <div style="float: left;" id="cboxMiddleLeft"></div>
            <div style="float: left;" id="cboxContent">
                <div style="width: 0px; height: 0px; overflow: hidden; float: left;" id="cboxLoadedContent"></div>
                <div style="float: left;" id="cboxLoadingOverlay"></div>
                <div style="float: left;" id="cboxLoadingGraphic"></div>
                <div style="float: left;" id="cboxTitle"></div>
                <div style="float: left;" id="cboxCurrent"></div>
                <div style="float: left;" id="cboxNext"></div>
                <div style="float: left;" id="cboxPrevious"></div>
                <div style="float: left;" id="cboxSlideshow"></div>
                <div style="float: left;" id="cboxClose"></div>
            </div>
            <div style="float: left;" id="cboxMiddleRight"></div>
        </div>
        <div style="clear: left;">
            <div style="float: left;" id="cboxBottomLeft"></div>
            <div style="float: left;" id="cboxBottomCenter"></div>
            <div style="float: left;" id="cboxBottomRight"></div>
        </div>
    </div>
    <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
</div>
<div class="headerspace"></div>
<jsp:include page="../common/top.jsp" />
<jsp:include page="../common/left.jsp" />
<jsp:include page="view.jsp"/>
<br/>
<div class="footer">
    <jsp:include page="../common/_footer.jsp"/>
</div>
</body>
</html>