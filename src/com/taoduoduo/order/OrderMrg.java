package com.taoduoduo.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.taoduoduo.cart.*;
import com.taoduoduo.tool.DB;

public class OrderMrg {
	
	static OrderMrg om=null;
	static OrderDAO dao=null;
	static{
		if(om==null){
			om=new OrderMrg();
		}
		if(dao==null){
			dao=new OrderDAO();
		}
	}
	
	public static OrderMrg getInstance() {
		return om;
	}
	
	public boolean add(Order o,Cart c){
		return dao.add(o,c);
	}
	
	public ArrayList<Order> getOrders(){
		return dao.getOrders();
	}
	
	public ArrayList<OrderItem> getOrderItemsByOrderId(int id){
		return dao.getOrderItemsByOrderId(id);
	}
	
	public boolean orderConfirm(int id){
		return dao.orderConfirm(id);
	}
	
	public boolean orderAbort(int id){
		return dao.orderAbort(id);
	}
	
	public ArrayList<Order> getOrdersByCustomerId(int customerid) {
		return dao.getOrdersByCustomerId(customerid);
	}
	
	public int getMostCategoryidByCustomerIdFromOrderItem(int customerid) {
		return dao.getMostCategoryidByCustomerIdFromOrderItem(customerid);
	}
}
