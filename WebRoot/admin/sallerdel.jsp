保存修改<%@page import="com.taoduoduo.saller.SallerMrg"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<% 
	if(SallerMrg.get_instance().delSallerById(Integer.parseInt(request.getParameter("id")))){
		response.setHeader("refresh", "0.15;url=admin.jsp?id=1");
	}else{
		out.println("删除失败！");
	}
	
%>
