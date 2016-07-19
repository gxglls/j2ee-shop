package com.taoduoduo.tool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Page {
	public static int getPage(String table,int pageSize){  //获得总页数
		int i=0;
		try {
			Connection conn=DB.getConn();
			PreparedStatement stmt=conn.prepareStatement("select * from "+table);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				i++;
			}
			if(i<=pageSize){
				return 1;
			}else{
				return (int)Math.ceil(i/pageSize)+1;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}
	}
}