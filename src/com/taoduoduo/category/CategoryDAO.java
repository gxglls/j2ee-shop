package com.taoduoduo.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.taoduoduo.tool.*;

public class CategoryDAO {
	
	public boolean add(Category c){
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("insert into category(pid,name,grade,isleaf,scount) values(?,?,?,?,?)");
			stmt.setInt(1, -1);
			stmt.setString(2, c.getName());
			stmt.setInt(3, 0);
			stmt.setInt(4, 1);
			stmt.setInt(5,0);
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	public  void getCategories(ArrayList<Category> list,int id){
		try {
			Connection conn=DB.getConn();
			getCategoriesReal(conn,list,id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	public   void getCategoriesReal(Connection conn,ArrayList<Category> list,int id){
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from category where pid="+id);
			ResultSet rs=stmt.executeQuery();
			while (rs.next()) {
				Category c=new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setGrade(rs.getInt("grade"));
				c.setPid(rs.getInt("Pid"));
				c.setIsLeaf(rs.getInt("isleaf")==0?0:1);
				list.add(c);
				if(c.getIsLeaf()==0){
					getCategories(list, c.getId());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Category getCategoryByName(String name){
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from category where name=?");
			stmt.setString(1,name);
			ResultSet rs=stmt.executeQuery();
			Category c=new Category();
			while (rs.next()) {
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setGrade(rs.getInt("grade"));
				c.setPid(rs.getInt("Pid"));
				c.setIsLeaf(rs.getInt("isleaf")==0?0:1);
				c.setScount(rs.getInt("scount"));
			}
			return c;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public boolean delCategoryById(int id) {
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("delete  from category where id=?");
			stmt.setInt(1,id);
			stmt.executeUpdate();
			return true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	
	

	public   boolean addChildCatetory(int pid,String name) {
		// TODO Auto-generated method stub
		Connection conn=DB.getConn();
		try {
			//存储新的category
			ResultSet rs=conn.prepareStatement("select * from category where id="+pid).executeQuery();
			rs.next();
			int parentGrade=rs.getInt("grade");
			PreparedStatement stmt=conn.prepareStatement("insert into category(pid,name,grade,isleaf,scount) values(?,?,?,?,?)");
			stmt.setInt(1, pid);
			stmt.setString(2, name);
			stmt.setInt(3,parentGrade+1 );
			stmt.setInt(4, 1);
			stmt.setInt(5,0);
			stmt.executeUpdate();

			//更新父节点，设为非叶子节点
			conn.prepareStatement("update category set isleaf=0 where id="+pid).executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	


	public   Category loadById(int id) {
		// TODO Auto-generated method stub
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("select * from category where id="+id);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				Category c=new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setPid(rs.getInt("Pid"));
				c.setIsLeaf(rs.getInt("isleaf")==0?0:1);
				c.setGrade(rs.getInt("grade"));
				return c;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public int getIdByName(String name) {
		// TODO Auto-generated method stub
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("select * from category where name=?");
			stmt.setString(1,name);
			ResultSet rs=stmt.executeQuery();
			Category c=new Category();
			while(rs.next()){
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setPid(rs.getInt("Pid"));
				c.setIsLeaf(rs.getInt("isleaf")==0?0:1);
				c.setGrade(rs.getInt("grade"));
			}
			return c.getId();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}
		
	}
	
/*	public   ResultSet getRs(){
		Connection conn=DB.getConn();
		try {
			PreparedStatement stmt=conn.prepareStatement("select * from category");
			return stmt.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		
	}*/
}
