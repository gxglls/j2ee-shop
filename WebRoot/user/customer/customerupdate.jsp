<%@page import="com.taoduoduo.customer.*"%>
<%@page import="com.taoduoduo.saller.Saller"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	Customer c=(Customer)session.getAttribute("customer");
 %>


<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>买家资料</title>
  <meta name="description" content="这是一个 user 页面">
  <meta name="keywords" content="user">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  	<link rel="stylesheet" type="text/css" href="../public/bootstrap/css/bootstrap.min.css">
	<script src="../public/bootstrap/js/jquery.min.js"></script>
	<script src="../public/bootstrap/js/bootstrap.min.js"></script>
	<script src="../public/bootstrap/js/holder.js"></script>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>淘 多 多</strong> <small>个人管理</small>
  </div>

  <a class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></a>


</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
       
       
   <li class="admin-parent">订单管理<a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="customer.jsp?id=8" class="am-cf">已完成订单<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="customer.jsp?id=9"><span class="am-icon-puzzle-piece"></span>未完成订单</a></li>
          </ul>
        </li>
        

        <li class="admin-parent">个人管理<a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                  <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="customerupdate.jsp" class="am-cf"><span class="am-icon-check"></span>修改个人资料<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          <li><a href="../../login/loginout.jsp?usertype=customer" class="am-cf"><span class="am-icon-check"></span>注销<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          <li><a href="customer.jsp?id=5" class="am-cf"><span class="am-icon-check"></span>购物车<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          </ul>
      </li>
        
        
        <!-- <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 订单信息 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="admin-user.html" class="am-cf"><span class="am-icon-check"></span> 已完成的订单<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="admin-help.html"><span class="am-icon-puzzle-piece"></span> 正在进行的订单</a></li>
            <li><a href="admin-gallery.html"><span class="am-icon-th"></span> 已完成的订单<span class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
          </ul> -->

  
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">卖家资料</strong> / <small>Personal information</small></div>
      </div>

      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          <div class="am-panel am-panel-default" style="display:none">
            <div class="am-panel-bd" style="display:none">
              <div class="am-g">
                <div class="am-u-md-4" style="display:none">
                  <img class="am-img-circle am-img-thumbnail" src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/200/h/200/q/80" alt=""/>
                </div>
                <div class="am-u-md-8" style="display:none">
                  <p>你可以使用<a href="#">gravatar.com</a>提供的头像或者使用本地上传头像。 </p>
                  <form class="am-form">
                    <div class="am-form-group">
                      <input type="file" id="user-pic">
                      <p class="am-form-help">请选择要上传的文件...</p>
                      <button type="button" class="am-btn am-btn-primary am-btn-xs">保存</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

        

        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form class="am-form am-form-horizontal" action="customerupdatedeal.jsp" method="post">
            <div class="am-form-group">
              <label for="user-name" class="am-u-sm-3 am-form-label">用户名</label>
              <div class="am-u-sm-9">
                <input type="text" name="name" id="username" value="<%=c.getName() %>">
               
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-email" class="am-u-sm-3 am-form-label">密码</label>
              <div class="am-u-sm-9">
                <input type="text" name="password" id="password" value=<%=c.getPassword() %>>
                <small></small>
              </div>
            </div>
            
            
            <div class="am-form-group">
              <label for="user-email" class="am-u-sm-3 am-form-label">电话</label>
              <div class="am-u-sm-9">
                <input type="text" name="telephone" id="password" value=<%=c.getPassword() %>>
                <small></small>
              </div>
            </div>

            <div class="am-form-group">
              <label for="user-intro" class="am-u-sm-3 am-form-label">收货地址</label>
              <div class="am-u-sm-9">
                <textarea class="" rows="5" id="descr" name="address" ><%=c.getAddress() %></textarea>
              </div>
            </div>
            
            <div class="am-form-group">
              <label for="user-intro" class="am-u-sm-3 am-form-label">用户余额</label>
              <div class="am-u-sm-9">
                	￥ <%=c.getCash() %> 
              </div>
            </div>

            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <input type="submit" class="am-btn am-btn-primary" value="保存修改">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="admin.jsp?id=1"  type="button" class="am-btn am-btn-primary">放弃修改</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  <!-- content end -->

</div>








</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
  <hr>
  <p class="am-padding-left">&nbsp;</p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>

<script src="assets/js/app.js"></script>
</body>
</html>



