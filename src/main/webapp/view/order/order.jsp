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
                
                    <td>&nbsp;&nbsp;货源:</td>
                    <td>
                        <select class="easyui-combobox" id="ownerOpenId" name="ownerOpenId" style="width:100px;">
                             <option value="">-- 请选择 --</option>
                             <c:forEach items="${onwerList}" var="item">
                                <option value="${item.owner_open_id}">${item.owner}</option>
                             </c:forEach>
                        </select>
                    </td>
                    <td>&nbsp;&nbsp;订单状态:</td>
                    <td>
                        <select class="easyui-combobox" id="orderStatus" name="orderStatus" style="width:100px;">
                             <option value="">-- 请选择 --</option>
                             <c:forEach items="${orderStatusMap}" var="item">
                                <option value="${item.key}">${item.value}</option>
                             </c:forEach>
                        </select>
                    </td>
                    <td> &nbsp;&nbsp;期间:</td>
                    <td><input class="easyui-textbox" editable="false" id="orderDateFrom" name="orderDateFrom" style="width:100px;"></input></td>
                    <td>&nbsp;—&nbsp;<input class="easyui-textbox" editable="false" id="orderDateTo" name="orderDateTo" style="width:100px;"></input></td>
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
		<th data-options="field:'owner'">发货源</th>
		<th data-options="field:'address_full'">发货地址</th>
		<th data-options="field:'name'">姓名</th>
        <th data-options="field:'tel'">电话</th>
        <th data-options="field:'item_name'">商品名称</th>
        <th data-options="field:'guige_text'">型号</th>
        <th data-options="field:'yanse_text'">颜色</th>
        <th data-options="field:'shuliang'">数量</th>
        <th data-options="field:'status'" formatter="statusFormat">主状态</th>
        <th data-options="field:'sub_status'" formatter="statusFormat">状态</th>
        <th data-options="field:'tuihuo_flg'" >退货</th>
        
        <th data-options="field:'gongsi_id'" >物流公司ID</th>
        <th data-options="field:'gongsi_name'" >物流公司</th>
        <th data-options="field:'wuliu_code'" >物流编号</th>
        
        <th data-options="field:'price'" >成交价</th>
        <th data-options="field:'cost'" >成本</th>
        <th data-options="field:'lv00_lirun'" >利1</th>
        <th data-options="field:'lv01_lirun'" >利2</th>
        <th data-options="field:'lv02_lirun'" >利3</th>
        <th data-options="field:'item_id'" >k1</th>
        <th data-options="field:'item_guige'" >k2</th>
        <th data-options="field:'item_yanse'" >k3</th>
        <th data-options="field:'tuihuo_flg'" >k4</th>
	</tr>
	<thead>
</table>
</div>
<div id="list_dg_toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="sendItem()">发货</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="getExcel()">EXCEL</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="backItem()">退货</a>
</div>

<!-- 物流信息更新窗口START -->
<div id="send_item_dialog" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
        closed="true" buttons="#send_item_dialog_buttons" modal="true">
    <div class="ftitle">请输入发货信息</div>
    <form id="wuliu_info_form" method="post">
        <div class="fitem">
            <label>快递公司:</label>
            <select class="easyui-combobox" id="wuliuGongsi" name="wuliuGongsi" style="width:100px;">
                             <option value="">-- 请选择 --</option>
                             <c:forEach items="${wuliuGongsiList}" var="item">
                                <option value="${item.gongsi_id}">${item.gongsi_name}</option>
                             </c:forEach>
            </select>
        </div>
        <div class="fitem">
            <label>物流单号:</label>
            <input type="text" id="wuliuNo"  name="wuliuNo" size="20" maxlength="20"/>
        </div>
        <input type="hidden" name="orderId" />
    </form>
</div>
<div id="send_item_dialog_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveOrderWuliu()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#send_item_dialog').dialog('close')">取消</a>
</div>
<!-- 物流信息更新窗口END -->


<!-- 退货窗口START -->
<div id="back_item_dialog" class="easyui-dialog" style="width:600px;height:500px;padding:10px 20px"
        closed="true" data-options="buttons: [{
					text:'保存',iconCls:'icon-ok',handler:function(){
						saveBackItem();
					}
				},{
					text:'取消',iconCls:'icon-cancel',handler:function(){
						$('#back_item_dialog').dialog('close');
					}
				}]" modal="true">

    <div class="ftitle">请输入退货信息</div>
    <form id="back_item_form" method="post">
        <label><p><strong>■退货金额</strong></p></label>
        <div class="fitem">
            <label>退货金额:</label>
            <input class="easyui-numberbox" precision="2" type="text" id="oldbackItemPrice"  name="oldbackItemPrice" size="8" maxlength="8" disabled="disabled"/>⇒
            <input class="easyui-numberbox" precision="2" type="text" id="backItemPrice"  name="backItemPrice" size="8" maxlength="8"/>
        </div>
        <hr>
        <label><p><strong>■退货分担</strong></p></label>
        <div class="fitem">
            <label>辅助选项*:</label>
           
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="fuzhuAllBack()">全额退款</a>
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="fuzhuPingjun()">部分退款（平均分担）</a>
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="fuzhuZiyou()">自由输入</a>
       
        </div>
        <div class="fitem">
            <label>成本:</label>
            <input class="easyui-numberbox" precision="2" type="text" id="oldcost"  name="oldcost" size="8" maxlength="8" disabled="disabled"/>⇒
            <input class="easyui-numberbox" precision="2" type="text" id="cost"  name="cost" size="8" maxlength="8"/>
        </div>
        <div class="fitem">
            <label>店铺:</label>
            <input class="easyui-numberbox" precision="2" type="text" id="oldlv00_lirun"  name="oldlv00_lirun" size="8" maxlength="8" disabled="disabled"/>⇒
            <input class="easyui-numberbox" precision="2" type="text" id="lv00_lirun"  name="lv00_lirun" size="8" maxlength="8"/>
        </div>
        <div class="fitem">
            <label>一级进销商:</label>
            <input class="easyui-numberbox" precision="2" type="text" id="oldlv01_lirun"  name="oldlv01_lirun" size="8" maxlength="8" disabled="disabled"/>⇒
            <input class="easyui-numberbox" precision="2" type="text" id="lv01_lirun"  name="lv01_lirun" size="8" maxlength="8"/>
        </div>
        <div class="fitem">
            <label>二级进销商:</label>
            <input class="easyui-numberbox" precision="2" type="text" id="oldlv02_lirun"  name="oldlv02_lirun" size="8" maxlength="8" disabled="disabled"/>⇒
            <input class="easyui-numberbox" precision="2" type="text" id="lv02_lirun"  name="lv02_lirun" size="8" maxlength="8" />
        </div>
        <hr>
        <label><p><strong>■退货物流信息</strong></p></label>
        <div class="fitem">
            <label>快递公司:</label>
            <select class="easyui-combobox" id="backItemWuliuGongsi" name="backItemWuliuGongsi" style="width:100px;">
                             <option value="">-- 请选择 --</option>
                             <c:forEach items="${wuliuGongsiList}" var="item">
                                <option value="${item.gongsi_id}">${item.gongsi_name}</option>
                             </c:forEach>
            </select>
        </div>
        <div class="fitem">
            <label>物流单号:</label>
            <input type="text" id="backItemWuliuNo"  name="backItemWuliuNo" size="20" maxlength="20"/>
        </div>
        
    </form>

</div>
<!-- 退货窗口END -->

<script type="text/javascript">
var UrlConfig = {
	    orderList: '<%=request.getContextPath() %>/app/admin/order/list',
	    getExcel: '<%=request.getContextPath() %>/app/admin/order/getExcel',
	    wuliuSave: '<%=request.getContextPath() %>/app/admin/order/wuliuSave',
	    backItemSave: '<%=request.getContextPath() %>/app/admin/order/backItemSave',
	};

	$(function(){
	    
	    $('#jieguo-div').height($('#tiaojian-div').parent().height()-$('#tiaojian-div').height()-40);
	    $('#orderDateFrom').datebox({
	    });  
	    $('#orderDateTo').datebox({
	    }); 

	    // 间隔变色
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



	// 检索按钮
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
        var ownerOpenId = $('#ownerOpenId').combobox('getValue');
        var parm = {
                       orderStatus:orderStatus,
                       orderDateFrom:orderDateFrom,
                       orderDateTo:orderDateTo,
                       tel:tel,
                       orderId:orderId,
                       ownerOpenId:ownerOpenId
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
	}else if(value=='5'){
		return '关闭';
	}
}

// 一栏的 发货按钮
function sendItem(){
	// Check
    var ids = [];
    var rows = $('#list_dg').datagrid('getSelections');
    if(rows.length==0){
        $.messager.show({
            title:'错误提示',
            msg:'请选择数据！',
            showType:'fade',
            style:{right:'',bottom:''}
        });
        return;
    }
    var wkOrderId=rows[0].order_id;
    for(var i=0;i<rows.length;i++){
        // ids.push(rows[i].order_id);
        if (rows[i].sub_status!='2' && rows[i].sub_status!='3') {
             $.messager.show({
                 title:'错误提示',
                 msg:'选择的订单状态不是[已支付],[已发货]！',
                 showType:'fade',
                 style:{right:'',bottom:''}
             });
             return;
        }
		if(rows[i].tuihuo_flg!="0"){
			$.messager.show({ title: '操作结果', msg: '选择的数据为退货数据！', 
				showType:'fade',style:{right:'',bottom:''}});
			return false;
		}
        // 两个相同的订单号 错误
        if(wkOrderId!=rows[i].order_id){
			$.messager.show({ title: '操作结果', msg: '请选择同一个订单号的数据！', 
				showType:'fade',style:{right:'',bottom:''}});
			return false;
        }
        
    }
    
	$('#send_item_dialog').dialog('open').dialog('setTitle','发货');
    $('#wuliu_info_form').form('clear');

}
// 物流窗口的 输入物流信息并且保存 
function saveOrderWuliu(){
	
    if ($('#wuliuGongsi').val() == '') {
		$.messager.show({ title: '操作结果', msg: '公司输入为空' });
    	return false;
    }
	if ($.trim($('#wuliuNo').val()).length == 0) {
		$.messager.show({ title: '操作结果', msg: '物流单号输入为空' });
		return false;
	}
	
	
	var url = UrlConfig.wuliuSave;
	var rows = $('#list_dg').datagrid('getSelections');
	var list = new Array();
    
	for(var i=0;i<rows.length;i++){
		list.push({orderId: rows[i].order_id,
			itemId: rows[i].item_id,
            itemGuige: rows[i].item_guige,
            itemYanse: rows[i].item_yanse,
            tuihuoFlg: rows[i].tuihuo_flg})
	}
    if(list.length==0){
        $.messager.show({
            title:'错误提示',
            msg:'没有选择订单！',
            showType:'fade',
            style:{right:'',bottom:''}
        });
    	return;
    }
    
    var orderItems=JSON.stringify(list);
		
	var data = {wuliuGongsi: $('#wuliuGongsi').val(), 
			wuliuNo: $.trim($('#wuliuNo').val()), 
			orderItems: orderItems};
	
	$.post(
			url,
			data,
			function(result) {
				if (result.successful) {
					$('#send_item_dialog').dialog('close');
					$('#list_dg').datagrid('reload',getSearchParm());
					$.messager.show({title: '操作结果',msg: '操作成功！'});				
				}else{
					$.messager.show({title: '操作结果',msg: '保存失败！'});	
				}
			}, 
			'json');
}

// 一览上的退货按钮
function backItem(){
	// Check
    var ids = [];
    var rows = $('#list_dg').datagrid('getSelections');
    if(rows.length==0){
        $.messager.show({
            title:'错误提示',msg:'请选择数据！',
            showType:'fade',style:{right:'',bottom:''}
        });
        return;
    }
    if(rows.length>1){
        $.messager.show({
            title:'错误提示',msg:'只能选择单条数据一件一件退货！',
            showType:'fade',style:{right:'',bottom:''}
        });
        return;
    }
    var wkOrderId=rows[0].order_id;
    for(var i=0;i<rows.length;i++){
        // ids.push(rows[i].order_id);
        // 非退货数据需要再check
        if(rows[i].tuihuo_flg!='1'){
        	// 已经付款，已经发货，已经收货，可走退货流程
            if (rows[i].sub_status!='2' && rows[i].sub_status!='3' && rows[i].sub_status!='4') {
                $.messager.show({
                    title:'错误提示',
                    msg:'选择的订单状态不正确！',
                    showType:'fade',
                    style:{right:'',bottom:''}
                });
                return;
           }
        } else{
        	//退货数据可以更新，直接跳过
        }
        
    }

	$('#back_item_dialog').dialog('open').dialog('setTitle','退货');
    $('#back_item_form').form('clear');
    
    $('#oldbackItemPrice').numberbox('setValue',rows[0].price);
    $('#oldcost').numberbox('setValue',rows[0].cost);
    $('#oldlv00_lirun').numberbox('setValue',rows[0].lv00_lirun);
    $('#oldlv01_lirun').numberbox('setValue',rows[0].lv01_lirun);
    $('#oldlv02_lirun').numberbox('setValue',rows[0].lv02_lirun);
    
    $('#backItemWuliuGongsi').combobox('select', rows[0].gongsi_id);
    $('#backItemWuliuNo').val(rows[0].wuliu_code);
    
}
// 退货窗口的保存按钮
function saveBackItem(){
	var url = UrlConfig.backItemSave;
	var rows = $('#list_dg').datagrid('getSelections');
	var data = {
			orderId:rows[0].order_id,
			itemId:rows[0].item_id,
			itemGuige:rows[0].item_guige,
			itemYanse:rows[0].item_yanse,
			tuihuoFlg:rows[0].tuihuo_flg,
			
			price: $('#backItemPrice').numberbox('getValue'), 
			cost: $('#cost').numberbox('getValue'), 
			lv00Lirun: $('#lv00_lirun').numberbox('getValue'), 
			lv01Lirun: $('#lv01_lirun').numberbox('getValue'), 
			lv02Lirun: $('#lv02_lirun').numberbox('getValue'), 
			
			gongsiId: $('#backItemWuliuGongsi').val(), 
			wuliuCode: $.trim($('#backItemWuliuNo').val())
			};
	$.post(
			url,
			data,
			function(result) {
				if (result.successful) {
					$('#back_item_dialog').dialog('close');
					$('#list_dg').datagrid('reload',getSearchParm());
					$.messager.show({title: '操作结果',msg: '操作成功！'});				
				}else{
					$.messager.show({title: '操作结果',msg: '保存失败！'});	
				}
			}, 
			'json');
}
//辅助方法
function fuzhuAllBack(){
	$('#backItemPrice').numberbox('setValue',$('#oldbackItemPrice').numberbox('getValue'));
	$('#cost').numberbox('setValue',$('#oldcost').numberbox('getValue'));
	$('#lv00_lirun').numberbox('setValue',$('#oldlv00_lirun').numberbox('getValue'));
	$('#lv01_lirun').numberbox('setValue',$('#oldlv01_lirun').numberbox('getValue'));
	$('#lv02_lirun').numberbox('setValue',$('#oldlv02_lirun').numberbox('getValue'));
	
}
function fuzhuPingjun(){
	
}
function fuzhuZiyou(){
	
}

</script>

</body>
</html>