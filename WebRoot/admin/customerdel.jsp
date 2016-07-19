保存修改<%@page import="com.taoduoduo.customer.*"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<% 
	if(CustomerMrg.get_instance().delCustomerById(Integer.parseInt(request.getParameter("id")))){
		response.setHeader("refresh", "0.15;url=admin.jsp?id=2");
	}else{
		out.println("删除失败！");
	}
	
%>
