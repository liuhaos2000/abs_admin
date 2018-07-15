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
<title>店铺用户管理</title>
</head>
<body>
	<div id="tiaojian-div" class="easyui-panel" title="查询条件">
		<div style="padding: 5px 5px 5px 5px">
			<form id="ff" method="post">
				<table>
					<tr>
						<td>&nbsp;&nbsp;用户等级:</td>
						<td><select class="easyui-combobox" id="searchLever"
							style="width: 100px;">
								<option value="">-- 请选择 --</option>
								<c:forEach items="${leverMap}" var="item">
									<option value="${item.key}">${item.value}</option>
								</c:forEach>
						</select></td>
						<td>&nbsp;&nbsp;用户微信昵称:</td>
						<td><input class="easyui-textbox" type="text"
							id="searchNickname" style="width: 120px" maxlength="14"></input></td>
							
						<td>&nbsp;&nbsp;父用户微信昵称:</td>
						<td><input class="easyui-textbox" type="text"
							id="searchParentNickname" style="width: 120px" maxlength="14"></input></td>
							
						<td>&nbsp;&nbsp;<a href="javascript:void(0)"
							class="easyui-linkbutton" onclick="doSearch()">检索</a></td>
						
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="jieguo-div" class="easyui-panel" title="用户列表">
		<table id="list_dg" style="width: auto">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true">用户</th>
					<th data-options="field:'open_id'" >微信ID</th>
					<th data-options="field:'nickname'">微信昵称</th>
					<th data-options="field:'weixin_sex'" formatter="format1">微信性别</th>
					<th data-options="field:'city'"  hidden="true">微信城市</th>
					<th data-options="field:'province'"  hidden="true">微信省会</th>
					<th data-options="field:'country'"  hidden="true">微信国家</th>
					<th data-options="field:'weixin_image_url'" formatter="format2">微信头像</th>
					<th data-options="field:'jifen'">积分</th>
					<th data-options="field:'lever'" formatter="format3">等级</th>
					<th data-options="field:'parent'" hidden="true"> 父级</th>
					<th data-options="field:'parent_nickname'"> 父级微信昵称</th>
					
				</tr>
			<thead>
		</table>
	</div>
	<div id="list_dg_toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="updShopuser()">修改用户</a>
	</div>

	<!-- 窗口START -->
<div id="save_dialog" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
        closed="true" buttons="#save_dialog_buttons" modal="true">
    <div class="ftitle">请输入更新信息</div>
    <form id="info_form" method="post">
        <div class="fitem">
            <label>微信昵称:</label>
             <label id="nickname" name="nickname"></label>
        </div>
        <div class="fitem">
            <label>变更等级:</label>
				<select class="easyui-combobox" id="lever" name="lever"
							style="width: 100px;">
					<option value="">-- 请选择 --</option>
						<c:forEach items="${leverMap}" var="item">
					<option value="${item.key}">${item.value}</option>
				</c:forEach>
			</select>
        </div>
        <div class="fitem">
            <label>上级:</label>
				 <select class="easyui-combobox" id="parent" name="parent"
					style="width: 100px;">
					<option value="">-- 请选择 --</option>
					<c:forEach items="${vipUserList}" var="user">
						<option value="${user.open_id}">${user.nickname}</option>
					</c:forEach>
				</select> 
        </div>
    </form>
</div>
<div id="save_dialog_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#save_dialog').dialog('close')">取消</a>
</div>
	<!-- 窗口END -->

	<script type="text/javascript">
var UrlConfig = {
		userList: '<%=request.getContextPath()%>/app/admin/shopuser/list',
	    Save: '<%=request.getContextPath()%>/app/admin/shopuser/save'
		};
		
		$(function() {

			$('#jieguo-div').height(
					$('#tiaojian-div').parent().height()
							- $('#tiaojian-div').height() - 40);

			$('#list_dg').datagrid({
				url : UrlConfig.userList,
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
			var searchParentNickname = $('#searchParentNickname').val();
			var searchNickname = $('#searchNickname').val();
			var searchLever = $('#searchLever')
					.combobox('getValue');
			var parm = {
					searchParentNickname : searchParentNickname,
					searchNickname : searchNickname,
					searchLever : searchLever
			};
			return parm;
		}
		function format1(value, rowData, rowIndex) {
			if (value == '0') {
				return '女';
			} else if (value == '1') {
				return '男';
			}
		}
		function format2(value, rowData, rowIndex) {
  	    	if('' != value && null != value)
  	    		return '<img style="width:30px; height:30px" src="' + value + '">';
		}
		function format3(value, rowData, rowIndex) {
			if (value == '00') {
				return '顶级';
			} else if (value == '01') {
				return '一级';
			} else if (value == '12') {
				return '二级';
			} else if (value == '98') {
				return '申请中';
			} else if (value == '99') {
				return '一般用户';
			} else return 'error';
		}
/////////
		function updShopuser() {
			// Check
			var ids = [];
			var rows = $('#list_dg').datagrid('getSelections');
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
			$('#save_dialog').dialog('open').dialog('setTitle', '修改用户');
			$('#info_form').form('clear');
			
			$('#nickname').text(rows[0].nickname);
			$('#lever').combobox('select', rows[0].lever);
			$('#parent').combobox('select', rows[0].parent);
		}

function save(){
	var rows = $('#list_dg').datagrid('getSelections');
	
	var url = UrlConfig.Save;
	var data = {
			openId:rows[0].open_id,
			lever:$('#lever').combobox('getValue'),
			parent:$('#parent').combobox('getValue'),
			};
	
	$.post(url, data, function(result) {
		if (result.successful) {
			$('#save_dialog').dialog('close');
			$('#list_dg').datagrid('reload',getSearchParm());
			$.messager.show({
				title : '操作结果',msg : '保存成功！'
			});
		} else {
			$.messager.show({
				title : '操作结果',msg : result.msg
			});
		}
	}, 'json');
}
		
</script>

</body>
</html>