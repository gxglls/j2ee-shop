package com.taoduoduo.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class DB {
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private DB(){
		
	}
	
	public static Connection getConn() {
		Connection conn=null;
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/taoduoduo?user=root&password=root");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void closeConn(Connection conn){
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn=null;
		}
	}
	
	public static Statement getStat(Connection conn) {
		Statement stmt=null;
		try {
			stmt=(Statement) conn.createStatement();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return stmt;
		
	}
	public static void closeStmt(Statement stmt){
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			stmt=null;
		}
	}
	
	public static PreparedStatement getPStmt(Connection conn,String sql){
		PreparedStatement pStmt=null;
		try {
			pStmt=conn.prepareStatement(sql);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pStmt;
	}
	
	public static ResultSet executeQuery(Statement stmt,String sql){
		ResultSet rs=null;
		try {
			rs=stmt.executeQuery(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rs;
	}
	public static void closeResultSet(ResultSet rs){
		try {
			if(rs!=null){
				rs.close();
				rs=null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
