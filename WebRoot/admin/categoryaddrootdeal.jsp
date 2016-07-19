保存修改<%@page import="com.taoduoduo.saller.SallerMrg"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*,com.taoduoduo.category.*" pageEncoding="UTF-8"%>


<% 
	Category c=new Category();
	request.setCharacterEncoding("UTF-8");
	c.setName(request.getParameter("name"));
	if(CategoryMrg.get_instance().add(c)){
		response.setHeader("refresh", "0.15;url=admin.jsp?id=4");
	}else{
		out.println("添加失败！");
	}
	
%>
