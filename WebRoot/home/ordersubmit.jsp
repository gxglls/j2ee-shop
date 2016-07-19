<%@ page language="java" import="java.util.*,com.taoduoduo.cart.*,com.taoduoduo.order.*" pageEncoding="UTF-8"%>

<%
	Cart c=(Cart)session.getAttribute("cart");
 %>

<%
	Order o=new Order();
	OrderMrg om=OrderMrg.getInstance();
	o.setAddress(request.getParameter("address"));
	o.setCustomerid(Integer.parseInt(request.getParameter("customerid")));
	if(om.add(o,c)){
		out.println("成功提交!");
		session.removeAttribute("cart");
		response.setHeader("refresh", "1;url=../index.jsp");
	}else{
		out.println("提交失败!");
		response.setHeader("refresh", "1;url=../customer/customer.jsp?id=5");
	}
 %>
