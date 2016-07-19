<%@page import="com.taoduoduo.category.CategoryMrg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	int id=Integer.parseInt(request.getParameter("id"));
	CategoryMrg.get_instance().delCategoryById(id);
	response.setHeader("refresh", "0;url=admin.jsp?id=4");


%>