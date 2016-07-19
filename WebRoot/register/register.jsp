<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="keywords" content="注册页面模板,网站注册页面,注册模板页面,网站模板,注册页面表单验证">
<meta name="description" content="JS代码网提供大量的注册页面模板的学习和下载">
<link rel="shortcut icon" href="resources/images/favicon.ico" />
<link href="resources/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/jquery.i18n.properties-1.0.9.js" ></script>
<script type="text/javascript" src="resources/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="resources/js/md5.js"></script>
<script type="text/javascript" src="resources/js/page_regist.js?lang=zh"></script>
<!--[if IE]>
  <script src="resources/js/html5.js"></script>
<![endif]-->
<!--[if lte IE 6]>
	<script src="resources/js/DD_belatedPNG_0.0.8a-min.js" language="javascript"></script>
	<script>
	  DD_belatedPNG.fix('div,li,a,h3,span,img,.png_bg,ul,input,dd,dt');
	</script>
<![endif]-->
<style type="text/css">
body {
	background-image: url(42q58PICMCD_1024.png);
}
</style>
</head>
<body background="42q58PICMCD_1024.png" class="loginbody">
<div class="dataEye">
  <div class="loginbox registbox">
    <div class="login-content reg-content">
    
      <div class="loginbox-title">
        <h3>注册</h3>
      </div>
      <form id="signupForm" method="post" action="registerdeal.jsp">
        
        <div class="row">
          <label class="field" for="email">用户名</label>
          <input type="text" value="" class="input-text-user noPic input-click" name="name" id="email">
        </div>
        
        <div class="row">
          <label class="field" for="password">密码</label>
          <input type="password" value="" class="input-text-password noPic input-click" name="password" id="password">
        </div>
        
        <div class="row">
          <label class="field" for="passwordAgain">确认密码</label>
          <input type="password" value="" class="input-text-password noPic input-click" name="passwordAgain" id="passwordAgain">
        </div>
        
        <div class="row">
          <div align="left">请选择身份：
            <label>
              <input type="radio" name="radio" id="买家" value="customer">
              我是买家</label>
            <label>
              <input type="radio" name="radio" id="卖家" value="saller">
              我是卖家</label>
          </div>
        </div>
        
        
        
        <div class="row btnArea"> <input class="login-btn" id="submit" type="submit" value="注册"> </div>
      </form>
    </div>
    
    
    <div class="go-regist"> 已有帐号,请<a href="#" class="link">登录</a> </div>
  </div>
  
  
<div class="loading">
  <div class="mask">
    <div class="loading-img"> <img src="resources/images/loading.gif" width="31" height="31"> </div>
  </div>
</div>
</body>
</html>

