<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>瑞和商城</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/media.css">
</head>
<body>

	<header class="navbar top" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-2 col-xs-3 top_logo">
					<p class="navbar-text">
						<a href="<%=request.getContextPath() %>">
							<img class="img-responsive" src="<%=request.getContextPath() %>/resources/images/logo1.png" alt="瑞和商城"></a>
					</p>
				</div>
				<div class="col-md-10 col-sm-10 col-xs-9 top_search">
					<p class="navbar-text input-group">
						<input id="searchparm" name="searchparm" type="text" class="form-control" 
						        data-container="body" 
						        data-toggle="popover" 
						        data-placement="bottom" 
						        data-content="要点啥！">
						<span id="search-bt" class="input-group-addon">
							<img src="<%=request.getContextPath() %>/resources/images/search.png"></span>
					</p>
				</div>
			</div>
		</div>
		<!-- 探出窗口 -->
        <div class="popupshadow">

        </div>
        <div class="popup">
            <img src="<%=request.getContextPath() %>/resources/images/popup_icon.png">
            <ul>
                <li>
                    <a href="item_list.html">主力店铺</a>
                </li>
                <li>
                    <a href="item_list.html">女装</a>
                </li>
                <li>
                    <a href="item_list.html">男装</a>
                </li>
                <li>
                    <a href="item_list.html">鞋/包</a>
                </li>
                <li>
                    <a href="item_list.html">餐饮</a>
                </li>
                <li>
                    <a href="item_list.html">钟表/珠宝/饰品</a>
                </li>
            </ul>
        </div>

	</header>

	<div id="main_div">


	</div>

	<footer>
		<div class="container footer">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3 footer-block">
					<a href="#" class="active" id="home-bt">
                        <p class="footer_index">首页</p>
					</a>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 footer-block">
					<a href="#" id="type-bt">
                        <p class="footer_huodong">分类</p>
					</a>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 footer-block">
					<a href="#" id="cart-bt">
                        <p class="footer_pinpai">购物车</p>
					</a>
					<span class="cartcount">3</span>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3 footer-block">
					<a href="#" id="huiyuan-bt">
                        <p class="footer_huiyuan">会员</p>
					</a>
				</div>
			</div>
		</div>
	</footer>


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/common.js"></script>	
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        getCartCount: '<%=request.getContextPath() %>/app/mobile/cart/getCount',
    };
    
            $(document).ready(function() {
                 $("#home-bt").click(function(){
                	 loadshow('${path}');
                	 $('#main_div').load('<%=request.getContextPath() %>' +
                			'/app/mobile/page/home');
                	 $('.footer-block a').removeClass("active");
                	 $(this).addClass("active");
                 }); 
                 $("#type-bt").click(function(){
                	 loadshow('${path}');
                     $('#main_div').load('<%=request.getContextPath() %>' +
                             '/app/mobile/page/type'); 
                     $('.footer-block a').removeClass("active");
                     $(this).addClass("active");
                 }); 
                 $("#huiyuan-bt").click(function(){
                	 loadshow('${path}');
                     $('#main_div').load('<%=request.getContextPath() %>' +
                             '/app/mobile/page/huiyuan'); 
                     $('.footer-block a').removeClass("active");
                     $(this).addClass("active");
                 }); 
                 $("#cart-bt").click(function(){
                	 loadshow('${path}');
                	 window.location.href='<%=request.getContextPath() %>'+
                	         '/app/mobile/page/cart'; 
                 });

                 $("#search-bt").click(function(){
                	 if($("#searchparm").val()==''){
                		 //$('#searchparm').popover('show');
                		 return;
                	 }
                     window.location.href='<%=request.getContextPath() %>'+
                             '/app/mobile/page/itemlist?searchparm='+$("#searchparm").val(); 
                 }); 
                 
			    $(function(){
			    	$("#main_div").height($(window).height()-$("header").height()-52);
			    	$("#main_div").css({"overflow":"auto"});

			    	$('#main_div').load('<%=request.getContextPath() %>' + '/app/mobile/page/home');
			    });
			    

							
            });
            
            getCartCount();

            function getCartCount() {
            	   $.ajax({    
            	        url:UrlConfig.getCartCount,// 跳转到 action    
            	        data:{},    
            	        type:'post',    
            	        //cache:false,    
            	        dataType:'json',    
            	        success:function(result) {
            	            if(result.successful == true ){
            	            	if (result.data > 0) {
            	            		$('.cartcount').css("display","block");
            	            		$('.cartcount').html(result.data);
            	            	} else {
            	            		$('.cartcount').css("display","none");
            	            	}
            	                
            	            }else{
            	                
            	            }
            	         }

            	    }); 
            }
        </script>
</body>
</html>