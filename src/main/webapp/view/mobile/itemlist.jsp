<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>商品列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/style.css">
	<link rel="stylesheet" href="${path}/resources/css/media.css">
</head>
<body>

    <header class="navbar top" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-md-2 col-sm-2 col-xs-3 top_logo">
                    <p class="navbar-text">
                        <a href="<%=request.getContextPath() %>">
                            <img class="img-responsive" src="${path}/resources/images/logo1.png" alt="瑞和商城"></a>
                    </p>
                </div>
                <div class="col-md-10 col-sm-10 col-xs-9 top_search">
                    <p class="navbar-text input-group">
                        <input type="text" class="form-control" id="searchParm">
                        <span class="input-group-addon" id="search_bt">
                            <img src="${path}/resources/images/search.png"></span>
                    </p>
                </div>
            </div>
        </div>
    </header>
	
	<div id="main_div"> 
        <table class=" tb_item" id="item_tb">
            <c:forEach items="${itemList}" var="item">
                <tr class=" tr_item" itemId="${item.item_id}">
                    <td class="td_item_img" valign="middle">
                        <img class="itemlist_img" src="${item.path}">
                    </td>
                    <td class="td_item_info" valign="top">
                        <div>
                                    <p class="item_list_name p-no-bottom">${item.item_name}</p>
                                    <p class="item_list_price p-no-bottom">￥${item.price}</p>
                                    <p class="item_list_hpd p-no-bottom">销量：${item.haopingdu}</p>
                                    <p class="item_list_hpd p-no-bottom">好评度：${item.haopingdu} (${item.pingjia_zongshu}人)</p>
                         </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="container">
            <div class="row page-bt">
                <div class="col-md-12 col-sm-12 col-xs-12 col-no-pad">
                    <button id="fanye_bt" class="btn btn-block btn-default btn-sm" type="button">点击加载更多</button>
                </div>
            </div>
        </div>
        
        <div class="icon-center">
            <img class="icon-spin"
                 src="<%=request.getContextPath()%>/resources/images/loading.png">
        </div>
    </div>
    
    
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
var pageParm = {
	    page:'${page}',
	    rows:'${rows}',
	    orderby:'${orderby}',
	    searchparm:'${searchparm}',
	    typeId:'${typeId}',
	    pagetotal:'${pagetotal}'
};
var page;
var rows;
var orderby;
$(document).ready(function() {
	
    //设置高度
    $(function(){
        $("#main_div").height($(window).height()-$("header").height()-2);
        $("#main_div").css({"overflow":"auto"});
        changeBt();
        brbind();
    });
    // 翻页
    // $(".icon-center").show();
    // $(".icon-center").hide();
    $("#fanye_bt").click(function(){

    	pageParm.page=Number(pageParm.page)+1;
    	var url="${path}/app/mobile/itemlist/getItemList";
        $.ajax({    
            url:url,// 跳转到 action    
            data:pageParm,    
            type:'post',    
            dataType:'json',    
            beforeSend:function(XMLHttpRequest){
            	$(".icon-center").show();
            },
            success:function(result) {
                if(result.successful == true ){
                	
                	for (var i = 0; i < result.data.length; i++) {
                		//$("#item_tb").append();
                		  $("#item_tb tbody").append('<tr class=" tr_item" itemId="'+result.data[i].item_id+'">                                                             '
                                  +'    <td class="td_item_img" valign="middle">                                                                                            '
                                  +'        <img class="itemlist_img" src="'+result.data[i].path+'">                                                                        '
                                  +'    </td>                                                                                                                               '
                                  +'    <td class="td_item_info" valign="top">                                                                                              '
                                  +'        <div>                                                                                                                           '
                                  +'                    <p class="item_list_name p-no-bottom">'+result.data[i].item_name+'</p>                                              '
                                  +'                    <p class="item_list_price p-no-bottom">￥'+result.data[i].price+'</p>                                               '
                                  +'                    <p class="item_list_hpd p-no-bottom">销量：'+result.data[i].haopingdu+'</p>                                         '
                                  +'                    <p class="item_list_hpd p-no-bottom">好评度：'+result.data[i].haopingdu+' ('+result.data[i].pingjia_zongshu+'人)</p>'
                                  +'        </div>                                                                                                              '
                                  +'    </td>                                                                                                                               '
                                  +'</tr>');                                                                                                                                
                	}
                	
                	brbind();
                	changeBt();
                	$(".icon-center").hide();
                }else{
                	pageParm.page=Number(pageParm.page)-1;
                }
             },
             complete:function(XMLHttpRequest,textStatus){
            	 $(".icon-center").hide();
              },
              error:function(XMLHttpRequest,textStatus,errorThrown){
                 $(".icon-center").hide();
             }
        });
    }); 
    // 搜索按钮
    $("#search_bt").click(function(){
        if($.trim($("#searchParm").val())==''){
            //$('#searchparm').popover('show');
            return;
        }
        window.location.href='<%=request.getContextPath() %>'+
                '/app/mobile/page/itemlist?searchparm='+$("#searchParm").val(); 
    }); 
});
function changeBt(){
	//是否有下一页
	    //alert(pageParm.page);
        //alert(pageParm.pagetotal);
	if(pageParm.page>=pageParm.pagetotal){

		//disabled="disabled"
		//$('#button').attr('disabled',"true");添加disabled属性 
		//$('#button').removeAttr("disabled"); 移除disabled属性 
		$('#fanye_bt').attr('disabled',"true");
		$('#fanye_bt').html("没有更多了");
	} else {
		
		$('#fanye_bt').removeAttr("disabled");
		$('#fanye_bt').html("点击加载更多");
	}
}

function brbind(){
    //是否有下一页
    $("tr").bind("click",function(){
        window.location.href='<%=request.getContextPath() %>'+
        '/app/mobile/page/item?itemId='+$(this).attr("itemId"); 
    });
}
</script>
</body>
</html>