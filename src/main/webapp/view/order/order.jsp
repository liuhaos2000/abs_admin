<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/main.css">
<title>订单管理</title>
</head>
<body>
<table id="list_dg" style="width:auto" >
	<thead>
	<tr>
	    <th data-options="field:'ck',checkbox:true">订单号</th>
		<th data-options="field:'order_id'">订单号</th>
        <th data-options="field:'order_date'">订单日期</th>
		<th data-options="field:'from_name'">发货源</th>
		<th data-options="field:'to_name'">发货地址</th>
		<th data-options="field:'name'">姓名</th>
        <th data-options="field:'tel'">电话</th>
        <th data-options="field:'item_name'">商品名称</th>
        <th data-options="field:'guige_text'">型号</th>
        <th data-options="field:'yanse_text'">颜色</th>
        <th data-options="field:'shuliang'">数量</th>
        <th data-options="field:'status'">状态</th>
        <th data-options="field:'remark'">操作</th>
	</tr>
	<thead>
</table>

<div id="list_dg_toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="sendItem()">发货</a>
</div>

<div id="send_item_dialog" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
        closed="true" buttons="#send_item_dialog_buttons" modal="true">
    <div class="ftitle">请输入发货信息</div>
    <form id="wuliu_info_form" method="post">
        <div class="fitem">
            <label>快递公司:</label>
            <input type="text" name="roleName" />
        </div>
        <div class="fitem">
            <label>单号:</label>
            <input type="text" name="remark" />
        </div>
        
        <input type="hidden" name="roleId" />
    </form>
</div>
<div id="send_item_dialog_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#send_item_dialog').dialog('close')">取消</a>
</div>

<script type="text/javascript">

var UrlConfig = {
	orderList: '<%=request.getContextPath() %>/app/admin/order/list',
		   SysRoleList: '<%=request.getContextPath() %>/app/sys/role/list',
};

$(function(){
	var wOrder="";
	var colorS=["#94E698","#91BEDA"];
	var color = "";

	$('#list_dg').datagrid({
		url: UrlConfig.orderList,
		toolbar: '#list_dg_toolbar',
		rownumbers: true,
		fit: true,
		fitColumns: true,
		rowStyler:function(index,row){
			if(wOrder==row.order_id){
			}else{
				if(color==colorS[0]){
					color=colorS[1];
				}else{
					color=colorS[0];
				}
				wOrder=row.order_id;
			}
			return 'background-color:'+color;
		}
	});
	
});
function sendItem(){
    $('#send_item_dialog').dialog('open').dialog('setTitle','发货');
    $('#wuliu_info_form').form('clear');
    url = UrlConfig.SysRoleAdd;
}
</script>

</body>
</html>