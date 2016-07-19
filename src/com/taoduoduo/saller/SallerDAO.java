package com.taoduoduo.saller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.taoduoduo.tool.DB;

public class SallerDAO {
	public boolean add(Saller a) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("insert into saller(name,password,descr) values(?,?,?)");
			stmt.setString(1, a.getName());
			stmt.setString(2, a.getPassword());
			stmt.setString(3,a.getDescr());
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}
	
	public ArrayList<Saller> getSallers(){
		Connection conn=DB.getConn();
		ArrayList<Saller> users=new ArrayList<Saller>();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from saller");
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Saller a = new Saller();
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setPassword(rs.getString("password"));
				a.setDescr(rs.getString("descr"));
				users.add(a);
			}
			return users;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}
	
	public ArrayList<Saller> getSallersByPage(int pageCur,int pageSize){
		
		Connection conn=DB.getConn();
		ArrayList<Saller> users=new ArrayList<Saller>();
		int preNum=(pageCur-1)*pageSize;
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from saller limit ?,?");
			stmt.setInt(1,preNum);
			stmt.setInt(2,pageSize);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Saller a = new Saller();
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setPassword(rs.getString("password"));
				a.setDescr(rs.getString("descr"));
				users.add(a);
			}
			return users;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean check(Saller u){
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt = conn.prepareStatement("select * from saller where name=? and password=?");
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
	
	public Saller getSallerByName(String username){
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from saller where name=?");
			stmt.setString(1, username);
			System.out.println(username);
			ResultSet rs=stmt.executeQuery();
			Saller u = new Saller();
			while(rs.next()){
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setId(rs.getInt("id"));
				u.setDescr(rs.getString("descr"));
			}
			return u;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
		
	}

	public boolean delSaller(Saller a) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("delete from saller where id=?");
			stmt.setInt(1, a.getId());
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delSallerById(int id) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("delete from saller where id=?");
			stmt.setInt(1, id);
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	public Saller getSallerById(int id) {
		Connection conn=DB.getConn();
		Saller s=new Saller();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from saller where id="+id);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				s.setName(rs.getString("name"));
				s.setPassword(rs.getString("password"));
				s.setId(rs.getInt("id"));
				s.setDescr(rs.getString("descr"));
			}
			return s;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public boolean updateSaller(Saller s) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("update saller set name=?,password=?,descr=?,cash=? where id=?");
			stmt.setString(1,s.getName());
			stmt.setString(2,s.getPassword());
			stmt.setString(3,s.getDescr());
			stmt.setInt(5,s.getId());
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}
