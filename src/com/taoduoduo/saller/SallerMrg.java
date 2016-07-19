package com.taoduoduo.saller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.taoduoduo.tool.DB;


public class SallerMrg {
	private static  SallerMrg am=null;
	private static SallerDAO dao=null;
	
	static{
		if (am==null) {
			am=new SallerMrg();
		}
		if(dao==null){
			dao=new SallerDAO();
		}
	}
	
	public static SallerMrg get_instance() {
		return am;
	}
	
	
	public boolean add(Saller a) {
		return dao.add(a);
		
	}
	
	public ArrayList<Saller> getSallers(){
		return dao.getSallers();
		
	}
	
	public ArrayList<Saller> getSallersByPage(int pageCur,int pageSize){
		return dao.getSallersByPage(pageCur,pageSize);	
	}

	
	public boolean check(Saller u){
			return dao.check(u);
	}
	
	public Saller getSallerByName(String username){
			return dao.getSallerByName(username);
	}
	
	public Saller getSallerById(int id){
			return dao.getSallerById(id);
		
	}
	
	
	
	public boolean delSaller(Saller a){
		return dao.delSaller(a);
	}
	
	public boolean delSallerById(int id) {
		return dao.delSallerById(id);
	}
	
	public boolean updateSaller(Saller s){
		return dao.updateSaller(s);
	}
	

}
