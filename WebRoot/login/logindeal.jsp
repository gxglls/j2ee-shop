<%@ page language="java" import="java.util.*,com.taoduoduo.saller.*,com.taoduoduo.customer.*,com.taoduoduo.product.*" pageEncoding="UTF-8"%>

<%
	String temp=request.getParameter("radio");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	
	if(temp.equals("saller")){
		
		Saller u=new Saller();
		u.setName(name);
		u.setPassword(password);
		if(SallerMrg.get_instance().check(u)){
			Saller saller=SallerMrg.get_instance().getSallerByName(name);
			session.setAttribute("name", name);
			session.setAttribute("usertype","saller");
			session.setAttribute("saller", saller);
			response.setHeader("refresh", "0;url=../home/index.jsp");
		}else{
			out.println("<script type='text/javascript'>alert('账号名/密码有误！')</script>");
		}
	}else{
		Customer u=new Customer();
		u.setName(name);
		u.setPassword(password);
		if(CustomerMrg.get_instance().check(u)){
			Customer customer = CustomerMrg.get_instance().getCustomerByName(name);
			session.setAttribute("name", name);
			session.setAttribute("usertype","customer");
			session.setAttribute("customer", customer);
			

			response.setHeader("refresh", "0;url=../home/index.jsp");
		}else{
			out.println("<script type='text/javascript'>alert('账号名/密码有误！')</script>");
		}
	}


%>