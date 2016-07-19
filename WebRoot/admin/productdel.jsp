<%@page import="com.taoduoduo.product.ProductMrg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%

	int id=Integer.parseInt(request.getParameter("id"));
	if(ProductMrg.get_instance().delProductById(id)){
		response.setHeader("refresh","0;url=admin.jsp?id=3");
	}
	
	
%>