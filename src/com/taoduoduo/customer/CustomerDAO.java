package com.taoduoduo.customer;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.taoduoduo.tool.DB;


/*int id;
String name;
String password;
String address;
String telephone;
int cartid;
String email;*/
public class CustomerDAO {
	public boolean add(Customer a) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("insert into customer(name,password,address,telephone,cartid,email,cash) values(?,?,?,?,?,?,?)");
			stmt.setString(1, a.getName());
			stmt.setString(2, a.getPassword());
			stmt.setString(3,a.getAddress());
			stmt.setString(4,a.getTelephone());
			stmt.setInt(5,a.getCartid());
			stmt.setString(6,a.getEmail());
			stmt.setDouble(7,a.getCash());
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}
	
	public ArrayList<Customer> getCustomers(){
		Connection conn=DB.getConn();
		ArrayList<Customer> users=new ArrayList<Customer>();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from customer");
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Customer a = new Customer();
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setPassword(rs.getString("password"));
				a.setAddress(rs.getString("address"));
				a.setTelephone(rs.getString("telephone"));
				a.setCartid(rs.getInt("cartid"));
				a.setEmail(rs.getString("email"));
				a.setCash(rs.getDouble("cash"));
				users.add(a);
			}
			return users;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}
	
	public ArrayList<Customer> getCustomersByPage(int pageCur,int pageSize){
		
		Connection conn=DB.getConn();
		ArrayList<Customer> users=new ArrayList<Customer>();
		int preNum=(pageCur-1)*pageSize;
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from customer limit ?,?");
			stmt.setInt(1,preNum);
			stmt.setInt(2,pageSize);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Customer a = new Customer();
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setPassword(rs.getString("password"));
				a.setAddress(rs.getString("address"));
				a.setTelephone(rs.getString("telephone"));
				a.setCartid(rs.getInt("cartid"));
				a.setEmail(rs.getString("email"));
				a.setCash(rs.getDouble("cash"));
				users.add(a);
			}
			return users;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean check(Customer u){
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt = conn.prepareStatement("select * from customer where name=? and password=?");
			stmt.setString(1, u.getName());
			stmt.setString(2, u.getPassword());
			ResultSet rs=stmt.executeQuery();
			if (rs.next()) {
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public Customer getCustomerByName(String username){
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from customer where name=?");
			stmt.setString(1, username);
			System.out.println(username);
			ResultSet rs=stmt.executeQuery();
			Customer u = new Customer();
			while(rs.next()){
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setId(rs.getInt("id"));
				u.setAddress(rs.getString("address"));
				u.setTelephone(rs.getString("telephone"));
				u.setCartid(rs.getInt("cartid"));
				u.setEmail(rs.getString("email"));
				u.setCash(rs.getDouble("cash"));
			}
			return u;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
	}

	public boolean delCustomer(Customer a) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("delete from customer where id=?");
			stmt.setInt(1, a.getId());
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delCustomerById(int id) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("delete from customer where id=?");
			stmt.setInt(1, id);
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	public Customer getCustomerById(int id) {
		Connection conn=DB.getConn();
		Customer s=new Customer();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from customer where id="+id);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				s.setName(rs.getString("name"));
				s.setPassword(rs.getString("password"));
				s.setId(rs.getInt("id"));
				s.setAddress(rs.getString("address"));
				s.setTelephone(rs.getString("telephone"));
				s.setCartid(rs.getInt("cartid"));
				s.setEmail(rs.getString("email"));
				s.setCash(rs.getDouble("cash"));
			}
			return s;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public boolean updateCustomerById(Customer s,int id) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("update customer set name=?,password=?,address=?,telephone=?,email=?,cash=? where id=?");
			stmt.setString(1, s.getName());
			stmt.setString(2, s.getPassword());
			stmt.setString(3,s.getAddress());
			stmt.setString(4,s.getTelephone());
			stmt.setString(5,s.getEmail());
			stmt.setDouble(6,s.getCash());
			stmt.setInt(7,id);
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	public void buyById(double cash,int id) {
		Connection conn=DB.getConn();
		Customer customer=CustomerMrg.get_instance().getCustomerById(id);
		double real=customer.getCash()-cash;
		try {
			PreparedStatement stmt=conn.prepareStatement("update  customer set cash=?   where id=?");
			stmt.setDouble(1,real);
			stmt.setInt(2,id);
			stmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}
}
