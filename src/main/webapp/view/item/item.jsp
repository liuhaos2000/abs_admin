<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/easyui/themes/icon.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/style/main.css">
<title>商品管理</title>
</head>
<body>
	<div id="tiaojian-div" class="easyui-panel" title="查询条件">
		<div style="padding: 5px 5px 5px 5px">
			<form id="ff" method="post">
				<table>
					<tr>

						<td>&nbsp;&nbsp;货源:</td>
						<td><select class="easyui-combobox" id="searchOwnerOpenId"
							style="width: 100px;">
								<option value="">-- 请选择 --</option>
								<c:forEach items="${onwerList}" var="item">
									<option value="${item.owner_open_id}">${item.owner}</option>
								</c:forEach>
						</select></td>
						<td>&nbsp;&nbsp;商品名称:</td>
						<td><input class="easyui-textbox" type="text"
							id="searchItemName" style="width: 120px" maxlength="14"></input></td>
						<td>&nbsp;&nbsp;<a href="javascript:void(0)"
							class="easyui-linkbutton" onclick="doSearch()">检索</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="jieguo-div" class="easyui-panel" title="商品列表">
		<table id="list_dg" style="width: auto">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true">商品</th>
					<th data-options="field:'item_id'">商品ID</th>
					<th data-options="field:'item_name'">商品名称</th>
					<th data-options="field:'shouhou_miaoshu'">显示顺序</th>
					<th data-options="field:'owner'">所属</th>
					<th data-options="field:'type'">分类</th>
					<th data-options="field:'type_name'">分类名称</th>
					<th data-options="field:'baoyou_flg'" formatter="format1">包邮FLG</th>
					<th data-options="field:'shangjia_flg'" formatter="format2">上架FLG</th>
				</tr>
			<thead>
		</table>
	</div>
	<div id="list_dg_toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="addItem()">新建商品</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="updItem()">修改商品</a>
	</div>

	<!-- 商品窗口START -->
	<div id="item_dialog" class="easyui-dialog"
		style="width: 960px; height: 600px; padding: 10px 20px" closed="true"
		data-options="buttons: [{
					text:'保存',iconCls:'icon-ok',handler:function(){
						saveItem();
					}
				},{
					text:'取消',iconCls:'icon-cancel',handler:function(){
						$('#item_dialog').dialog('close');
					}
				}]"
		modal="true">

		<div class="ftitle">请输商品信息【<Span id="mode" style="color: red;"></Span>】</div>
		<form id="item_form" method="post">
			<label><p><strong>■商品信息</strong></p></label>
			
			<div class="fitem">
				<label>商品名称:</label> 
				<input type="text" id="itemName" name="itemName" size="20" maxlength="20" /> 
				<label>制造商:</label>
				 <input type="text" id="manufacturer" name="manufacturer"  size="20" maxlength="20" />
				 <label>所属:</label> 
				 <select class="easyui-combobox" id="ownerOpenId" name="ownerOpenId"
					style="width: 100px;">
					<option value="">-- 请选择 --</option>
					<c:forEach items="${vipUserList}" var="user">
						<option value="${user.open_id}">${user.nickname}</option>
					</c:forEach>
				</select> 
			</div>
			<div class="fitem">
				<label>商品分类:</label> <select class="easyui-combobox" id="type" name="type"
					style="width: 100px;">
					<option value="">-- 请选择 --</option>
					<c:forEach items="${typeList}" var="item">
						<option value="${item.key}">${item.value}</option>
					</c:forEach>
				</select> 
				<label>表示顺序:</label> <input type="text"
					id="shouhouMiaoshu" name="shouhouMiaoshu" size="3" maxlength="3" />
			</div>
			<div class="fitem">
				<label>发货地:</label> <select class="easyui-combobox" id="fromArea" name="fromArea"
					style="width: 100px;">
					<option value="">-- 请选择 --</option>
					<c:forEach items="${areaList}" var="item">
						<option value="${item.regionId}">${item.regionName}</option>
					</c:forEach>
				</select> <label>物流公司:</label> <select class="easyui-combobox"
					id="wuliuGongsi" name="fapiaoTitle" style="width: 100px;">
					<option value="">-- 请选择 --</option>
					<c:forEach items="${wuliuGongsiList}" var="item">
						<option value="${item.gongsi_id}">${item.gongsi_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="fitem">
				<label>包邮:</label> <select class="easyui-combobox" id="baoyouFlg" name="baoyouFlg"
					style="width: 100px;">
					<option value="">-- 请选择 --</option>
					<c:forEach items="${baoyouFlg}" var="item">
						<option value="${item.key}">${item.value}</option>
					</c:forEach>
				</select> <label>上架:</label> <select class="easyui-combobox" id="shangjiaFlg" name="shangjiaFlg"
					style="width: 100px;">
					<option value="">-- 请选择 --</option>
					<c:forEach items="${shangjiaFlg}" var="item">
						<option value="${item.key}">${item.value}</option>
					</c:forEach>
				</select>
			</div>
			<div class="fitem">
				<label>转发标题:</label> <input type="text" id="frendTitle" name="frendTitle" size="100"
					maxlength="100" /> 
			</div>
			<div class="fitem">
				<label>转发内容:</label> <input type="text"
					id="frendText" name="frendText" size="100" maxlength="100" /> 
			</div>
			<div class="fitem">
				<label>产品参数:</label> <input
					type="text" id="parm" name="parm" size="100" maxlength="100" />
			</div>
			<div class="fitem">
				<label>设计页面:</label>
				<textarea id="fuText"  rows="10" cols="100">
				</textarea>
			</div>

			<hr>
			<label>
				<p><strong>■商品详细信息</strong></p>
			</label>
			<div class="fitem">
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="detailNew()">新建</a>
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="detailUpd()">更新</a>
            </div>
			<div class="fitem">
				<label>规格:</label> 
				<input type="text" id="edtGuigeText" size="10" maxlength="10" /> 
				<label>数量:</label> 
				<input class="easyui-numberbox" type="text" id="edtShuliang" size="4" maxlength="4" /> 
				<label>重量:</label> 
				<input class="easyui-numberbox" precision="2" type="text" id="edtZhongliang" size="8" maxlength="8" /> 
				<label>上下架:</label> 
				<select class="easyui-combobox" id="edtDelFlg" style="width:100px;">
                             <option value="">-- 请选择 --</option>
                             <c:forEach items="${shangjiaFlg}" var="item">
                                <option value="${item.key}">${item.value}</option>
                             </c:forEach>
                </select>
			</div>
				
			<div class="fitem">	
				<label>价格:</label> 
				<input class="easyui-numberbox" precision="2" type="text" id="edtPrice" size="4" maxlength="4" /> 
				
				<label>成本价:</label> 
				<input class="easyui-numberbox" precision="2" type="text" id="edtCost" size="8" maxlength="8" /> 
				<label>顶级利润:</label> 
				<input class="easyui-numberbox" precision="2" type="text" id="edtLv00Lirun" size="8" maxlength="8" /> 
				<label>一级利润:</label> 
				<input class="easyui-numberbox" precision="2" type="text" id="edtLv01Lirun" size="8" maxlength="8" /> 
				<label>二级利润:</label> 
				<input class="easyui-numberbox" precision="2" type="text" id="edtLv02Lirun" size="8" maxlength="8" /> 

				
				
			</div>
			<div id="itemDetail-div" class="easyui-panel" title="商品列表">
				<table id="itemDetailList_dg" style="width: auto">
				</table>
			</div>
			<hr>
			<label><p>
					<strong>■图片信息</strong>
				</p></label>
			<div class="fitem">
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="pictureNew()">新建</a>
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="pictureUpd()">更新</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="pictureDlt()">删除</a>
            </div>
			<div class="fitem">
				<label>图片类型:</label> 
				<select class="easyui-combobox" id="edtPictureType" style="width:100px;">
                             <option value="">-- 请选择 --</option>
                             <c:forEach items="${pictureType}" var="item">
                                <option value="${item.key}">${item.value}</option>
                             </c:forEach>
                </select>
				<label>显示顺序:</label> 
				<input type="text" id="edtPictureText" size="2" maxlength="2" /> 
				<label>图片地址:</label> 
				<input type="text" id="edtPath" size="60" /> 
			</div>
			<div id="itemPicture-div" class="easyui-panel" title="图片列表">
				<table id="itemPictureList_dg" style="width: auto">
				</table>
			</div>
		</form>

	</div>
	<!-- 退货窗口END -->

	<script type="text/javascript">
	$.fn.serializeObject = function()
	{
	   var o = {};
	   var a = this.serializeArray();
	   $.each(a, function() {
	       if (o[this.name]) {
	           if (!o[this.name].push) {
	               o[this.name] = [o[this.name]];
	           }
	           o[this.name].push(this.value || '');
	       } else {
	           o[this.name] = this.value || '';
	       }
	   });
	   return o;
	};
var UrlConfig = {
	    itemList: '<%=request.getContextPath()%>/app/admin/item/list',
	    getOneItem: '<%=request.getContextPath()%>/app/admin/item/getOneItem',
	    getItemDetailList: '<%=request.getContextPath()%>/app/admin/item/getItemDetailList',
	    getItemPictureList: '<%=request.getContextPath()%>/app/admin/item/getItemPictureList',
	    itemSave: '<%=request.getContextPath()%>/app/admin/item/itemSave'
		};
var mod;
		$(function() {

			$('#jieguo-div').height(
					$('#tiaojian-div').parent().height()
							- $('#tiaojian-div').height() - 40);

			$('#list_dg').datagrid({
				url : UrlConfig.itemList,
				toolbar : '#list_dg_toolbar',
				//queryParams:getSearchParm(),
				rownumbers : true,
				pagination : true,
				pageSize : 15,
				pageList : [ 15, 20, 30, 50, 100 ],
				fit : true,
				fitColumns : true
			});

		});

		// 检索按钮
		function doSearch() {
			$('#list_dg').datagrid('reload', getSearchParm());
		}

		function getSearchParm() {

			var searchItemName = $('#searchItemName').val();
			var searchOwnerOpenId = $('#searchOwnerOpenId')
					.combobox('getValue');
			var parm = {
				searchItemName : searchItemName,
				searchOwnerOpenId : searchOwnerOpenId
			};
			return parm;
		}
		function format1(value, rowData, rowIndex) {
			if (value == '0') {
				return '不包邮';
			} else if (value == '1') {
				return '包邮';
			}
		}
		function format2(value, rowData, rowIndex) {
			if (value == '0') {
				return '下架';
			} else if (value == '1') {
				return '上架';
			}
		}
		// 一栏的 新建按钮
		function addItem() {
			editItem("1")
		}
		function updItem() {
			editItem("2")
		}
		function editItem(pmod) {
			// Check
			var ids = [];
			var rows = $('#list_dg').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.show({
					title : '错误提示',
					msg : '请选择一条可以COPY的数据！',
					showType : 'fade',
					style : {
						right : '',
						bottom : ''
					}
				});
				return;
			}
			if (rows.length > 1) {
				$.messager.show({
					title : '错误提示',
					msg : '只能选择单条数据！',
					showType : 'fade',
					style : {
						right : '',
						bottom : ''
					}
				});
				return;
			}
			//var wkOrderId=rows[0].order_id;
			//for(var i=0;i<rows.length;i++){
			//}

			$('#item_dialog').dialog('open').dialog('setTitle', '新建商品');
			$('#item_form').form('clear');
			// 1 新规，2更新，删除
			mod=pmod;
			loadItem(rows[0].item_id,mod);
			LoadItemDetail(rows[0].item_id);
			LoadItemPricture(rows[0].item_id);
		}
		// item 窗口Load数据
		function loadItem(itemId,mod) {
			// LoadItemBase
			var url = UrlConfig.getOneItem;
			var data = {itemId:itemId};
			$.post(url, data, function(result) {
				if (result.successful) {
					var item = result.data.tItem;
					if(mod=="1"){
						$('#mode').text("新建");
					}else{
						$('#mode').text("修改");
					}
					$('#itemName').val(item.itemName);
					$('#manufacturer').val(item.manufacturer);
					
					$('#ownerOpenId').combobox('select', item.ownerOpenId);
					
					$('#type').combobox('select', item.type);
					$('#shouhouMiaoshu').val(item.shouhouMiaoshu);
					
					$('#wuliuGongsi').combobox('select', item.fapiaoTitle);
					$('#fromArea').combobox('select', item.fromArea);
					$('#baoyouFlg').combobox('select', item.baoyouFlg);
					$('#shangjiaFlg').combobox('select', item.shangjiaFlg);
					
					$('#frendTitle').val(item.frendTitle);
					$('#frendText').val(item.frendText);
					$('#parm').val(item.parm);
					$('#fuText').val(item.fuText);
					
				} else {
					$.messager.show({
						title : '操作结果',msg : '数据加载失败！'
					});
				}
			}, 'json');



		}

		// LoadItemDetail
		function LoadItemDetail(itemId){
			$('#itemDetail-div').height(300);
			$('#itemDetailList_dg').datagrid({
				url : UrlConfig.getItemDetailList,
				//toolbar : '#list_dg_toolbar',
				queryParams:{itemId : itemId},
				rownumbers : true,
				pagination : true,
				pageSize : 15,
				pageList : [ 15, 20, 30, 50, 100 ],
				fit : true,
				singleSelect:true,
				fitColumns : true,
			    columns:[[
				      		{field:'item_guige',title:'规格',hidden:'true',width:20},
				      		{field:'item_yanse',title:'颜色',hidden:'true',width:20},
				      		{field:'updFlg',title:'操作',width:20},
				      		{field:'guige_text',title:'规格',width:50},
				      		{field:'shuliang',title:'数量',width:20},
				      		{field:'price',title:'价格',width:20},
				      		{field:'zhongliang',title:'重量',width:20},
				      		{field:'cost',title:'成本价',width:20},
				      		{field:'lv00_lirun',title:'顶级利润',width:20},
				      		{field:'lv01_lirun',title:'一级利润',width:20},
				      		{field:'lv02_lirun',title:'二级利润',width:20},
				      		{field:'del_flg',title:'上下架',width:20}
				          ]],
				    toolbar: [{
				      		iconCls: 'icon-reload',
				      		handler: function(){$('#itemDetailList_dg').datagrid('reload')}
				      	}],
				    onClickRow: function(rowIndex,rowData){
				    	$('#edtGuigeText').val(rowData.guige_text);
				    	$('#edtShuliang').numberbox('setValue',rowData.shuliang);//数字
				   		$('#edtPrice').numberbox('setValue',rowData.price);//数字
				   		$('#edtZhongliang').numberbox('setValue',rowData.zhongliang);//数字
				   		$('#edtCost').numberbox('setValue',rowData.cost);//数字
				   		$('#edtLv00Lirun').numberbox('setValue',rowData.lv00_lirun);//数字
				   		$('#edtLv01Lirun').numberbox('setValue',rowData.lv01_lirun);//数字
				   		$('#edtLv02Lirun').numberbox('setValue',rowData.lv02_lirun);//数字
				   		$('#edtDelFlg').combobox('select', rowData.del_flg);//下拉
				
				    }
			});
		}
		// LoadItemPricture
		function LoadItemPricture(itemId){
			$('#itemPicture-div').height(600);
			$('#itemPictureList_dg').datagrid({
				url : UrlConfig.getItemPictureList,
				//toolbar : '#list_dg_toolbar',
				queryParams:{itemId : itemId},
				rownumbers : true,
				pagination : true,
				singleSelect:true,
				pageSize : 15,
				pageList : [ 15, 20, 30, 50, 100 ],
				singleSelect: true,
				fit : true,
				fitColumns : true,
			    columns:[[
				      	{field:'picture_id',hidden:'true',title:'ID',width:20},
			      		{field:'updFlg',title:'操作',width:20},
			      		{field:'picture_type',title:'图片类型',width:20},
			      		{field:'picture_text',title:'显示顺序',width:20},
			      		{field:'path',title:'图片显示',formatter:function(value,row,index){
			      	    	if('' != value && null != value)
			      	        	value = '<img style="width:60px; height:60px" src="' + value + '">';
			      	        	return  value;
							},width:50}
			          ]],
			    toolbar: [{
			      		iconCls: 'icon-reload',
			      		handler: function(){$('#itemPictureList_dg').datagrid('reload')}
			      	}],
				onClickRow: function(rowIndex,rowData){
				    	$('#edtPictureText').val(rowData.picture_text);
				    	$('#edtPath').val(rowData.path);
				   		$('#edtPictureType').combobox('select', rowData.picture_type);//下拉
				
				}
			});
		}
//明细
function detailNew(){
	if($('#edtGuigeText').val()=="" ||
			$('#edtShuliang').numberbox('getValue')=="" ||
			$('#edtZhongliang').numberbox('getValue')=="" ||
			$('#edtPrice').numberbox('getValue')==""||
			$('#edtCost').numberbox('getValue')==""||
			$('#edtLv00Lirun').numberbox('getValue')==""||
			$('#edtLv00Lirun').numberbox('getValue')==""||
			$('#edtLv00Lirun').numberbox('getValue')==""||
			$('#edtDelFlg').combobox('getValue')==""
			){
		
		$.messager.show({
			title : '错误提示',
			msg : '输入有误！',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
		return;
	}
	
	
	$('#itemDetailList_dg').datagrid('appendRow',{
		updFlg: 'A',
		guige_text: $('#edtGuigeText').val(),
		shuliang: $('#edtShuliang').numberbox('getValue'),
		zhongliang: $('#edtZhongliang').numberbox('getValue'),
		price: $('#edtPrice').numberbox('getValue'),
		cost: $('#edtCost').numberbox('getValue'),
		lv00_lirun: $('#edtLv00Lirun').numberbox('getValue'),
		lv01_lirun: $('#edtLv01Lirun').numberbox('getValue'),
		lv02_lirun: $('#edtLv02Lirun').numberbox('getValue'),
		del_flg: $('#edtDelFlg').combobox('getValue')
	});
}
function detailUpd(){
	if($('#edtGuigeText').val()=="" ||
			$('#edtShuliang').numberbox('getValue')=="" ||
			$('#edtZhongliang').numberbox('getValue')=="" ||
			$('#edtPrice').numberbox('getValue')==""||
			$('#edtCost').numberbox('getValue')==""||
			$('#edtLv00Lirun').numberbox('getValue')==""||
			$('#edtLv00Lirun').numberbox('getValue')==""||
			$('#edtLv00Lirun').numberbox('getValue')==""||
			$('#edtDelFlg').combobox('getValue')==""
			){
		
		$.messager.show({
			title : '错误提示',
			msg : '输入有误！',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
		return;
	};
	var rows = $('#itemDetailList_dg').datagrid('getSelections');
	if (rows.length == 0) {
		$.messager.show({
			title : '错误提示',
			msg : '请选择一条数据！',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
		return;
	};
	
	$('#itemDetailList_dg').datagrid('updateRow',{
		index: $('#itemDetailList_dg').datagrid('getRowIndex',$('#itemDetailList_dg').datagrid('getSelected')),
		row: {
			updFlg: 'U',
			guige_text: $('#edtGuigeText').val(),
			shuliang: $('#edtShuliang').numberbox('getValue'),
			zhongliang: $('#edtZhongliang').numberbox('getValue'),
			price: $('#edtPrice').numberbox('getValue'),
			cost: $('#edtCost').numberbox('getValue'),
			lv00_lirun: $('#edtLv00Lirun').numberbox('getValue'),
			lv01_lirun: $('#edtLv01Lirun').numberbox('getValue'),
			lv02_lirun: $('#edtLv02Lirun').numberbox('getValue'),
			del_flg: $('#edtDelFlg').combobox('getValue')
		}
	});
}
//图
function pictureNew(){
	if($('#edtPictureText').val()=="" ||
			$('#edtPath').val()=="" ||
			$('#edtPictureType').combobox('getValue')==""
			){
		$.messager.show({
			title : '错误提示',
			msg : '输入有误！',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
		return;
	}
	$('#itemPictureList_dg').datagrid('appendRow',{
		updFlg: 'A',
		picture_type: $('#edtPictureType').combobox('getValue'),
		picture_text: $('#edtPictureText').val(),
		path: $('#edtPath').val()
	});
}
function pictureUpd(){
	if($('#edtPictureText').val()=="" ||
			$('#edtPath').val()=="" ||
			$('#edtPictureType').combobox('getValue')==""
			){
		$.messager.show({
			title : '错误提示',
			msg : '输入有误！',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
		return;
	};
	var rows = $('#itemPictureList_dg').datagrid('getSelections');
	if (rows.length == 0) {
		$.messager.show({
			title : '错误提示',
			msg : '请选择一条数据！',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
		return;
	};
	$('#itemPictureList_dg').datagrid('updateRow',{
		index: $('#itemPictureList_dg').datagrid('getRowIndex',$('#itemPictureList_dg').datagrid('getSelected')),
		row: {
			updFlg: 'U',
			picture_type: $('#edtPictureType').combobox('getValue'),
			picture_text: $('#edtPictureText').val(),
			path: $('#edtPath').val()
		}
	});
	
	
}
function pictureDlt(){
	var rows = $('#itemPictureList_dg').datagrid('getSelections');
	if (rows.length == 0) {
		$.messager.show({
			title : '错误提示',
			msg : '请选择一条数据！',
			showType : 'fade',
			style : {
				right : '',
				bottom : ''
			}
		});
		return;
	};
	$('#itemPictureList_dg').datagrid('updateRow',{
		index: $('#itemPictureList_dg').datagrid('getRowIndex',$('#itemPictureList_dg').datagrid('getSelected')),
		row: {
			updFlg: 'D'
		}
	});
}
		
function saveItem(){
	var changeMod=mod;
	var itemData = $("#item_form").serializeObject();
	// fu文本
	var futext = encodeURI($('#fuText').val());
	alert($('#fuText').val());
	//itemData = decodeURIComponent(itemData,true);
	//alert(itemData);
	//itemData = decodeURIComponent(itemData,true);
	//itemData = encodeURI(encodeURI(itemData)); 
	
	//var rows1 = $('#itemDetailList_dg').datagrid('getChanges');
	var rows1 = $('#itemDetailList_dg').datagrid('getRows');
	var itemDetailData=JSON.stringify(rows1)
	
	//var rows2=$('#itemPictureList_dg').datagrid('getChanges')
	var rows2 = $("#itemPictureList_dg").datagrid("getRows");
	var itemPictureData=JSON.stringify(rows2)
	
	var rows = $('#list_dg').datagrid('getSelections');
	
	
	var url = UrlConfig.itemSave;
	var data = {changeMod:changeMod,itemData:JSON.stringify(itemData),
			futext:futext,
			itemDetailData:itemDetailData,
			itemPictureData:itemPictureData,
			itemId:rows[0].item_id};
	
	$.post(url, data, function(result) {
		if (result.successful) {
			$('#item_dialog').dialog('close');
			$('#list_dg').datagrid('reload');
			$.messager.show({
				title : '操作结果',msg : '保存成功！'
			});
		} else {
			$.messager.show({
				title : '操作结果',msg : '数据加载失败！'
			});
		}
	}, 'json');
}		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//=============================
		// 物流窗口的 输入物流信息并且保存 
		function saveOrderWuliu() {

			if ($('#wuliuGongsi').val() == '') {
				$.messager.show({
					title : '操作结果',
					msg : '公司输入为空'
				});
				return false;
			}
			if ($.trim($('#wuliuNo').val()).length == 0) {
				$.messager.show({
					title : '操作结果',
					msg : '物流单号输入为空'
				});
				return false;
			}

			var url = UrlConfig.wuliuSave;
			var rows = $('#list_dg').datagrid('getSelections');
			var list = new Array();

			for (var i = 0; i < rows.length; i++) {
				list.push({
					orderId : rows[i].order_id,
					itemId : rows[i].item_id,
					itemGuige : rows[i].item_guige,
					itemYanse : rows[i].item_yanse,
					tuihuoFlg : rows[i].tuihuo_flg
				})
			}
			if (list.length == 0) {
				$.messager.show({
					title : '错误提示',
					msg : '没有选择订单！',
					showType : 'fade',
					style : {
						right : '',
						bottom : ''
					}
				});
				return;
			}

			var orderItems = JSON.stringify(list);

			var data = {
				wuliuGongsi : $('#wuliuGongsi').val(),
				wuliuNo : $.trim($('#wuliuNo').val()),
				orderItems : orderItems
			};

			$.post(url, data, function(result) {
				if (result.successful) {
					$('#send_item_dialog').dialog('close');
					$('#list_dg').datagrid('reload', getSearchParm());
					$.messager.show({
						title : '操作结果',
						msg : '操作成功！'
					});
				} else {
					$.messager.show({
						title : '操作结果',
						msg : '保存失败！'
					});
				}
			}, 'json');
		}

		// 一览上的退货按钮
		function backItem() {
			// Check
			var ids = [];
			var rows = $('#list_dg').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.show({
					title : '错误提示',
					msg : '请选择数据！',
					showType : 'fade',
					style : {
						right : '',
						bottom : ''
					}
				});
				return;
			}
			if (rows.length > 1) {
				$.messager.show({
					title : '错误提示',
					msg : '只能选择单条数据一件一件退货！',
					showType : 'fade',
					style : {
						right : '',
						bottom : ''
					}
				});
				return;
			}
			var wkOrderId = rows[0].order_id;
			for (var i = 0; i < rows.length; i++) {
				// ids.push(rows[i].order_id);
				// 非退货数据需要再check
				if (rows[i].tuihuo_flg != '1') {
					// 已经付款，已经发货，已经收货，可走退货流程
					if (rows[i].sub_status != '2' && rows[i].sub_status != '3'
							&& rows[i].sub_status != '4') {
						$.messager.show({
							title : '错误提示',
							msg : '选择的订单状态不正确！',
							showType : 'fade',
							style : {
								right : '',
								bottom : ''
							}
						});
						return;
					}
				} else {
					//退货数据可以更新，直接跳过
				}

			}

			$('#back_item_dialog').dialog('open').dialog('setTitle', '退货');
			$('#back_item_form').form('clear');

			$('#oldbackItemPrice').val(rows[0].price);
			$('#oldcost').val(rows[0].cost);
			$('#oldlv00_lirun').val(rows[0].lv00_lirun);
			$('#oldlv01_lirun').val(rows[0].lv01_lirun);
			$('#oldlv02_lirun').val(rows[0].lv02_lirun);
			$('#backItemWuliuGongsi').combobox('select', rows[0].gongsi_id);
			$('#backItemWuliuNo').val(rows[0].wuliu_code);

		}
		// 退货窗口的保存按钮
		function saveBackItem() {
			var url = UrlConfig.backItemSave;
			var rows = $('#list_dg').datagrid('getSelections');
			var data = {
				orderId : rows[0].order_id,
				itemId : rows[0].item_id,
				itemGuige : rows[0].item_guige,
				itemYanse : rows[0].item_yanse,
				tuihuoFlg : rows[0].tuihuo_flg,

				price : $('#backItemPrice').val(),
				cost : $('#cost').val(),
				lv00Lirun : $('#lv00_lirun').val(),
				lv01Lirun : $('#lv01_lirun').val(),
				lv02Lirun : $('#lv02_lirun').val(),

				gongsiId : $('#backItemWuliuGongsi').val(),
				wuliuCode : $.trim($('#backItemWuliuNo').val())
			};
			$.post(url, data, function(result) {
				if (result.successful) {
					$('#back_item_dialog').dialog('close');
					$('#list_dg').datagrid('reload', getSearchParm());
					$.messager.show({
						title : '操作结果',
						msg : '操作成功！'
					});
				} else {
					$.messager.show({
						title : '操作结果',
						msg : '保存失败！'
					});
				}
			}, 'json');
		}
		//辅助方法
		function fuzhuAllBack() {
			$('#backItemPrice').val($('#oldbackItemPrice').val());
			$('#cost').val($('#oldcost').val());
			$('#lv00_lirun').val($('#oldlv00_lirun').val());
			$('#lv01_lirun').val($('#oldlv01_lirun').val());
			$('#lv02_lirun').val($('#oldlv02_lirun').val());

		}
		function fuzhuPingjun() {

		}
		function fuzhuZiyou() {

		}
	</script>

</body>
</html>