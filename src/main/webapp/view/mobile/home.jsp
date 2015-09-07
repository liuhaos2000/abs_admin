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
    <div class="icon-center">
        <img class="icon-spin"
            src="<%=request.getContextPath()%>/resources/images/loading.png">
    </div>
	<div class="container pic_show">
		<div id="owl-demo1" class="owl-carousel owl-theme"></div>
	</div>
	<div class="container today_miaosha">
        <div class="panel panel-default my-panel">
            <div class="panel-heading">特价商品</div>
            <div class="panel-body">
                <div class="container">
                <!--  -->
                	<c:forEach items="${data['HDFLG_5']}" var="item" varStatus="status">
                    		<c:if test="${status.index % 2 eq 0}">
                    			<div class="row">
                    				<c:forEach items="${data['HDFLG_5']}" var="item_2" varStatus="status_2"
                    							begin="${status.index}" end="${status.index + 1}">
                         			 <div class="col-md-6 col-sm-6 col-xs-6 daojishi_body" itemid="${item_2.item_id}">
                           				 <a href="#">
                                		 <img src="${item_2.path}">
                               			  <p class="daojishi_name">${item_2.item_name}</p>
                               			  <p class="daojishi_price">特价: ￥${item_2.price_huiyuan}</p>
                            			</a>
                         			 </div>
                         			</c:forEach>	
								</div>
							</c:if>
                    </c:forEach>	
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/owl.carousel.min.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/common.js"></script>  
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        getLunboList: '<%=request.getContextPath() %>/app/mobile/home/getLunBolist',
        getTejiaItem: '<%=request.getContextPath() %>/app/mobile/home/getTejiaItem',
    };

$(document).ready(function() {
	getLunboList();
	
    $("div[itemId]").bind("click",function(){
        window.location.href='<%=request.getContextPath() %>'+
        '/app/mobile/page/item?itemId='+$(this).attr("itemId"); 
    });
});

function getLunboList() {
    $.ajax({    
        url:UrlConfig.getLunboList,// 跳转到 action    
        data:{},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
                for (var i = 0; i < result.data.length; i++) {
                    var lunbo = result.data[i];
                    var link;
                    if(lunbo.action=='#'||lunbo.action==''||lunbo.action==null){
                        link='#';
                    }else{
                        link=UrlConfig.path+lunbo.action
                    }
                    $("#owl-demo1").append('<div class="item"><a href="'+link+'"><img src="'+lunbo.imgPath +'" class="img-responsive img-lunbo"></a></div>');
                }
                $("#owl-demo1").owlCarousel({
                    items: 1,
                    loop: true,
                    margin: 10,
                    smartSpeed: 450,
                    autoplay: true,
                    autoplayTimeout: 4000,
                });
            }else{
                
            }
         }
    }); 
}
</script>
</body>
</html>