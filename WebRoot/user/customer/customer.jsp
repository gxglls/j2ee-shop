<%@page import="com.taoduoduo.category.Category"%>
<%@page import="com.taoduoduo.customer.*"%>
<%@page import="com.taoduoduo.saller.Saller"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*,com.taoduoduo.order.*,com.taoduoduo.admin.*,com.taoduoduo.cart.*,com.taoduoduo.saller.*,com.taoduoduo.category.*,com.taoduoduo.product.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//已完成订单 8
//未完成订单 9
%>


<%
 	int PAGE_SIZE=8;
 	Customer c=(Customer)session.getAttribute("customer");
 	
 	
	
	int id = -1;
	int pageNum=0;
	if(request.getParameter("id")!=null){
		id=Integer.parseInt(request.getParameter("id"));
	}
	
	if(id==1){
		pageNum=Page.getPage("saller", PAGE_SIZE);
	}
	
	if(id==2){
		pageNum=Page.getPage("customer", PAGE_SIZE);
	}
	
	if(id==3){
		//pageNum=Page.getPage("product", PAGE_SIZE);
		;
	}

	String temp=request.getParameter("page");
	
	int pageCur=1;
	if(temp!=null){
		pageCur=Integer.parseInt(temp);
	}
	
 	if(pageCur>pageNum){
		pageCur=pageNum;
	}
	
	if(pageCur<=1){
		pageCur=1;
	}
	 
 %>



<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>卖家资料</title>
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
  	<link rel="stylesheet" type="text/css" href="../../public/bootstrap/css/bootstrap.min.css">
	<script src="../../public/bootstrap/js/jquery.min.js"></script>
	<script src="../../public/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../public/bootstrap/js/holder.js"></script>
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

	<%	
		
			int i=0;
			String[] color={"danger","info","active","success","warning"};
			
			
			
			if(id==1){
			
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>管理卖家</strong>/user manage</div>
     </div>
     <br>
     
     
 		<table class="table table-hover">
  			<tr class="success">
  			<th>卖家编号</th>
  			<th>卖家账号</th>
  			<th>卖家密码</th>
  			<th>卖家介绍</th>
  			<th>操作</th>
  			<th>操作</th>
  			</tr>
  			
    	<%
			ArrayList<Saller> sallers=SallerMrg.get_instance().getSallersByPage(pageCur,PAGE_SIZE);
    		Iterator<Saller> it=sallers.iterator();
    		while(it.hasNext()){
    			Saller u= it.next();
		%>
  			<tr class="<%= color[i]%>">
  			
    			<td><%=u.getId() %></td>
    			<td><%=u.getName() %></td>
    			<td><%=u.getPassword() %></td>
    			<td><%=u.getDescr() %></td>
				<td><a href="sallerdel.jsp?id=<%=u.getId()  %>" type="button" class="btn btn-info btn-sm">删除</a></td>
				<td><a href="sallerupdate.jsp?id=<%=u.getId()  %>" type="button" class="btn btn-warning btn-sm">修改</a></td>
    			
    		</tr> 
		<% 
				i++;
				if(i>4){
					i=0;
				}
			}
		%> 
		
				  		</table>
  		
  		<%
  			}
  		 %> 
		
		
		
	<!-- ----------------------------------------------------------------------- customer start  ---------------------------------------------------------------------------->
		
	<%	
					if(id==2){
			
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>管理买家</strong>/user manage</div>
     </div>
     <br>
     
     
 		<table class="table table-hover">
  			<tr class="success">
  			<th>买家编号</th>
  			<th>买家名称</th>
  			<th>买家密码</th>
  			<th>买家地址</th>
  			<th>买家电话</th>
  			<th>买家邮箱</th>
  			<th>操作</th>
  			<th>操作</th>
  			</tr>
  			
    	<%
			ArrayList<Customer> customers=CustomerMrg.get_instance().getCustomersByPage(pageCur, PAGE_SIZE);
    		Iterator<Customer> it=customers.iterator();
    		while(it.hasNext()){
    			Customer u= it.next();
		%>
  			<tr class="<%= color[i]%>">
  			
    			<td><%=u.getId() %></td>
    			<td><%=u.getName() %></td>
    			<td><%=u.getPassword() %></td>
    			<td><%=u.getAddress() %></td>
    			<td><%=u.getTelephone() %></td>
    			<td><%=u.getEmail() %></td>
				<td><a href="customerdel.jsp?id=<%=u.getId()  %>" type="button" class="btn btn-info btn-sm">删除</a></td>
				<td><a href="customerupdate.jsp?id=<%=u.getId()  %>" type="button" class="btn btn-warning btn-sm">修改</a></td>
    			
    		</tr> 
		<% 
				i++;
				if(i>4){
					i=0;
				}
			}
		%> 
		
		  		</table>
  		
  		<%
  			}
  		 %> 
  		 
  		<!-- ----------------------------------------------------------------------- product start  ----------------------------------------------------------------------------> 
  	<%	
					if(id==3){
			
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>个人资料</strong>/user manage</div>
     </div>
     <br>
     
     
 		<table class="table table-hover">
  			<tr class="success">
  			<th>商品编号</th>
  			<th>商品类别</th>
  			<th>商品名</th>
  			<th>商品描述</th>
  			<th>库存</th>
  			<th>是否上架</th>
  			<th>图片</th>
  			<th>操作</th>
  			<th>操作</th>
  			</tr>
  			
    	<%
			ArrayList<Product> products=ProductMrg.get_instance().getProductsByPage(pageCur, PAGE_SIZE);
    		Iterator<Product> it=products.iterator();
    		
    		while(it.hasNext()){
    			Product u= it.next();
		%>
  			<tr class="<%= color[i]%>">
  			
    			<td><%=u.getId() %></td>
    			<td><%=CategoryMrg.get_instance().loadById(u.getCategoryid()) %></td>
    			<td><%=u.getName() %></td>
    			<td><%=u.getDescr() %></td>
    			<td><%=u.getStock() %></td>
    			<td><%=u.getShelf() %></td>
    			<td><img src="../images/product/<%= u.getImage() %>"></td>
				<td><a href="" type="button" class="btn btn-info btn-sm">上架</a></td>
				<td><a href="" type="button" class="btn btn-warning btn-sm">删除</a></td>
    			
    		</tr> 
		<% 
				i++;
				if(i>4){
					i=0;
				}
			}
		%> 
				<td><a href="productadd.jsp" type="button" class="btn btn-info btn-sm">添加商品</a></td>
		  		</table>
  		
  		<%
  			}
  		 %> 	 
  		 
		
		<!-- ----------------------------------------------------------------------- category start  ---------------------------------------------------------------------------->
		
	<%	
					if(id==4){
			
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>管理买家</strong>/user manage</div>
     </div>
     <br>
     
     
 		<table class="table table-hover">
  			<tr class="success">
  			<th>类别编号</th>
  			<th>类别名称</th>
  			<th>类别等级</th>
  			<th>操作</th>
  			<th>操作</th>
  			</tr>
  			
    	<%
			ArrayList<Category> categorys=new ArrayList<Category>();
			CategoryMrg.get_instance().getCategories(categorys, -1);
    		Iterator<Category> it=categorys.iterator();
    		while(it.hasNext()){
    			Category u= it.next();
    			String preStr="";
    			for(int j=0;j<u.getGrade();j++){
    				preStr+="----- ";
    			} 
		%>
  			<tr class="<%= color[i]%>">
  			
    			<td><%=u.getId() %></td>
    			<td><%=preStr+u.getName() %></td>
    			<td><%=u.getGrade() %></td>
				<td><a href="categoryaddchild.jsp?pid=<%=u.getId()  %>" type="button" class="btn btn-info btn-sm">添加子类</a></td>
				<td><a href="categorydel.jsp?id=<%=u.getId()  %>" type="button" class="btn btn-warning btn-sm">删除</a></td>
    			
    		</tr> 
		<% 
				i++;
				if(i>4){
					i=0;
				}
			}
		
		%>
		
		
			<td><a href="categoryaddroot.jsp" type="button" class="btn btn-info btn-sm">添加根类别</a></td>
  		</table>
  		
  		<%
  			}
  		 %> 
  		 
<!-- ----------------------------------------------------------------------- cart start  ---------------------------------------------------------------------------->   		 
  		 
	<%	
					if(id==5){
					Cart cart=(Cart)session.getAttribute("cart");
					if(cart==null){
						cart=new Cart();
						session.setAttribute("cart", cart);
					}
					
					if(cart.items.size()==0){
						out.println("没有任何购物项");
					}
					Customer u=(Customer)session.getAttribute("customer");
			
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>购物车</strong>/user manage</div>
     </div>
     <br>
     
     
 		<table class="table table-hover">
  			<tr class="success">
  			<th>商品名</th>
  			<th>图片</th>
  			<th>商品描述</th>
  			<th>购买数量</th>
  			<th>单项金额</th>
  			<th>操作</th>
  			</tr>
  			
    	<%
    					double sum=0;
    		    	   for(int j=0;j<cart.items.size();j++){
    	    				CartItem cartitem=cart.items.get(j);
    	    				Product p=ProductMrg.get_instance().getProductById(cartitem.getProductId());
    	    				String descr=p.getDescr();
							sum+=cartitem.getPrice();
		%>
  			<tr class="<%= color[i]%>">
  			
	    	 	<td><%=cartitem.getName() %></td>
	    	 	<td><img alt="" src="../../images/product/<%=p.getImage() %>"></td>
	    	 	<td><%=descr %></td>
	    	 	<td><%=cartitem.getCount() %></td>
	    	 	<td><%=cartitem.getTotalPrice() %></td>
	    	 	
	    	 	<td><a href="../../home/cartdel.jsp?id=<%=cartitem.getProductId()  %>">删除</a></td>
    			
    		</tr> 
		<% 
				i++;
				if(i>4){
					i=0;
				}
			}
		%> 
				
		  		</table>
		  		<center>
		  		<td><h3>总金额为：<b><%=sum %></b></h3></td>
		  		<td><h5>用户可用余额：<%=u.getCash() %></h5></td>
		  		<td><a href="customer.jsp?action=1&id=5" type="button" class="btn btn-danger btn-sm">支付下单</a></td>
		  		<br>
		  		<br>
				<%
			    		if(request.getParameter("action")!=null){
			    %>
			    		
			    		<form action="../../home/ordersubmit.jsp" method="post">
			    			<h3>收货信息确认</h3>
			    			联系人电话:<input type="text" name="telephone" value="<%=u.getTelephone() %>"><br><br>
			    			收货地址:<textarea name="address"><%=u.getAddress() %></textarea><br>
			    			<input type="hidden" name="customerid" value="<%= u.getId() %>">
			    			<input type="submit" class="btn btn-default btn-sm">
			    		</form>
			    		<br>
			    		
			    <%
			    		}
			    %>
			        	
		  		</center>
		  		
  		
  		<%
  			}
  		 %> 	




<!-- ----------------------------------------------------------------------- corder start  ---------------------------------------------------------------------------->		 
  	<%	
					if(id==8){
			
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>管理订单</strong>/user manage</div>
     </div>
     <br>
     
     
 		<table class="table table-hover">
  			<tr class="success">
  			<th>订单编号</th>
  			<th>用户ID</th>
  			<th>收货地址</th>
  			<th>订单状态</th>
  			<th>操作</th>
  			</tr>
  			
		
    	<%
			ArrayList<Order> oList=OrderMrg.getInstance().getOrdersByCustomerId(c.getId());
			Iterator<Order> it=oList.iterator();
			while(it.hasNext()){
				Order o=it.next();
				if(o.getStatus().equals("confirm")){
		%>
  		<tr class="<%= color[i]%>">
    			<td><%=o.getId() %></td>
    			<td><%= o.getCustomerid()  %></td>
    			<td><%=o.getAddress() %></td>
    			<td><%=o.getStatus() %></td>
    			<td><a href="" type="button" class="btn btn-danger btn-sm">确认收货</a></td>
    		</tr> 
		<% 
				i++;
				if(i>4){
					i=0;
				}
			}
		}
		%> 
		  		</table>
  		
  		<%
  			}
  		 %> 	 


  		 



<!-- ----------------------------------------------------------------------- worder start  ---------------------------------------------------------------------------->		 
  	<%	
					if(id==9){
			
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>管理订单</strong>/user manage</div>
     </div>
     <br>
     
     
 		<table class="table table-hover">
  			<tr class="success">
  			<th>订单编号</th>
  			<th>用户ID</th>
  			<th>收货地址</th>
  			<th>订单状态</th>
  			<th>操作</th>
  			</tr>
  			
		
    	<%
			ArrayList<Order> oList=OrderMrg.getInstance().getOrdersByCustomerId(c.getId());
			Iterator<Order> it=oList.iterator();
			while(it.hasNext()){
				Order o=it.next();
				if(o.getStatus().equals("wait")){
		%>
  		<tr class="<%= color[i]%>">
    			<td><%=o.getId() %></td>
    			<td><%= o.getCustomerid()  %></td>
    			<td><%=o.getAddress() %></td>
    			<td><%=o.getStatus() %></td>
    			<td><a href="" type="button" class="btn btn-danger btn-sm">确认收货</a></td>
    		</tr> 
		<% 
				i++;
				if(i>4){
					i=0;
				}
			}
		}
		%> 
		  		</table>
  		
  		<%
  			}
  		 %> 	 




  		 

  		 
  		 
  		 
  		 
  		 

  		 
  		 <%
  		 	if(id>0){
  		  %>
  		 

  		<center>
  		
  		<a href="admin.jsp?page=1&id=<%=id %>" type="button" class="btn btn-info btn-xs">首页</a>
  		<a href="admin.jsp?page=<%=pageCur-1 %>&id=<%=id %>" type="button" class="btn btn-success btn-xs">上一页</a>
  		<a href="admin.jsp?page=<%=pageCur+1 %>&id=<%=id %>" type="button" class="btn btn-warning btn-xs">下一页</a>
  		<a href="admin.jsp?page=<%=pageNum %>&id=<%=id %>" type="button" class="btn btn-info btn-xs">尾页</a>
  		</center>
		
		<%
			}
		 %>
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