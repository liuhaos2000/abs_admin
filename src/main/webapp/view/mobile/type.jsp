<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>分类</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/media.css">
</head>
<body>
    <!-- 
        <div class="container typelist_main">
            <div class="panel p2">
                <div class="panel-heading">
                    <a href="subtype.html">
                        <p>服装</p>
                    </a>
                </div>
            </div>
            <div class="panel p2">
                <div class="panel-heading">
                    <a href="subtype.html">
                        <p>家用电器</p>
                    </a>
                </div>
            </div>
            <div class="panel p2">
                <div class="panel-heading">
                    <a href="subtype.html">
                        <p>母婴用品</p>
                    </a>
                </div>
            </div>
            <div class="panel p2">
                <div class="panel-heading">
                    <a href="subtype.html">
                        <p>电子产品</p>
                    </a>
                </div>
            </div>
        </div>
         -->
<div class="tabbable tabs-left">

  <!-- Nav tabs -->
  <ul id="type_ul" class="nav nav-tabs" role="tablist">
    <c:forEach items="${typeList}" var="type">
        <li role="presentation" typeid="${type.typeId}">
             <a href="#" role="tab" data-toggle="tab" >${type.name}</a>
         </li>
    </c:forEach>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="fuzhuang">
        <table class="table" id="subtype_tb">
        </table>
    </div>
  </div>

</div>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/common.js"></script>  
<script type="text/javascript">
$(document).ready(function() {
	init();
    $("li").click(function(e) {
        var typeId = $(this).attr("typeid");
        getSubtype(typeId);
    });

    
});
function init(){
	$("#type_ul li:first").addClass("active");
	getSubtype($("#type_ul li:first").attr("typeid"));
}
function getSubtype(id){
        var url = "${path}/app/mobile/type/getSubTypeList"
        $("#subtype_tb").html("");
        $.ajax({    
            url:url,// 跳转到 action    
            data:{typeId:id},    
            type:'post',    
            //cache:false,    
            dataType:'json',    
            success:function(result) {
                if(result.successful == true ){
                    for (var i = 0; i < result.data.length; i++) {
                    	var yushu = i%2;
                    	if(yushu==0){
                    		if(i==(result.data.length-1)){
                    			$("#subtype_tb").append('<tr class="type-tr"><td typeid="'+result.data[i].typeId+'" colspan="2" class="type-td"><a href="#">'+result.data[i].name+'</a></td></tr>');
                    		}else{
                    			$("#subtype_tb").append('<tr class="type-tr"><td typeid="'+result.data[i].typeId+'"class="type-td"><a href="#">'+result.data[i].name+'</a></td><td typeid="'+result.data[i+1].typeId+'" class="type-td"><a href="#">'+result.data[i+1].name+result.data[i+1].typeId+' </a></td></tr>');
                    		}
                   			i=i+1;
                    	}
                    }
                    //绑定事件
                    $("td").bind("click",function(){
                    	window.location.href='<%=request.getContextPath() %>'+
                        '/app/mobile/page/itemlist?typeId='+$(this).attr("typeid"); 
                    });
                }else{
                }
             }
        });
}
</script>
</body>
</html>