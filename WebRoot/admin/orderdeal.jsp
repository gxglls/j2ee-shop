<%@ page language="java" import="java.util.*,com.taoduoduo.order.*" pageEncoding="UTF-8"%>

<%
	int orderId=Integer.parseInt(request.getParameter("id"));
	
	if(request.getParameter("deal").equals("c")){
		OrderMrg.getInstance().orderConfirm(orderId);
	}else{
		OrderMrg.getInstance().orderAbort(orderId);
	}
	response.setHeader("refresh", "0;url=admin.jsp?id=6");
 %>
