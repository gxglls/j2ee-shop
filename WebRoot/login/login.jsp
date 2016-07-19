<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Login Page | Amaze UI Example</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
    <link rel="stylesheet" href="amazeui.min.css"/>
    <style>
        .header {
            text-align: center;
        }
        .header h1 {
            font-size: 200%;
            color:#725F57;
            margin-top: 30px;
        }
        .header p {
            font-size: 14px;
        }
        /*body{*/
            /*background-color:#BAE7CA*/

        /*}*/
        .am-fr{
            margin-right: 20px;
        }
        .am-fl{
            margin-left: 20px;
        }
    </style>
</head>


<body
        style="background-image:url('42q58PICMCD_1024.png');">
<div class="header">
    <div class="am-g">
        <h1>淘多多</h1>
        <p><br/>‣‣‣淘多多 买多多‣‣‣</p>
    </div>
    <hr />
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3>客官您来啦⚆ ⚆</h3>
        <!--<hr>-->
        <!--&lt;!&ndash;<div class="am-btn-group">&ndash;&gt;-->
        <!--&lt;!&ndash;<a href="#" class="am-btn am-btn-secondary am-btn-sm"><i class="am-icon-github am-icon-sm"></i> Github</a>&ndash;&gt;-->
        <!--&lt;!&ndash;<a href="#" class="am-btn am-btn-success am-btn-sm"><i class="am-icon-google-plus-square am-icon-sm"></i> Google+</a>&ndash;&gt;-->
        <!--&lt;!&ndash;<a href="#" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-stack-overflow am-icon-sm"></i> stackOverflow</a>&ndash;&gt;-->
        <!--&lt;!&ndash;</div>&ndash;&gt;-->
        <!--<br>-->
        <!--<br>-->
<!--         <form>
            我是买家&nbsp;&nbsp;&nbsp;:
            <input type="radio" checked="checked" name="radio" value="customer">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br>
            我是卖家&nbsp;&nbsp;&nbsp;:
            <input type="radio" name="radio" value="customer">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br>
            我是管理员:
            <input type="radio" name="usertype" value="admin"> 
        </form>
        <br>
        <br>
-->
        <form method="post" class="am-form" action="logindeal.jsp">
        
     		   我是买家&nbsp;&nbsp;&nbsp;:	
        	  <input type="radio" checked="checked" name="radio" value="customer">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br>
            	我是卖家&nbsp;&nbsp;&nbsp;:
            <input type="radio" name="radio" value="saller">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br>
        	<br>
            <label for="email">输入您的用户名:</label>
			
            <input type="text" name="name" value="">
            <br/>
            <label for="password">密码:</label>
            <br/>
            <input type="password" name="password" id="password" value="">
            <br/>
            <label for="remember-me">
                <input id="remember-me" type="checkbox">
                记住密码
            </label>
            <br />
            <div class="am-cf">
                <input type="submit" name="" value="啊哈 欢迎登陆 ☺︎" class="am-btn am-btn-primary am-btn-sm">
                <!-- <input type="submit" name="" value="忘记密码 ☹" class="am-btn am-btn-default am-btn-sm am-fr am-fl"> -->
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="../register/register.jsp"><input  name="" value="COME ON 注册一下✉︎" class="am-btn am-btn-default am-btn-sm"></a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </form>

        </hr>
        <p>© buymore,please.</p>
    </div>
</div>
</body>
</html>