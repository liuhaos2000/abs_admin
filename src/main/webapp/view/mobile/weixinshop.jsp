<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>会员</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/media.css">
</head>
<body>
    <div class="container huiyuan">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 huiyuan_xinxi">
                <div class="user_head">
                    <a href="#">
                        <img src="<%=request.getContextPath() %>/resources/images/head_icon.png"></a>
                </div>
                <div>
                    <a href="#" class="user_name">
                        <p>missyy0927</p>
                    </a>
                    <a href="#" class="user_count">
                        <p>现有积分 1010</p>
                    </a>
                </div>
                <img src="<%=request.getContextPath() %>/resources/images/rate.png" class="user_rate"></div>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-5 col-md-offset-9 col-sm-offset-9 col-xs-offset-7 get_wifi">
                
            </div>
        </div>
    </div>
    <div class="container huiyuan_main">
        <div class="panel p1">
            <div class="panel-heading">
                <p>会员活动</p>
            </div>
            <div class="panel-body">
                <ul class="list-unstyled">
                    <li>
                        <p>
                            <a href="#">新生报到 IN越惠</a>
                            <span>5月25日</span>
                        </p>
                    </li>
                    <li>
                        <p>
                            <a href="#">妆艺术·饰生活</a>
                            <span>5月18日</span>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="panel p2">
            <div class="panel-heading">
                <a href="jifenjiangli.html">
                    <p>我的订单</p>
                </a>
            </div>
        </div>
        <div class="panel p3">
            <div class="panel-heading">
                <a href="#">
                    <p>地址管理</p>
                </a>
            </div>
        </div>
                <div class="panel p2">
            <div class="panel-heading">
                <a href="#">
                    <p>地址管理</p>
                </a>
            </div>
        </div>
    </div>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	if ("${pageCode}" == '1') {
		window.location.href = "http://mp.weixin.qq.com/bizmall/mallshelf?id=&t=mall/list&biz=MzIyODAxMTQ4Mg==&shelf_id=1&showwxpaytitle=1#wechat_redirect"
	} else if ("${pageCode}" == '2') {
		window.location.href = "http://mp.weixin.qq.com/bizmall/mallshelf?id=&t=mall/list&biz=MzIyODAxMTQ4Mg==&shelf_id=2&showwxpaytitle=1#wechat_redirect"
	}
</script>
</body>
</html>