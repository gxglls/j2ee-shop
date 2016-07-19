保存修改<%@page import="com.taoduoduo.customer.*"%>
<%@page import="com.taoduoduo.saller.SallerMrg"%>
<%@page import="com.taoduoduo.tool.Page"%>
<%@page import="com.taoduoduo.admin.AdminMrg"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
	Customer s = new Customer();
	s.setId(Integer.parseInt(request.getParameter("id")));
	s.setName(request.getParameter("username"));
	s.setPassword(request.getParameter("password"));
	s.setAddress(request.getParameter("address"));
	s.setTelephone(request.getParameter("telephone"));
	/* s.setCartid(Integer.parseInt(request.getParameter("cartid"))); */
	s.setEmail(request.getParameter("email"));

	if (CustomerMrg.get_instance().updateCustomerById(s,Integer.parseInt(request.getParameter("id")))) {
		out.println("<script type='text/javascript'>alert('修改成功!');</script>");
		response.setHeader("refresh", "1;url=admin.jsp?id=1");
	} else {
		out.println("删除失败！");
	}
%>
