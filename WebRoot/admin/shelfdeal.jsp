保存修改<%@page import="com.taoduoduo.product.ProductMrg"%>
<%@page import="com.taoduoduo.saller.SallerMrg"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<% 
	int id=Integer.parseInt(request.getParameter("id"));
	int shelf=Integer.parseInt(request.getParameter("shelf"));
	ProductMrg.get_instance().shelfById(id, shelf);
	response.setHeader("refresh", "0;url=admin.jsp?id=3");
	
%>
