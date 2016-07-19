保存修改<%@page import="com.taoduoduo.saller.Saller"%>
<%@page import="com.taoduoduo.saller.SallerMrg"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<% 
	Saller s=new Saller();
	s.setId(Integer.parseInt(request.getParameter("id")));
	s.setName(request.getParameter("username"));
	s.setPassword(request.getParameter("password"));
	s.setDescr(request.getParameter("descr"));
	
	if(SallerMrg.get_instance().updateSaller(s)){
		out.println("<script type='text/javascript'>alert('修改成功!');</script>");
		response.setHeader("refresh", "1;url=admin.jsp?id=2");
	}else{
		out.println("删除失败！");
	}
	
%>
