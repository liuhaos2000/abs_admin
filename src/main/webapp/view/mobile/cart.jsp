<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>购物车</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/media.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/skins/square/red.css" >
</head>
<body>

	<div id="main_div">
	    <div class="container ">
            <c:forEach items="${result.itemList}" var="item"  varStatus="status">
                <div class="row cart-item-row" recordkey="cartitem${status.index}">
                    <div class="col-md-2 col-sm-2 col-xs-2 cart-col-box cart-col-checkbox">
                       <div class="cart-col-checkbox2">
                            <input type="checkbox" 
                                   price="${item.sale_price}"
                                   recordkey="cartitem${status.index}">
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-4 cart-col-box">
                    	<a href="${path}/app/mobile/page/item?itemId=${item.item_id}">
                        	<img class="cart-img" src="${item.path}" alt="">
                        </a>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6 cart-col-box cart-col-info">
                        <p class="cart_item_name p-no-bottom">${item.item_name} ${item.guige_text} ${item.yanse_text}</p>
                        <p class="cart_item_price p-no-bottom">￥${item.sale_price}</p>
                            <div class="btn-group" role="group" >
                                <button type="button" name="jian_bt" class="btn btn-default btn-xs">-</button>
                                <button type="button" recordkey="cartitem${status.index}" class="btn btn-default btn-xs">${item.shuliang}</button>
                                <button type="button" name="add_bt" class="btn btn-default btn-xs">+</button>
                            </div>
                            <span class="btn-clipboard" 
                                   itemid="${item.item_id}" 
                                   guige="${item.item_guige}" 
                                   yanse="${item.item_yanse}"
                                   recordkey="cartitem${status.index}">x</span>
                    </div>
                </div>
            </c:forEach>
            <form id="cartForm" action="/abs_web/app/mobile/page/order" method="post">
                <input type="hidden" id="cartItem" name="cartItem" >
            </form>
		</div>
	</div>

	<footer class="tool_foot">
		<div class="container footer itme_detail_top">
			<div class="row footer-row">
				<div class="col-md-6 col-sm-6 col-xs-6 footer-col">
					<p class="foot-text">总价：<span id="total">210</span>元</p>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 footer-col">
					<button id="jiesuan_bt" class="btn btn-success a-btn" type="button">结算</button>
				</div>
			</div>
		</div>
	</footer>
   
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        delItemToCart:'<%=request.getContextPath() %>/app/mobile/cart/delItemFromCart',
    };
$(document).ready(function() {
    //
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-red',
        radioClass: 'iradio_square-red',
        increaseArea: '20%' // optional
    });         
    //      
    $(function(){
        $("#main_div").height($(window).height()-52);
        $("#main_div").css({"overflow":"auto"});
        // 自动全选
        autoCheck();
        countTotal();
    });
    // 结算
    $("#jiesuan_bt").click(function(){
    	var parm = getSubmitItem();
    	if(parm==0){
    		alert("购物车是空的!");
    	}
    	$("#cartItem").val(parm);
    	$("#cartForm").submit();
    	
    });
    // check change
    $(':checkbox').on('ifChanged', function(event){
    	countTotal();
    });
    
    // 数量加
    //        var s = $("#shuliang").text();
    //  s = s*1+1;
    //  $("#shuliang").html(s);
    $('button[name="add_bt"]').click(function(){
    	var s = $(this).prev().text();
    	s = s*1+1;
    	$(this).prev().html(s);
    	countTotal();
    }); 
    // 数量减
    $('button[name="jian_bt"]').click(function(){
        var s = $(this).next().text();
        s = s*1-1;
        if(s<=0){
        	$(this).next().html(1);
            return;
        }
        $(this).next().html(s);
        countTotal();
    }); 
    
    //btn-clipboard
    $(".btn-clipboard").click(function(){
    	var itemId = $(this).attr("itemid");
    	var guige = $(this).attr("guige");
    	var yanse = $(this).attr("yanse");
    	delectItem(itemId,guige,yanse);
    	countTotal();
    }); 
});

function autoCheck() {
	$(":checkbox").each(function(){
		   $(this).iCheck('check');
	});  
}
function countTotal() {
	var total=0;
    $(":checkbox").each(function(){
        if($(this).prop("checked")==true){
        	var key = $(this).attr("recordkey");
        	total = total+$(this).attr("price") * $("button[recordkey = "+ key +"]").text();
        }else{
        }
     }); 
    $("#total").html(total.toFixed(2));
}
function delectItem(itemId,guige,yanse){
    $.ajax({    
        url:UrlConfig.delItemToCart,// 跳转到 action    
        data:{itemId:itemId,guige:guige,yanse:yanse},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
                window.location.href='<%=request.getContextPath() %>'+
                '/app/mobile/page/cart'; 
            }else{
            }
         }
    }); 
}
function getSubmitItem(){
	var list = new Array();
	$(":checkbox").each(function(){
	    var key = $(this).attr("recordkey");
		var itemId = $(".btn-clipboard[recordkey = "+ key +"]").attr("itemid");
		var itemGuige=$(".btn-clipboard[recordkey = "+ key +"]").attr("guige");
		var itemYanse=$(".btn-clipboard[recordkey = "+ key +"]").attr("yanse");
		//数量
		var shuliang = $("button[recordkey = "+ key +"]").text();
        //FLG
        var delFlg;
		if($(this).prop("checked")==true){
			delFlg='1';
		}else{
			delFlg='0';
		}
		
		list.push({itemId: itemId,
              itemGuige: itemGuige,
              itemYanse: itemYanse,
              shuliang: shuliang,
              delFlg: delFlg}); 
    }); 
	//alert(JSON.stringify(list));
	if(list.length==0){
		return 0;
	}
	return JSON.stringify(list);
}
        </script>
</body>
</html>
