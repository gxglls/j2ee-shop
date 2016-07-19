package com.taoduoduo.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import com.mysql.jdbc.Statement;
import com.taoduoduo.cart.*;
import com.taoduoduo.tool.*;
import com.taoduoduo.product.*;


public class OrderDAO {
	
	public boolean add(Order o,Cart c) {
		try {
			
			int orderId=-1;
			//插入订单表
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("insert into orders(customerid,address,status) values(?,?,?)",Statement.RETURN_GENERATED_KEYS);//做一个能获取自动增长键值的准备
			stmt.setInt(1, o.getCustomerid());
			stmt.setString(2, o.getAddress());
			stmt.setString(3, "wait");
			stmt.executeUpdate();
			ResultSet rs=stmt.getGeneratedKeys();
			rs.next();
			orderId=rs.getInt(1);
			
			//插入订单详情表
			Iterator<CartItem> ci=c.items.iterator();
			PreparedStatement stmtDetail=conn.prepareStatement("insert into orderitem(productid,unitprice,num,orderid,customerid,categoryid) values(?,?,?,?,?,?)");
			//思考，要找productid去哪找？  来源有两个，一是页面提交的，二是直接去产品条目实例找，显然第二种方便，  要仔细思考数据本质上存在哪。
			while(ci.hasNext()){
				CartItem temp=ci.next();
				stmtDetail.setInt(1, temp.getProductId());
				stmtDetail.setDouble(2, temp.getTotalPrice());
				stmtDetail.setInt(3, temp.getCount());
				stmtDetail.setInt(4, orderId);
				stmtDetail.setInt(5,o.getCustomerid());
				stmtDetail.setInt(6,ProductMrg.get_instance().getProductById(temp.getProductId()).getCategoryid());
				stmtDetail.executeUpdate();
			}
			
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public ArrayList<Order> getOrders(){
		ArrayList<Order> temp=new ArrayList<Order>();
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("select * from orders");
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Order o=new Order();
				o.setAddress(rs.getString("address"));
				o.setStatus(rs.getString("status"));
				o.setCustomerid(rs.getInt("customerid"));
				o.setId(rs.getInt("id"));
				temp.add(o);
			}
			return temp;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	public ArrayList<OrderItem> getOrderItemsByOrderId(int id){
		ArrayList<OrderItem> temp=new ArrayList<OrderItem>();
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("select * from orderitem where orderid=?");
			stmt.setInt(1,id);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				OrderItem o=new OrderItem();
				o.setId(rs.getInt("id"));
				o.setProductid(rs.getInt("productid"));
				o.setUnitprice(rs.getDouble("unitprice"));
				o.setNum(rs.getInt("num"));
				o.setOrderid(rs.getInt("orderid"));
				o.setCustomerid(rs.getInt("customerid"));
				temp.add(o);
			}
			return temp;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	public ArrayList<Order> getOrdersByCustomerId(int customerid) {
		ArrayList<Order> temp=new ArrayList<Order>();
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("select * from orders where customerid=?");
			stmt.setInt(1,customerid);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Order o=new Order();
				o.setAddress(rs.getString("address"));
				o.setStatus(rs.getString("status"));
				o.setCustomerid(rs.getInt("customerid"));
				o.setId(rs.getInt("id"));
				temp.add(o);
			}
			return temp;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	
	public int getMostCategoryidByCustomerIdFromOrderItem(int customerid) {
		Connection conn=DB.getConn();
		try {
			int temp=0;
			PreparedStatement stmt=conn.prepareStatement("select categoryid,count(*) from orderitem where customerid=? group by categoryid");
			stmt.setInt(1,customerid);
			ResultSet rs=stmt.executeQuery();
			rs.next();
			temp=rs.getInt("categoryid");
			return temp;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}
	

	public boolean orderConfirm(int id) {
		// TODO Auto-generated method stub
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("update orders set status='confirm' where id=?");
			stmt.setInt(1,id);
			stmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean orderAbort(int id) {
		// TODO Auto-generated method stub
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("update orders set status='abort' where id=?");
			stmt.setInt(1,id);
			stmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}