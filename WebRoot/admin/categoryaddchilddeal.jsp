保存修改<%@page import="com.taoduoduo.saller.SallerMrg"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*,com.taoduoduo.category.*" pageEncoding="UTF-8"%>


<% 
	Category c=new Category();
	request.setCharacterEncoding("UTF-8");
	int pid=Integer.parseInt(request.getParameter("pid"));
	c.setName(request.getParameter("name"));
	c.setPid(pid);
	if(CategoryMrg.get_instance().addChildCatetory(c.getPid(), c.getName())){
		response.setHeader("refresh", "0.15;url=admin.jsp?id=4");
	}else{
		out.println("添加失败！");
	}
	
%>
