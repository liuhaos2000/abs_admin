<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类型管理</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/main.css">
</head>
<body>

<table id="type_list_dg"></table>

<div id="type_list_dg_toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openNewWin()">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="openEditWin()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteType()">删除</a>
</div>

<div id="type_save_dialog">
	<div class="inner-wrapper">
	<div class="ftitle">请输入类型信息</div>
    <form id="type_info_form" method="post">
       
        <div class="fitem">
            <label>类型ID:</label>
            <input type="text" id="typeCode" name="typeCode" />
        </div>
        <div class="fitem">
            <label>类型名称:</label>
            <input type="text" id="typeName" name="typeName" />
        </div>
        <input type="hidden" name="verNum" value="" />
    </form>
    </div>
</div>

<script>
var UrlConfig = {
	SysTypeList: '<%=request.getContextPath() %>/app/sys/type/list',
	SysTypeAdd: '<%=request.getContextPath() %>/app/sys/type/add',
	SysTypeUpdate: '<%=request.getContextPath() %>/app/sys/type/update',
	SysTypeDelete: '<%=request.getContextPath() %>/app/sys/type/delete',
};

$(function(){
	$('#type_list_dg').datagrid({
		url: UrlConfig.SysTypeList,
		toolbar: '#type_list_dg_toolbar',
		singleSelect: true,
		rownumbers: true,
		pagination: true,
		pageSize: 20,
	    sortName:'typeCode',
	    sortOrder:'asc',
		fit: true,
		fitColumns: true,
		columns: [[
			{title:'类型ID', field:'typeCode',sortable:true},
			{title:'类型名称', field:'typeName',sortable:true, width:100},
			{title:'版本号', field:'verNum',hidden:true}
			
		]]
	});
	
	$('#type_save_dialog').dialog({
		title: '类型信息',
	    width: 500,
	    height: 300,
	    closed: true,
	    cache: false,
	    modal: true,
	    buttons: [{
	    	text: '保存',
	    	handler: function() {
	    		$('#type_info_form').form('submit',{
	    	        url: url,
	    	        onSubmit: function(){
	    	            var success = $(this).form('validate');
	    	            if (! success) {
	    	            	return false;
	    	            }
	    	            
	    	            /*if ($('#roleSelect').val() == '') {
	    	            	alert('请选择角色');
	    	            	return false;
	    	            }

	    	            if (! $('#groupSelect').attr('disabled')) {
		    	            if ($('#groupSelect').val() == '') {
		    	            	alert('请选择机构');
		    	            	return false;
		    	            }
	    	            }*/
	    	            
	    	            return true;
	    	        },
	    	        success: function(result){
	    	        	result = eval('(' + result + ')');
	    	            if (! result.successful) {
	    	            	$.messager.show({ title: '操作结果', msg: result.msg });
	    	            } else {
	    	            	$.messager.show({ title: '操作结果', msg: '操作成功' });
	    	                $('#type_list_dg').datagrid('reload');    // reload the user data
	    	            	$('#type_save_dialog').dialog('close');   // close the dialog
	    	                $('.validatebox-tip').remove();
	    	            	$('#type_info_form').form('clear');
	    	            }
	    	        }
	    	    });
	    	}
	    },{
	    	text: '取消',
	    	handler: function() {
	    		$('#type_save_dialog').dialog('close');
            	$('#type_info_form').form('clear');
	    	}
	    }]
	});
	
	$('#roleSelect').change(function() {
		var $this = $(this);
		if ($this.val() == 'root') {
			$('#groupSelect option:first').attr('selected','selected');
			$('#groupSelect').attr('disabled', true);
		} else {
			$('#groupSelect').attr('disabled', false);
		}
	});
});

var url = '';

function openNewWin() {
	$('#typeCode').attr("readonly", "readonly");
	$('#type_save_dialog').dialog('open');
	url = UrlConfig.SysTypeAdd;
}

function openEditWin() {
	
	$('#typeCode').attr("readonly", "readonly");

	$('#type_info_form').form('clear');
	
	var row = $('#type_list_dg').datagrid('getSelected');
	if (! row) {
		alert('请选择类型'); 
		return;
	}
	
	$('#type_info_form').form('load', row);	
	
	$('#type_save_dialog').dialog('open');
	
	url = UrlConfig.SysTypeUpdate;
}

function deleteType() {
	var row = $('#type_list_dg').datagrid('getSelected');
    if (row){
        $.messager.confirm('Confirm','请确认是否删除该类型?',function(r){
            if (r){
                $.post(UrlConfig.SysTypeDelete, {typeCode:row.typeCode}, function(result){
                    $.messager.show({ title: '操作结果', msg: '操作成功' });
                	$('#type_list_dg').datagrid('reload');
                },'json');
            }
        });
    } else {
    	alert('请选择类型');
    }
}

</script>
</body>
</html>