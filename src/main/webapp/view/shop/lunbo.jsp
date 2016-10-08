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
<title>轮播管理</title>
</head>
<body>
<table id="list_dg" style="width:auto" >
	<thead>
	<tr>
		<th data-options="field:'lunboId'">轮播图片ID</th>
		<th data-options="field:'imgPath',width:300">轮播图片路径</th>
		<th data-options="field:'imgText',width:300">图片文本</th>
		<th data-options="field:'action',width:300">跳转链接</th>
	</tr>
	<thead>
</table>

<div id="list_dg_toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newData()">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editData()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delData()">删除</a>
</div>

<div id="data_save_dialog" class="easyui-dialog" style="width:600px;height:600px;padding:10px 20px"
        closed="true" buttons="#save_dialog_buttons" modal="true">
    <div class="ftitle">请输入信息</div>
    <form id="info_form" method="post">
        <div class="fitem">
            <label>图片文本:</label>
            <input type="text" name="imgText" />
        </div>
        <div class="fitem">
            <label>跳转链接:</label>
            <input type="text" name="action" size="60"/>
        </div>
        <div class="fitem">
            <label>图片URL:</label>
            <input type="text" id="imgPath" name="imgPath" size="60"/>
        </div>
        <div class="fitem">
            <label>上传图片:</label>
            <input  id="uFile" type="file" name="uFile"/>
            <input type="button" value="确定" onclick="uploadPic()" >    (640*320)
        </div>
        <div class="fitem">
            <label>图片预览:</label>
			<div id="tupian"></div>
        </div>
        <input type="hidden" name="lunboId" />
    </form>
</div>
<div id="save_dialog_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveData()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#data_save_dialog').dialog('close')">取消</a>
</div>


<script type="text/javascript">

var UrlConfig = {
	List: '<%=request.getContextPath() %>/app/admin/lunbo/list',
	Add: '<%=request.getContextPath() %>/app/admin/lunbo/add',
	Update: '<%=request.getContextPath() %>/app/admin/lunbo/update',
	Delete: '<%=request.getContextPath() %>/app/admin/lunbo/del',
	Upload: '<%=request.getContextPath() %>/app/admin/lunbo/upload',
};

$(function(){
	$('#list_dg').datagrid({
		url: UrlConfig.List,
		toolbar: '#list_dg_toolbar',
		singleSelect: true,
		rownumbers: true,
		fit: true,
		fitColumns: true
	});
});

var url;
function newData(){
    $('#data_save_dialog').dialog('open').dialog('setTitle','添加');
    $('#info_form').form('clear');
    url = UrlConfig.Add;
}

function editData(){
    var row = $('#list_dg').datagrid('getSelected');

    if (row){
        $('#data_save_dialog').dialog('open').dialog('setTitle','编辑角色');
        $('#info_form').form('load',row);
        
    	var attstr= '<img src="'+row.imgPath+'" class="lunbo_img">'; 
    	$("#tupian").html(attstr);
        
        url = UrlConfig.Update;
    } else {
    	alert("请选择角色");
    }
}
function saveData(){
    $('#info_form').form('submit',{
        url: url,
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
        	result = eval('(' + result + ')');
            if (result.successful) {
            	$('#data_save_dialog').dialog('close');        // close the dialog
                $('#list_dg').datagrid('reload');    // reload the user data
                $.messager.show({ title: '操作结果', msg: '操作成功' });
            } else {
            	$.messager.show({ title: '操作结果', msg: result.msg });
            }
        }
    });
}

function delData(){
    var row = $('#list_dg').datagrid('getSelected');
    if (row){
        $.messager.confirm('Confirm','请确认是否删除该数据?',function(r){
            if (r){
                $.post(UrlConfig.Delete, {lunboId:row.lunboId}, function(result){
                    $.messager.show({ title: '操作结果', msg: '操作成功' });
                	$('#list_dg').datagrid('reload');
                },'json');
            }
        });
    } else {
    	alert('请选择数据');
    }
}

function uploadPic() {
    if($("#uFile").val()==""){  
        $.messager.alert("提示","请选择文件夹");  
        return false;  
    };
    $.ajaxFileUpload({    
        url:UrlConfig.Upload,
        fileElementId:'uFile', 
        dataType: 'json',//返回数据的类型  
        data:{name:'logan'},//一同上传的数据  
        success: function (result, status){
        	var attstr= '<img src="'+result.data.imgPath+'" class="lunbo_img">'; 
        	$("#tupian").html(attstr);
        	$("#imgPath").val(result.data.imgPath);
        	
        },
        error: function (result, status)
        {
           alert(456);
         }

    }); 
}



</script>

</body>
</html>