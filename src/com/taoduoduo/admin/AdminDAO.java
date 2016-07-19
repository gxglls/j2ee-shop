package com.taoduoduo.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.taoduoduo.tool.DB;

public class AdminDAO {
	public boolean save(Admin a) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("insert into admin(name,password) values(?,?)");
			stmt.setString(1, a.getName());
			stmt.setString(2, a.getPassword());
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}
	
	public ArrayList<Admin> getAdmins(){
		Connection conn=DB.getConn();
		ArrayList<Admin> users=new ArrayList<Admin>();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from admin");
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Admin a = new Admin();
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setPassword(rs.getString("password"));
				users.add(a);
			}
			return users;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}
	
	public ArrayList<Admin> getAdminsByPage(int pageCur,int pageSize){
		
		Connection conn=DB.getConn();
		ArrayList<Admin> users=new ArrayList<Admin>();
		int preNum=(pageCur-1)*pageSize;
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from admin limit ?,?");
			stmt.setInt(1,preNum);
			stmt.setInt(2,pageSize);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Admin a = new Admin();
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setPassword(rs.getString("password"));
				users.add(a);
			}
			return users;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean check(Admin u){
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt = conn.prepareStatement("select * from admin where name=? and password=?");
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
	
	public Admin getUserByUsername(String username){
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from admin where name=?");
			stmt.setString(1, username);
			System.out.println(username);
			ResultSet rs=stmt.executeQuery();
			Admin u = new Admin();
			while(rs.next()){
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));				
			}
			return u;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
	}

	public boolean delAdmin(Admin a) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("delete from admin where id=?");
			stmt.setInt(1, a.getId());
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delAdminById(int id) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("delete from admin where id=?");
			stmt.setInt(1, id);
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}
