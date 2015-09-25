<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <div id="tiaojian-div" class="easyui-panel" title="查询条件" >
        <div style="padding:5px 5px 5px 5px">
        <form id="ff" method="post">
            <table>
                <tr>
                    <td>&nbsp;&nbsp;订单状态:</td>
                    <td>
                        <select class="easyui-combobox" id="orderStatus" name="orderStatus" style="width:100px;">
                             <option value="">-- 请选择 --</option>
                             <c:forEach items="${orderStatusList}" var="item">
                                <option value="${item.subTypeCode}">${item.subTypeName}</option>
                             </c:forEach>
                        </select>
                    </td>
                    <td> &nbsp;&nbsp;期间:</td>
                    <td><input class="easyui-textbox" id="orderDateFrom" name="orderDateFrom" style="width:100px;"></input></td>
                    <td>&nbsp;—&nbsp;<input class="easyui-textbox" id="orderDateTo" name="orderDateTo" style="width:100px;"></input></td>
                    <td> &nbsp;&nbsp;电话:</td>
                    <td><input class="easyui-textbox" type="text" id="sTel" style="width:100px;" maxlength="11"></input></td>
                    <td> &nbsp;&nbsp;订单号:</td>
                    <td><input class="easyui-textbox" type="text" id="sOrderId" style="width:120px" maxlength="14"></input></td>
                    <td>&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" onclick="doSearch()">检索</a></td>
                </tr>
            </table>
        </form>
        </div>
    </div>
<div id="jieguo-div" class="easyui-panel" title="订单列表" >
<table id="list_dg" style="width:auto " >
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
        <th data-options="field:'sub_status'" formatter="statusFormat">状态</th>
        <th data-options="field:'remark'">操作</th>
	</tr>
	<thead>
</table>
</div>
<div id="list_dg_toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="sendItem()">发货</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="getExcel()">EXCEL</a>
</div>

<div id="send_item_dialog" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
        closed="true" buttons="#send_item_dialog_buttons" modal="true">
    <div class="ftitle">请输入发货信息</div>
    <form id="wuliu_info_form" method="post">
        <div class="fitem">
            <label>快递公司:</label>
            <input type="text" name="wuliugongsi" />
        </div>
        <div class="fitem">
            <label>单号:</label>
            <input type="text" name="wuliuNo" />
        </div>
        <input type="hidden" name="orderId" />
    </form>
</div>
<div id="send_item_dialog_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#send_item_dialog').dialog('close')">取消</a>
</div>

<script type="text/javascript">
var UrlConfig = {
	    orderList: '<%=request.getContextPath() %>/app/admin/order/list',
	    getExcel: '<%=request.getContextPath() %>/app/admin/order/getExcel',
	};

	$(function(){
	    
	    $('#jieguo-div').height($('#tiaojian-div').parent().height()-$('#tiaojian-div').height()-40);
	    $('#orderDateFrom').datebox({
	    });  
	    $('#orderDateTo').datebox({
	    }); 

	    var wOrder="";
	    var colorS=["#94E698","#91BEDA"];
	    var color = "";

	    $('#list_dg').datagrid({
	        url: UrlConfig.orderList,
	        toolbar: '#list_dg_toolbar',
	        //queryParams:getSearchParm(),
	        rownumbers: true,
	        pagination: true,
	        pageSize: 15,
	        pageList:[15,20,30,50,100],
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
		// Check
		// 
		$('#send_item_dialog').dialog('open').dialog('setTitle','发货');
	    $('#wuliu_info_form').form('clear');
	}

	function doSearch(){
		$('#list_dg').datagrid('reload',getSearchParm());
	}

	function getExcel(){
	    window.open(UrlConfig.getExcel) ;
	}
	
    function getSearchParm(){
        
        var orderStatus = $('#orderStatus').combobox('getValue');
        var orderDateFrom = $('#orderDateFrom').datebox('getValue');
        var orderDateTo = $('#orderDateTo').datebox('getValue');
        var tel = $('#sTel').val();
        var orderId = $('#sOrderId').val();
        var parm = {
                       orderStatus:orderStatus,
                       orderDateFrom:orderDateFrom,
                       orderDateTo:orderDateTo,
                       tel:tel,
                       orderId:orderId
                   };
        return parm;
    }
function statusFormat(value,rowData,rowIndex){
	if(value=='1'){
		return '未支付';
	}else if(value=='2'){
		return '已付款';
	}else if(value=='3'){
		return '已发货';
	}else if(value=='4'){
        return '已收货';
	}
}
</script>

</body>
</html>