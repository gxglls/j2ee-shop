<%@ page language="java" import="java.util.*,com.taoduoduo.saller.*,com.taoduoduo.customer.*" pageEncoding="UTF-8"%>

<%
	String temp=request.getParameter("usertype");
	
	if(temp.equals("saller")){
		session.removeAttribute("saller");
	}else{
		session.removeAttribute("customer");
	}
	response.setHeader("refresh", "0;url=login.jsp");

%>