<%@ page language="java" import="java.util.*,com.taoduoduo.saller.*,com.taoduoduo.customer.*" pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("utf-8");
	String temp=request.getParameter("radio");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	if(temp.equals("saller")){
		Saller s=new Saller();
		s.setName(name);
		s.setPassword(password);
		if(SallerMrg.get_instance().add(s)){
			out.println("<script type='text/javascript'>alert('欢迎新卖家！注册成功！')</script>");
		}else{
			out.println("注册失败");
		}
	}else{
		Customer s=new Customer();
		s.setName(name);
		s.setPassword(password);
		s.setCash(2000.0);
		if(CustomerMrg.get_instance().add(s)){
			out.println("<script type='text/javascript'>alert('欢迎新买家！注册成功！')</script>");
		}else{
			out.println("注册失败");
		}
	}
	response.setHeader("refresh", "0;url=../login/login.jsp");
%>