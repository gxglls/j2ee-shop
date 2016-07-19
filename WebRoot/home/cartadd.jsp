<%@page import="com.taoduoduo.product.ProductMrg"%>
<%@page import="com.taoduoduo.product.Product"%>
<%@ page language="java" import="java.util.*,com.taoduoduo.cart.*" pageEncoding="UTF-8"%>


<%
	Cart cart=(Cart)session.getAttribute("cart");
	if(cart==null){
		cart=new Cart();
		session.setAttribute("cart", cart);
	}
%>

<%
	
	int id=Integer.parseInt(request.getParameter("id"));
	Product p = ProductMrg.get_instance().getProductById(id);
	CartItem item=new CartItem();
	item.setProductId(p.getId());
	item.setPrice(p.getPrice());
	item.setCount(1);
	item.setName(p.getName());
	cart.add(item);
	out.println("<script type='text/javascript'>alert('加入购物车成功!');</script>");
	response.setHeader("refresh", "0;url=productinfo.jsp?id="+id);
	
 %>
