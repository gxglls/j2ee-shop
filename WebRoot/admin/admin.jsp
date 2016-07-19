<%@page import="com.taoduoduo.category.Category"%>
<%@page import="com.taoduoduo.customer.*"%>
<%@page import="com.taoduoduo.saller.Saller"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page import="org.jfree.chart.ChartFactory, 
org.jfree.chart.JFreeChart, 
org.jfree.chart.plot.PlotOrientation, 
org.jfree.chart.servlet.ServletUtilities, 
org.jfree.data.category.CategoryDataset, 
org.jfree.data.general.DatasetUtilities"%>
<%@ page language="java" import="java.util.*,com.taoduoduo.order.*,com.taoduoduo.admin.*,com.taoduoduo.saller.*,com.taoduoduo.category.*,com.taoduoduo.product.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//analysis 11
//search 10
//orderdetail 7
//ordercat 6
//cart 5
//product cat 3
%>


<%
	int PAGE_SIZE=8;
	
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
		pageNum=Page.getPage("product", PAGE_SIZE);
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
<!-- ---------------------------------搜索处理---------------------------------------------------->
<%
	String action=request.getParameter("action");
	ProductMrg pm_s=ProductMrg.get_instance();
	
	ArrayList<Category> c_s=new ArrayList<Category>();
	CategoryMrg.get_instance().getCategories(c_s, -1);
	String keyWord=null;
	Double lowNormalPrice=0.0;
	Double highNormalPrice=999999.0;
	
	Iterator<Category> it_s=c_s.iterator();
	
	ArrayList<Product> plist_s=null;
	if(action!=null){

	//取到类别id和关键字
		int [] categoryId_s=new int[1];
		keyWord=request.getParameter("keyword");
		categoryId_s[0]=Integer.parseInt(request.getParameter("categoryid"));
		
	//取到价格范围
		if(request.getParameter("lownormalprice")!=null&&!request.getParameter("lownormalprice").trim().equals("")){
			lowNormalPrice=Double.parseDouble(request.getParameter("lownormalprice"));
		}
		if(request.getParameter("highnormalprice")!=null&&!request.getParameter("highnormalprice").trim().equals("")){
			highNormalPrice=Double.parseDouble(request.getParameter("highnormalprice"));
		}
	
	
		plist_s=pm_s.findProducts(categoryId_s, keyWord, lowNormalPrice, highNormalPrice);
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
       
       
        <li class="admin-parent">用户管理<a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="admin.jsp?id=1" class="am-cf">卖家管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="admin.jsp?id=2"><span class="am-icon-puzzle-piece"></span>买家管理</a></li>
          </ul>
        </li>
        

        <li class="admin-parent">商品管理<a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                  <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="admin.jsp?id=3" class="am-cf"><span class="am-icon-check"></span>所有商品<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
             <li><a href="admin.jsp?id=4" class="am-cf"><span class="am-icon-check"></span>商品类别管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          <li><a href="admin.jsp?id=6" class="am-cf"><span class="am-icon-check"></span>订单管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          <li><a href="admin.jsp?id=10" class="am-cf"><span class="am-icon-check"></span>产品搜索<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          <li><a href="admin.jsp?id=11" class="am-cf"><span class="am-icon-check"></span>销量分析<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
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


<script type="text/javascript">
  function showInfo(descr){
    document.getElementById("productInfo").innerHTML=descr;
  }
  </script>




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
        <div class="am-fl am-cf"><strong>管理买家</strong>/user manage</div>
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
  			<th>操作</th>
  			</tr>
  			
    	<%
			ArrayList<Product> products=ProductMrg.get_instance().getProductsByPage(pageCur, PAGE_SIZE);
    		Iterator<Product> it=products.iterator();
    		
    		while(it.hasNext()){
    			Product u= it.next();
    			Category cate=CategoryMrg.get_instance().loadById(u.getCategoryid());
		%>
  			<tr class="<%= color[i]%>">
  			
    			<td><%=u.getId() %></td>
    			<td><%=cate.getName() %></td>
    			<td><%=u.getName() %></td>
    			<td><%=u.getDescr() %></td>
    			<td><%=u.getStock() %></td>
    			<td><%=u.getShelf() %></td>
    			<td><img src="../images/product/<%= u.getImage() %>"></td>
				<td><a href="shelfdeal.jsp?shelf=1&id=<%=u.getId() %>" type="button" class="btn btn-info btn-sm">上架</a></td>
				<td><a href="shelfdeal.jsp?shelf=0&id=<%=u.getId() %>" type="button" class="btn btn-info btn-sm">下架</a></td>
				<td><a href="productdel.jsp?id=<%=u.getId() %>" type="button" class="btn btn-warning btn-sm">删除</a></td>
    			
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
  		 
  <!-- ----------------------------------------------------------------------- ordercat start  ---------------------------------------------------------------------------->		 
  	<%	
					if(id==6){
			
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
  			<th>订单详情</th>
  			<th>确认发货</th>
  			<th>操作</th>
  			</tr>
  			
		
    	<%
			ArrayList<Order> oList=OrderMrg.getInstance().getOrders();
			Iterator<Order> it=oList.iterator();
			while(it.hasNext()){
				Order o=it.next();
		%>
  		<tr class="<%= color[i]%>">
    			<td><%=o.getId() %></td>
    			<td><%= o.getCustomerid()  %></td>
    			<td><%=o.getAddress() %></td>
    			<td><%=o.getStatus() %></td>
    			<td><a href="admin.jsp?id=7&orderid=<%=o.getId()%>" type="button" class="btn btn-warning btn-sm">订单详情</a></td>
    			<td><a href="orderdeal.jsp?id=<%=o.getId()%>&deal=c" type="button" class="btn btn-success btn-sm">确认</a></td>
    			<td><a href="orderdeal.jsp?id=<%=o.getId()%>&deal=a" type="button" class="btn btn-danger btn-sm">作废</a></td>
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
  		 
 
   		<!-- ----------------------------------------------------------------------- orerdetail start  ----------------------------------------------------------------------------> 
  	<%	
					if(id==7){
			
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>订单详情</strong>/user manage</div>
     </div>
     <br>
     
     
 		<table class="table table-hover">
  			<tr>
  			<th>商品名称</th>
  			<th>所属订单号</th>
  			<th>数量</th>
  			<th>图片</th>
  			<th>产品总价</th>
  			</tr>
  			
    	<%
    		int orderId=Integer.parseInt(request.getParameter("orderid"));
			ArrayList<OrderItem> oList=OrderMrg.getInstance().getOrderItemsByOrderId(orderId);
      		ProductMrg pm=ProductMrg.get_instance();
			Iterator<OrderItem> it=oList.iterator();
			while(it.hasNext()){
				OrderItem o=it.next();
				Product p=pm.getProductById(o.getProductid());
		%>
		
  		<tr class="<%= color[i]%>"  onmouseover="showInfo('<%= p.getDescr()%>')" > 
  		
  				<td><%=p.getName() %></td>
    			<td><%=o.getOrderid() %></td>
    			<td><%=o.getNum()  %></td>
    			<td><img src="../images/product/<%= p.getImage() %>"></td>
    			<td><%=o.getUnitprice() %></td>

    	</tr> 
		<% 
				i++;
				if(i>4){
					i=0;
				}
			}
		%> 


		  		</table>
		<div style="width: 400px">
          <blockquote>
  			<p id="productInfo"></p>
  			<footer>famous in <cite title="Source Title">淘多多</cite></footer>
		</blockquote>
      </div>
  		
  		<%
  			}
  		 %> 	
 
 
  
   <!-- ----------------------------------------------------------------------- search start  ----------------------------------------------------------------------------> 
  	<%	
					if(id==10){
	%>
	
	<div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong>产品搜索</strong>/user manage</div>
     </div>
     <br>
     

  		<form action="admin.jsp?id=10" method="post">
   		  	<input type="hidden" name="action" value="simplesearch">
			  		<label for="category">类别</label>
			  		<select name="categoryid"  class="form-control" id="category"  >
						<option value="0">all</option>
						<%
							while(it_s.hasNext()){
								Category temp_s=it_s.next();
								String preStr="";
								for(int k=0;k<temp_s.getGrade();k++){
									preStr+="--";
								}
								%>
								<option value="<%=temp_s.getId()%>"><%=preStr+temp_s.getName() %></option>
								<%
								
							}
						 %>
					</select>

			<div class="form-group">
				<label for="keyword">关键字</label>
				<input type="text" name="keyword" id="keyword" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="lownormalprice">最低价</label>
				<input type="text" name="lownormalprice" id="lownormalprice" class="form-control">
			</div>

			<div class="form-group">
				<label for="highnormalprice">最高价</label>
				<input type="text" name="highnormalprice" id="highnormalprice" class="form-control">
			</div>

  		  	<input type="submit" value="搜搜搜" >

  		</form>
  		
	 	<table class="table table-hover">
  			<tr class='<%=color[i] %>'>
  			<th>商品编号</th>
  			<th>商品名</th>
  			<th>图片</th>
  			<th>商品描述</th>
  			<th>商品价格</th>
  			<th>库存</th>
  			<th>是否上架</th>
  			<th>操作</th>
  			<th>操作</th>
  			<th>操作</th>
  			</tr>
  			
    	<%
    	if(plist_s!=null){
    		Iterator<Product> it1=plist_s.iterator();
    		CategoryMrg category_s=CategoryMrg.get_instance();
    		while(it1.hasNext()){
    			Product c1= it1.next();
		%>
  		<tr>
    			<td><%=c1.getId() %></td>
    			<td><%=c1.getName() %></td>
    			<td><img src="../images/product/<%= c1.getImage() %>"></td>
    			<td><%=c1.getDescr() %></td>
    			<td><%=c1.getPrice() %></td>
    			<td><%=c1.getStock() %></td>
    			<td><%=c1.getShelf() %></td>
				<td><a href="shelfdeal.jsp?shelf=1&id=<%=c1.getId() %>" type="button" class="btn btn-info btn-sm">上架</a></td>
				<td><a href="shelfdeal.jsp?shelf=0&id=<%=c1.getId() %>" type="button" class="btn btn-info btn-sm">下架</a></td>
				<td><a href="productdel.jsp?id=<%=c1.getId() %>>" type="button" class="btn btn-warning btn-sm">删除</a></td>
    		</tr> 
		<% 
			}
			
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
  		 
  		 
  <!-- ----------------------------------------------------------------------- analysis start  ----------------------------------------------------------------------------> 
   	<%	
				if(id==11){
				ArrayList<Category> list_a=new ArrayList<Category>();
				CategoryMrg cm=CategoryMrg.get_instance();
				cm.getCategories(list_a, -1);
				for(int t=0;t<list_a.size();t++){
					if(list_a.get(t).getGrade()>0){
						list_a.remove(t);
					}
				}
				Iterator it_a=list_a.iterator();
				
	%>
	<% 

				double[][] data =new double[][] {{cm.getCategoryByName("bread").getScount(), cm.getCategoryByName("phone").getScount(),cm.getCategoryByName("child").getScount()}, 
				{cm.getCategoryByName("milk").getScount(), cm.getCategoryByName("camera").getScount(),cm.getCategoryByName("computer").getScount()},{cm.getCategoryByName("cookie").getScount(), cm.getCategoryByName("pad").getScount(),cm.getCategoryByName("story").getScount()}}; 
				
				String[] rowKeys = {"第一子类", "第二子类","第三子类" };
				
				String[] columnKeys = {"food", "digit", "book"}; 
				
			CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys, columnKeys, data); 
			JFreeChart chart = ChartFactory.createBarChart3D("淘多多网站销量图", 
			"type", 
			"amount", 
			dataset, 
			PlotOrientation.VERTICAL, 
			true, 
			false, 
			false); 
			
			String filename = ServletUtilities.saveChartAsPNG(chart, 1080, 540, null, session); 
			String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename; 
	%> 
						<center><img src="<%= graphURL %>" width=1080 height=540 border=0 usemap="#<%= filename %>"></center>

	<%
		}
	 %>












				<!-- -------------------------------------------------- page ---------------------------------------- -->	 
  		 
  		 <%
  		 	if(id>0&&id!=11){
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