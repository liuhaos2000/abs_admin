<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>支付</title>
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
	    	<div style="text-align:center;size:30px;">
	    		<input type="button" style="width:200px;height:80px;" 
	    		value="微信支付" onclick="callpay()"></div>
	    		
	    		<input type="button" style="width:200px;height:80px;" 
	    		value="微信支付2" onclick="callpay2()"></div>
		</div>
					appId : ${result.appId}
 		 											timeStamp : ${result.timeStamp} 
 		 											nonceStr : ${result.nonceStr}
 		 											signType : MD5
 		 											package : ${result.prepay_id}
 		 											paySign : ${result.sign}
 		 											
 		 											<p></p>
 	appId: ${result.signInfo.appId}   
    timestamp:${result.signInfo.timestamp}  
    nonceStr: ${result.signInfo.nonceStr} 
    signature: ${result.signInfo.signature} 
	</div>


<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        delItemToCart:'<%=request.getContextPath() %>/app/mobile/cart/delItemFromCart',
    };
$(document).ready(function() {
    //      
    $(function(){
        $("#main_div").height($(window).height());
        $("#main_div").css({"overflow":"auto"});
    });
});
function callpay(){
		 WeixinJSBridge.invoke('getBrandWCPayRequest',{
 		 											"appId" : "${result.appId}",
 		 											"timeStamp" : "${result.timeStamp}", 
 		 											"nonceStr" : "${result.nonceStr}", 
 		 											"signType" : "MD5",
 		 											"package" : "${result.prepay_id}",
 		 											"paySign" : "${result.sign}" 
  			},function(res){
  				alert(res.err_msg);
				WeixinJSBridge.log(res.err_msg);
//				alert(res.err_code + res.err_desc + res.err_msg);
	            if(res.err_msg == "get_brand_wcpay_request:ok"){  
	                alert("微信支付成功!"); 
	                //跳转
	            }else if(res.err_msg == "get_brand_wcpay_request:cancel"){
	                //跳转
	                alert("用户取消支付!");  
	            }else{  
	               alert("支付失败!");  
	            }  
			})
}
function callpay2(){

}
/*
wx.config({
    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '${result.signInfo.appId}', // 必填，公众号的唯一标识
    timestamp:'${result.signInfo.timestamp}', // 必填，生成签名的时间戳
    nonceStr: '${result.signInfo.nonceStr}', // 必填，生成签名的随机串
    signature: '${result.signInfo.signature}',// 必填，签名，见附录1
    jsApiList: ['chooseWXPay'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
wx.ready(function(){
	wx.chooseWXPay({
	    timeStamp:'${result.timeStamp}', // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
	    nonceStr: '${result.nonceStr}', // 支付签名随机串，不长于 32 位
	    package: '${result.prepay_id}', // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
	    signType: 'MD5', // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
	    paySign: '${result.sign}', // 支付签名
	    success: function (res) {
	        alert(1);
	    },
	    fail:function (res) {
            alert(res);
        }
	});
});*/
</script>
</body>
</html>