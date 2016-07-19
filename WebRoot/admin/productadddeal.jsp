保存修改<%@page import="com.taoduoduo.category.CategoryMrg"%>
<%@page import="com.taoduoduo.product.Product"%>
<%@page import="com.taoduoduo.saller.Saller"%>
<%@page import="com.taoduoduo.saller.SallerMrg"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*,com.taoduoduo.*" pageEncoding="UTF-8"%>


<% 
	request.setCharacterEncoding("UTF-8");
	Product s=new Product();
	s.setName(request.getParameter("name"));
	String realname=request.getParameter("realname");
	s.setCategoryid(CategoryMrg.get_instance().getIdByName(realname));
	s.setPrice(Double.parseDouble(request.getParameter("price")));
	s.setDescr(request.getParameter("descr"));
	s.setStock(Integer.parseInt(request.getParameter("stock")));
	s.setShelf(0);
	/* s.setImage(); */
	s.setTime(request.getParameter("time"));
	
	
/* 	if(){
		out.println("<script type='text/javascript'>alert('修改成功!');</script>");
		response.setHeader("refresh", "1;url=admin.jsp?id=2");
	}else{
		out.println("删除失败！");
	} */
	
%>
