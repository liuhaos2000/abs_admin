<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>我的订单</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/media.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/skins/square/red.css" >
</head>
<body id="aa">

	<header class="tool_top">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<p class="head-text">
						<strong>我的订单</strong>
					</p>
				</div>
			</div>
		</div>
	</header>

	
	<div id="main_div" class="maindiv">
		<div class="container order-group">
			<div class="row order-num">
				<div class="col-md-8 col-sm-8 col-xs-8">
					<p class="order-num-position ">订单号：12121200001</p>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4">
					<p class="order-num-position ">待发货</p><span class="btn-deletl">x</span>
				</div>
			</div>
			<div class="row order-title ">
				<div class="col-md-3 col-sm-3 col-xs-3">
					<img class="order-num-position order-img1" src="<%=request.getContextPath() %>/resources/images/ms1.png">
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3">
					<img class="order-num-position order-img1" src="<%=request.getContextPath() %>/resources/images/ms1.png">
				</div>
				<div class="col-md-3 col-sm-3 col-xs-3">
					<img class="order-num-position order-img1" src="<%=request.getContextPath() %>/resources/images/ms1.png">
				</div>
				
			</div>
			<div class="row order-total">
				<div class="col-md-8 col-sm-8 col-xs-8">
					<p class="order-num-position ">实支付：100.00</p>
				</div>
				<div class="col-md-4 col-sm-4 col-xs-4">
					<button type="button" class="btn btn-danger btn-xs order-num-position order-num-bt">去付款</button>
				</div>
			</div>
		</div>

        <!-- Modal -->
        <div class="modal " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="myModalLabel"><Strong>收货地址</strong></h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
							<div class="form-group">
                                <label for="inputPassword3" class="col-md-3 col-sm-3 col-xs-3  control-label">姓名：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8">
                                  <input type="text" class="form-control" id="inputPassword3" placeholder="王">
                                </div>
                            </div>
							<div class="form-group">
                                <label for="inputPassword3" class="col-md-3 col-sm-3 col-xs-3  control-label">电话：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8">
                                  <input type="text" class="form-control" id="inputPassword3" placeholder="18623099999">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label">省份：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8">
                                  <button class="btn btn-default" type="submit">请选择省份</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label">城市：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8">
                                    <select  class="form-control">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
										                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
										                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
										                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label">区域：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8">
                                  <input type="text" class="form-control" id="inputEmail3" placeholder="1111111">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-md-3 col-sm-3 col-xs-3 control-label">详细：</label>
                                <div class="col-md-8 col-sm-8 col-xs-8">
                                  <input type="text" class="form-control" id="inputEmail3" placeholder="111111">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox"> 默认收货地址
                                    </label>
                                  </div>
                                </div>
                            </div>
                         </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                      <button type="button" class="btn btn-primary">保存</button>
                    </div>
                </div>
            </div>
        </div>
		
	</div>

	<footer class="tool_foot">
		<div class="container">
			<div class="row footer-row">
				<div class="col-md-6 col-sm-6 col-xs-6 footer-col">
					<button class="btn btn-default a-btn" type="button">返回</button>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6 footer-col">
				</div>
			</div>
		</div>
	</footer>

	
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/sco.modal.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/icheck.min.js"></script>
<script type="text/javascript">
            $(document).ready(function() {
				//选择框
				$('input').iCheck({
					checkboxClass: 'icheckbox_square-red',
					radioClass: 'iradio_square-red',
					increaseArea: '20%' // optional
				});	
				//设置高度			
			    $(function(){
			    	$("#main_div").height($(window).height()-$("header").height()-$("footer").height()-2);
			    	$("#main_div").css({"overflow":"auto"});
			    });
				//设置模态框位置
				$("#myModal").on('shown.bs.modal', function() {
					$(this).css({
					    'margin-top': function () {
							return ($(this).height()-$('.modal-dialog').height())/2;
						}
                    });
                });
            });
        </script>
</body>
</html>