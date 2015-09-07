<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>订单确认</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/media.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/skins/square/red.css" >
</head>
<body>
    <!-- Modal Start-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <p class="modal-title" id="myModalLabel">收货地址</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputPassword3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">姓名：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input id="mailName" type="text" class="form-control" id="inputPassword3" placeholder="请填写姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">电话：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input id="mailTel" type="text" class="form-control" id="inputPassword3" placeholder="收件人电话">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">省份：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <select id="ad1" class="form-control">
                                        <option value="">请选择</option>
                                        <c:forEach items="${result.regionList}" var="item" >
                                        	<option value="${item.regionId}">${item.regionName}</option>
                                        </c:forEach>
                                  </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">城市：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                    <select id="ad2" class="form-control">
                                        <option  value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">区域：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                    <select id="ad3" class="form-control">
                                        <option  value="">请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left">详细：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input id="ad4" type="text" class="form-control" id="inputEmail3" placeholder="详细地址">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label modal-left"></label>
                                <div class="col-md-8 col-sm-8 col-xs-8 modal-right">
                                  <input id="morenFlg" type="checkbox"> 默认收货地址
                                </div>
                            </div>
                         </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                      <button id="delete_ad_bt" type="button" class="btn btn-primary delete-ad-bt">删除</button>
                      <button id="save_bt" type="button" class="btn btn-primary">保存</button>
                    </div>
                </div>
            </div>
        </div>
    <!-- Modal End -->
   
   

    <div id="main_div" class="maindiv">
        <div class="container-fluid order-container">
            <div class="row-fluid">
                <div class="span12">
                    <div class="accordion" id="accordion-483788">
                        <div class="accordion-group ">
                            <div class="accordion-inner o-ad">
                                    <div class="row">
                                     <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-483788" href="#accordion-element-588573">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col">
                                            <span class="glyphicon glyphicon-chevron-down order-icon" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                        	<!-- 如果有地址 开始 -->
                                        	<c:choose>
   												<c:when test="${result.uadList.size()> 0}">
                                                    <div class="container" name="head-address">
                                                        <div class="row">
                                                        	<input type="hidden" id="head-adid" value="${result.uadList[0].address_id}">
                                                            <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                                <p class="p-no-bottom order-ad-left">收件人:</p> 
                                                            </div>
                                                            <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                                <p class="p-no-bottom order-ad-right" id="head-name">${result.uadList[0].name}</p> 
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                                <p class="p-no-bottom order-ad-left ">地址:</p> 
                                                            </div>
                                                            <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                                <p class="p-no-bottom order-ad-right" id="head-ad">
                                                                  ${result.uadList[0].adname1}${result.uadList[0].adname2}${result.uadList[0].adname3}${result.uadList[0].address_detail}
                                                                </p> 
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                                <p class="p-no-bottom order-ad-left" >电话:</p> 
                                                            </div>
                                                            <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                                <p class="p-no-bottom order-ad-right" id="head-tel">
                                                                	${result.uadList[0].tel}
                                                                </p> 
                                                            </div>
                                                        </div>
                                                    </div>
   												</c:when>
   												<c:otherwise> 
   													<div class="container" name="head-address">
                                                		<div class="row">
                                                			<div class="col-md-12 col-sm-12 col-xs-12 new-ad">
                                                       			 <button id="adnew_bt2" 
                                                       			 		 class="btn btn-default btn-block btn-lg address-new" 
                                                       			 		 type="button" data-toggle="modal" 
                                                       			 		 data-target="#myModal">
                                                       			 		 <span class="glyphicon glyphicon-plus" aria-hidden="true">
                                                       			 		 </span>新增地址</button>
                                                    		</div>
                                                		</div>
                                                	</div>
   												</c:otherwise>
   											</c:choose>

                                            <!-- 如果有地址 结束 -->
                                        </div>
                                      </a>
                                    </div>
                            </div>
                            <div id="accordion-element-588573" class="accordion-body collapse">
                                <div class="accordion-inner" name="body-address">
                                    <!-- dizhi start -->
                                    <c:forEach items="${result.uadList}" var="item" varStatus="status">
                                        <div class="row od-ad-row">
                                            <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col">
                                                <button class="btn btn-mini btn-default" 
                                                        type="button"
                                                        name="upd_adress"
                                                        addressid="${item.address_id}"
                                                        adname="${item.name}"
                                                        ad1="${item.adname1}"
                                                        ad2="${item.adname2}"
                                                        ad3="${item.adname3}"
                                                        ad4="${item.address_detail}"
                                                        tel="${item.tel}">改</button>
                                            </div>
                                            <div class="col-md-10 col-sm-10 col-xs-10 order-container" 
                                                     name="addiv"
                                                     adid="${item.address_id}"
                                                     adname="${item.name}"
                                                     ad1="${item.adname1}"
                                                     ad2="${item.adname2}"
                                                     ad3="${item.adname3}"
                                                     ad4="${item.address_detail}"
                                                     tel="${item.tel}">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                            <p class="p-no-bottom order-ad-left">收件人:</p> 
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                            <p class="p-no-bottom order-ad-right">${item.name}</p> 
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                            <p class="p-no-bottom order-ad-left ">地址:</p> 
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                            <p class="p-no-bottom order-ad-right">
                                                            ${item.adname1}${item.adname2}${item.adname3}${item.address_detail}</p> 
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">
                                                            <p class="p-no-bottom order-ad-left">电话:</p> 
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">
                                                            <p class="p-no-bottom order-ad-right">${item.tel}</p> 
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- dizhi end -->
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12 address-new-bt">
                                            <button id="adnew_bt1" class="btn btn-default btn-block address-new" type="button" data-toggle="modal" data-target="#myModal">新增地址</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-inner">
                                    <div class="row">
                                        <a class="accordion-toggle collapsed" 
                                                data-toggle="collapse" 
                                                data-parent="#accordion-483788" 
                                                href="#accordion-element-906172"
                                                aria-expanded="true">
                                            <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col-2">
                                                <span class="glyphicon glyphicon-chevron-down order-icon" aria-hidden="true"></span>
                                            </div> 
                                            <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                                    <p class="p-no-bottom order-ad-left">购物清单</p>
                                                 </div>
                                        </a>
                                    </div>
                            </div>
                            <div id="accordion-element-906172" class="accordion-body collapse in">
                                <div class="accordion-inner">
                                	<c:forEach items="${result.itemlist}" var="item"  varStatus="status">
										<div class="row order-item-row" 
										      name="itemqingdan"
										      itemId="${item.item_id}"
										      itemGuige="${item.item_guige}" 
										      itemYanse="${item.item_yanse}" 
										      shuliang="${item.shuliang}" >
                                        	<div class="col-md-3 col-sm-3 col-xs-3 cart-item-col">
                                          	  <img class="order-item-img" src="${item.path}" alt="">
                                       		</div>
                                        	<div class="col-md-9 col-sm-9 col-xs-9 cart-item-col">
                                         	  <p class="order-ad-right p-no-bottom">${item.item_name} ${item.guige_text} ${item.yanse_text}</p>
                                          	  <p class="cart_item_price p-no-bottom f-left">￥${item.sale_price}</p>
                                          	  <p class="order-ad-right p-no-bottom f-left">&nbsp;x${item.shuliang}</p>
                                          	  <c:set var="heji" value="${heji+(item.sale_price*item.shuliang)}"></c:set>
                                       		 </div>
                                   	    </div>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-inner">
                                    <div class="row">
                                      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-483788" href="#accordion-element-906173">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col-2">
                                            <span class="glyphicon glyphicon-chevron-down order-icon" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                            <div class="order-p">
                                                    <p class="p-no-bottom order-ad-left">送货方式：圆通快递(10.00元)</p>
                                            </div>
                                        </div>
                                      </a>  
                                    </div>
                            </div>
                            <div id="accordion-element-906173" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    功能块...
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-inner">
                                    <div class="row">
                                      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-483788" href="#accordion-element-906174">
                                        <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col-2">
                                            <span class="glyphicon glyphicon-chevron-down order-icon" aria-hidden="true"></span>
                                        </div>
                                        <div class="col-md-10 col-sm-10 col-xs-10 order-container">
                                            <div class="order-p">
                                                    <p class="p-no-bottom order-ad-left">可用积分：<span id="canuseJifen">${result.jifen}</span></p>
                                            </div>
                                        </div>
                                      </a>
                                    </div>
                            </div>
                            <div id="accordion-element-906174" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-5">
                                            <input id="jifenFlg" type="checkbox"> 使用积分
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <input id="jifen" type="text" size="5" maxlength="5">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <div class="row order-totle-row">
                                    <div class="col-md-1 col-sm-1 col-xs-1"></div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <p class="p-no-bottom order-ad-left">商品总价：</p>
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2"><span id="itemTotal">100.00</span></div>
                                </div>
                                <div class="row  order-totle-row">
                                    <div class="col-md-1 col-sm-1 col-xs-1"></div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                       <p class="p-no-bottom order-ad-left">运费总价：</p>
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2"><span id="yunfeiTotal">100.00</span></div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        

        
    </div>

    <footer class="tool_foot">
        <div class="container footer itme_detail_top">
            <div class="row footer-row">
                <div class="col-md-6 col-sm-6 col-xs-6 footer-col">
                    <p class="foot-text">总价：<span id="total">0</span>元</p>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 footer-col">
                    <button id="zhifu_bt" class="btn btn-success a-btn" type="button">支付</button>
                </div>
            </div>
        </div>
    </footer>
   
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script type="text/javascript">
var UrlConfig = {
        path:'<%=request.getContextPath() %>',
        getRegion:'<%=request.getContextPath() %>/app/mobile/useradress/getAddressLevel1',
        getRegion2:'<%=request.getContextPath() %>/app/mobile/useradress/getAddressLevel2',
        saveAd:'<%=request.getContextPath() %>/app/mobile/useradress/saveAddress',
        loadUpdAdress:'<%=request.getContextPath() %>/app/mobile/useradress/loadUpdAdress',
        deleteAddress:'<%=request.getContextPath() %>/app/mobile/useradress/deleteAddress',
        orderSubmit:'<%=request.getContextPath() %>/app/mobile/order/orderSubmit',
        updOrderToPayed:'<%=request.getContextPath() %>/app/mobile/order/updOrderToPayed'
    };
//更新用
var modal;
var addressid;

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
        // 合计
        $("#total").html("${heji}");
        // 绑定单击事件
        bindEvent();
    });
    //
    $("#zhifu_bt").click(function(){
        dosubmit();
    });
	// 取一级地址
    //$('#myModal').on('show.bs.modal', function (e) {
    //});
    // 取二级地址
    $('#ad1').change(function(){
    	$('#ad2').html('<option  value="">请选择</option>');
    	$('#ad3').html('<option  value="">请选择</option>');
    	getRegion2($(this).val(),'ad2');
    });
        // 取二级地址
    $('#ad2').change(function(){
    	$('#ad3').html('<option  value="">请选择</option>');
    	getRegion2($(this).val(),'ad3');
    });
    //adnew_bt1
    $('#save_bt').click(function(){
    	saveAddress();
    });
    $('#delete_ad_bt').click(function(){
    	deleteAddress();
    });
});
function getRegion(){
    $.ajax({    
        url:UrlConfig.getRegion, 
        data:{},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	for (var i = 0; i < result.data.length; i++) {
            		$("#ad1").append('<option value="'+result.data[i].regionId+'">'+result.data[i].regionName+'</option>');
            	}
            }else{
            }
         }
    }); 
}
function getRegion2(parent,o){
    $.ajax({    
        url:UrlConfig.getRegion2, 
        data:{parent:parent},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	for (var i = 0; i < result.data.length; i++) {
            		$('#'+o).append('<option value="'+result.data[i].regionId+'">'+result.data[i].regionName+'</option>');
            	}
            }else{
            }
         }
    }); 
}
function clearModal(){
	$('#mailName').val("");
	$('#mailTel').val("");
	$('#ad4').val("");
	$('#ad2').html('<option  value="">请选择</option>');
	$('#ad3').html('<option  value="">请选择</option>');
	$('#morenFlg').iCheck('uncheck');
	$('#ad1 option:first').attr('selected','selected');
}
function saveAddress(){
	var checkflg;
	if($('#morenFlg').prop("checked")==true){
		checkflg='1';
	}else{
		checkflg='0';
	}
    $.ajax({
        url:UrlConfig.saveAd, 
        data:{regionName1:$('#ad1').val(),
        	  regionName2:$('#ad2').val(),
        	  regionName3:$('#ad3').val(),
        	  addressDetail:$('#ad4').val(),
        	  name:$('#mailName').val(),
        	  tel:$('#mailTel').val(),
        	  delFlg:checkflg,
        	  mode:modal,
        	  addressId:addressid},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	//刷新
            	refreshHead(result.data.udMap[0]);
            	refreshList(result.data.uadList);
            	//收缩页面
            	$("#accordion-element-588573").collapse('hide');
                $("#main_div").scrollTop(0);
                // 绑定单击事件
				bindEvent();
                // 关闭模态窗口
                $('#myModal').modal('hide');
            }else{
            	myalert(result.msg,'myModal');
            }
         }
    }); 
}
function deleteAddress(){
    $.ajax({    
        url:UrlConfig.deleteAddress, 
        data:{addressid:addressid},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	refreshHead(result.data.uadList[0]);
            	refreshList(result.data.uadList);
                // 绑定单击事件
				bindEvent();
                // 关闭模态窗口
                $('#myModal').modal('hide');
            }else{
            	myalert(result.msg,'myModal');
            }
         }
    });
}
function loadUpdAddress(addressid){
    $.ajax({    
        url:UrlConfig.loadUpdAdress, 
        data:{addressid:addressid},    
        type:'post',    
        //cache:false,    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	var userAddress = result.data.userAddress;
            	
            	$('#ad1').val(userAddress.regionName1);
            	//$('#ad2').val(userAddress.regionName2);
            	//$('#ad3').val(userAddress.regionName3);
            	$('#ad4').val(userAddress.addressDetail);
            	$('#mailName').val(userAddress.name);
            	$('#mailTel').val(userAddress.tel);
            	
            	var region2 = result.data.region2;
            	var region3 = result.data.region3;
            	//二级地址
            	for (var i = 0; i < region2.length; i++) {
            		$("#ad2").append('<option value="'+region2[i].regionId+'">'+region2[i].regionName+'</option>');
            	}
            	$('#ad2').val(userAddress.regionName2);
            	// 三级地址
            	for (var i = 0; i < region3.length; i++) {
            		$("#ad3").append('<option value="'+region3[i].regionId+'">'+region3[i].regionName+'</option>');
            	}
            	$('#ad3').val(userAddress.regionName3);
            	// 默认
            	if(userAddress.delFlg=='1'){
            		$('#morenFlg').iCheck('check');
            	}else{
            		$('#morenFlg').iCheck('uncheck');
            	}
            }else{
            	myalert(result.msg,'myModal');
            }
         }
    }); 
}
function bindEvent(){
    $('div[name="addiv"]').bind("click",function(){
    	//id="head-ad"
    	$("#head-name").html($(this).attr("adname"));
    	$("#head-ad").html($(this).attr("ad1")+$(this).attr("ad2")+
    			$(this).attr("ad3")+$(this).attr("ad4"));
    	$("#head-tel").html($(this).attr("tel"));
    	$("#head-adid").val($(this).attr("adid"));
    	$("#accordion-element-588573").collapse('hide');
    	$("#main_div").scrollTop(0);
    });
    $('button[name="upd_adress"]').bind("click",function(){
    	modal="UPD";
    	$('#delete_ad_bt').show();
    	addressid=$(this).attr("addressid");
    	loadUpdAddress($(this).attr("addressid"));
    	$('#myModal').modal('show');
    	
    });
    $('#adnew_bt2').bind("click",function(event){
    	modal="ADD";
    	$('#delete_ad_bt').hide();
    	clearModal();
    	//阻止事件冒泡
    	//event.stopPropagation(); 
    });
    $('#adnew_bt1').bind("click",function(){
    	modal="ADD";
    	$('#delete_ad_bt').hide();
    	clearModal();
    });
}

function dosubmit(){
	//check
	if($("#head-adid").val()==null){
		myalert("没有收货地址",'main_div');
		return;
	}
	
	if(isNaN($("#jifen").val())||($("#jifen").val()*1 > $("#canuseJifen").text()*1)){
		myalert("积分输入不正确",'main_div');
		return;
	}

	//是否使用积分
	var jifenFlg;
    if($('#jifenFlg').prop("checked")==true){
    	jifenFlg='1';
    }else{
    	jifenFlg='0';
    }
    //明细商品数据取得
    var list = new Array();
    $('div[name="itemqingdan"]').each(function(){
        list.push({itemId: $(this).attr("itemId"),
            itemGuige: $(this).attr("itemGuige"),
            itemYanse: $(this).attr("itemYanse"),
            shuliang: $(this).attr("shuliang")}); 
    });
    if(list.length==0){
    	myalert("没有购买商品！",'main_div');
    	return;
    }
    var orderItems=JSON.stringify(list);
    // 提交
    $.ajax({    
        url:UrlConfig.orderSubmit,
        data:{
        	   totlePrice:$("#itemTotal").text(),
        	   wuliuYunfei:$("#yunfeiTotal").text(),
        	   shijiPrice:$("#total").text(),
        	   jifenDixiao:$("#jifen").val(),
        	   jifenFlg:jifenFlg,
        	   addressId:$("#head-adid").val(),
        	   orderItems:orderItems
            },
        type:'post',    
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
            	//alert(result.data.appId);
            	//发起支付
            	WeixinJSBridge.invoke('getBrandWCPayRequest',{
 		 											"appId" : result.data.appId,
 		 											"timeStamp" : result.data.timeStamp, 
 		 											"nonceStr" : result.data.nonceStr, 
 		 											"signType" : "MD5",
 		 											"package" : result.data.prepay_id,
 		 											"paySign" : result.data.sign 
  									},function(res){
  						  				WeixinJSBridge.log(res.err_msg);
	    				          		if(res.err_msg == "get_brand_wcpay_request:ok"){  
	    				  					//alert("微信支付成功!");  
	    				  					updOrderToPayed(result.data.orderId,result.data.payId);
	    				  		 		}else if(res.err_msg == "get_brand_wcpay_request:cancel"){  
	    				  					//alert("用户取消支付!");  
	    				  				}else{  
	    				  					alert("支付失败!");  
	    				  		  		}
                                        // 跳转
                                        window.location.href='<%=request.getContextPath() %>'+
                                        '/app/mobile/page/huiyuan?'+
                                        'orderId='+result.data.orderId,+
                                        '&payId='+result.data.payId; 
	    			  				});
            }else{
                myalert(result.msg,'main_div');
            }
         }
    });
}
function updOrderToPayed(orderId,payId){
	if(orderId==null){
		// 跳转
		window.location.href='<%=request.getContextPath() %>'+
                             '/app/mobile/page/huiyuan'; 
		return;
	}
    $.ajax({    
        url:UrlConfig.updOrderToPayed, 
        data:{orderId:orderId},
        type:'post',
        //cache:false,
        dataType:'json',    
        success:function(result) {
            if(result.successful == true ){
                // 跳转
                window.location.href='<%=request.getContextPath() %>'+
                                     '/app/mobile/page/huiyuan'; 
            }else{
                myalert(result.msg,'main_div');
            }
         }
    });
}




// 刷新
function refreshHead(item){
	if(item==null){
		$('div[name="head-address"]').html('<div class="row">                                                             '+
        		'	<div class="col-md-12 col-sm-12 col-xs-12 new-ad">                         '+
               	'		 <button id="adnew_bt2"                                                '+
               	'		 		 class="btn btn-default btn-block btn-lg address-new"          '+
               	'		 		 type="button" data-toggle="modal"                             '+
               	'		 		 data-target="#myModal">                                       '+
               	'		 		 <span class="glyphicon glyphicon-plus" aria-hidden="true">    '+
               	'		 		 </span>新增地址</button>                                      '+
            	'	</div>                                                                     '+
        		'</div>                                                                        ');
		return;
	}
	// 
	$('div[name="head-address"]').html('<div class="row">                                                                 '+
            '	<input type="hidden" id="head-adid" value="'+item.address_id+'">               '+
            '    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">                           '+
            '        <p class="p-no-bottom order-ad-left">收件人:</p>                          '+
            '    </div>                                                                        '+
            '    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">                           '+
            '        <p class="p-no-bottom order-ad-right" id="head-name">'+item.name+'</p>    '+
            '    </div>                                                                        '+
            '</div>                                                                            '+
            '<div class="row">                                                                 '+
            '    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">                           '+
            '        <p class="p-no-bottom order-ad-left ">地址:</p>                           '+
            '    </div>                                                                        '+
            '    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">                           '+
            '        <p class="p-no-bottom order-ad-right" id="head-ad">                       '+
            '          '+item.adname1+item.adname2+item.adname3+item.address_detail+'          '+
            '        </p>                                                                      '+
            '    </div>                                                                        '+
            '</div>                                                                            '+
            '<div class="row">                                                                 '+
            '    <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">                           '+
            '        <p class="p-no-bottom order-ad-left" >电话:</p>                           '+
            '    </div>                                                                        '+
            '    <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">                           '+
            '        <p class="p-no-bottom order-ad-right" id="head-tel">                      '+
            '        	'+item.tel+'                                                           '+
            '        </p>                                                                      '+
            '    </div>                                                                        '+
            '</div>                                                                            ');
}
function refreshList(list){
	$('div[name="body-address"]').html('');
	for(var i=0;i<list.length;i++){
		$('div[name="body-address"]').append('<div class="row od-ad-row">                                                     '+
                '    <div class="col-md-2 col-sm-2 col-xs-2 order-icon-col">                     '+
                '        <button class="btn btn-mini btn-default"                                '+
                '                type="button"                                                   '+
                '                name="upd_adress"                                               '+
                '                addressid="'+list[i].address_id+'"                              '+
                '                adname="'+list[i].name+'"                                       '+
                '                ad1="'+list[i].adname1+'"                                       '+
                '                ad2="'+list[i].adname2+'"                                       '+
                '                ad3="'+list[i].adname3+'"                                       '+
                '                ad4="'+list[i].address_detail+'"                                '+
                '                tel="'+list[i].tel+'">改</button>                               '+
                '    </div>                                                                      '+
                '    <div class="col-md-10 col-sm-10 col-xs-10 order-container"                  '+
                '             name="addiv"                                                       '+
                '             adid="'+list[i].address_id+'"                                      '+
                '             adname="'+list[i].name+'"                                          '+
                '             ad1="'+list[i].adname1+'"                                          '+
                '             ad2="'+list[i].adname2+'"                                          '+
                '             ad3="'+list[i].adname3+'"                                          '+
                '             ad4="'+list[i].address_detail+'"                                   '+
                '             tel="'+list[i].tel+'">                                             '+
                '        <div class="container">                                                 '+
                '            <div class="row">                                                   '+
                '                <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">             '+
                '                    <p class="p-no-bottom order-ad-left">收件人:</p>            '+
                '                </div>                                                          '+
                '                <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">             '+
                '                    <p class="p-no-bottom order-ad-right">'+list[i].name+'</p>  '+
                '                </div>                                                          '+
                '            </div>                                                              '+
                '            <div class="row">                                                   '+
                '                <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">             '+
                '                    <p class="p-no-bottom order-ad-left ">地址:</p>             '+
                '                </div>                                                          '+
                '                <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">             '+
                '                    <p class="p-no-bottom order-ad-right">                      '+
                '                    '+list[i].adname1+list[i].adname2+list[i].adname3+list[i].address_detail+'</p> '+
                '                </div>                                                          '+
                '            </div>                                                              '+
                '            <div class="row">                                                   '+
                '                <div class="col-md-3 col-sm-3 col-xs-3 col-no-pad">             '+
                '                    <p class="p-no-bottom order-ad-left">电话:</p>              '+
                '                </div>                                                          '+
                '                <div class="col-md-9 col-sm-9 col-xs-9 col-no-pad">             '+
                '                    <p class="p-no-bottom order-ad-right">'+list[i].tel+'</p>   '+
                '                </div>                                                          '+
                '            </div>                                                              '+
                '        </div>                                                                  '+
                '    </div>                                                                      '+
                '</div>');
	}
	$('div[name="body-address"]').append('<div class="row">                                                   '+
            '    <div class="col-md-12 col-sm-12 col-xs-12 address-new-bt">      '+
            '        <button id="adnew_bt1" class="btn btn-default btn-block     '+
			'                   address-new" type="button" data-toggle="modal"   '+
			'				   data-target="#myModal">新增地址</button>          '+
            '    </div>                                                          '+
            '</div>                                                              ');
}





        </script>
</body>
</html>
