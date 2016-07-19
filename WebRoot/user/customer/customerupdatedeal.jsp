<%@page import="com.taoduoduo.customer.CustomerMrg"%>
<%@page import="com.taoduoduo.customer.Customer"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	Customer c=(Customer)session.getAttribute("customer");
	Customer temp=new Customer();
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String telephone=request.getParameter("telephone");
	String address=request.getParameter("address");
	temp.setName(name);
	temp.setPassword(password);
	temp.setTelephone(telephone);
	temp.setAddress(address);
	temp.setEmail("");
	if(CustomerMrg.get_instance().updateCustomerById(temp,c.getId())){
		out.println("<script type='text/javascript'>alert('修改已保存！')</script>");
	}
	
	
	session.removeAttribute("customer");
	Customer customer=CustomerMrg.get_instance().getCustomerByName(name);
	session.setAttribute("usertype","saller");
	session.setAttribute("customer", customer);
	response.setHeader("refresh", "0;url=../../home/index.jsp");
	
%>