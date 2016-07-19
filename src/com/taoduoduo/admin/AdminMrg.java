package com.taoduoduo.admin;

import java.util.ArrayList;


public class AdminMrg {
	private static  AdminMrg am=null;
	private static AdminDAO dao=null;
	
	static{
		if (am==null) {
			am=new AdminMrg();
		}
		if(dao==null){
			dao=new AdminDAO();
		}
	}
	
	public static AdminMrg get_instance() {
		return am;
	}
	
	
	public boolean save(Admin a) {
		return dao.save(a);
		
	}
	
	public ArrayList<Admin> getAdmins(){
		return dao.getAdmins();
		
	}
	
	public ArrayList<Admin> getAdminsByPage(int pageCur,int pageSize){
		return dao.getAdminsByPage(pageCur,pageSize);	
	}

	
	public boolean check(Admin u){
			return dao.check(u);
	}
	
	public Admin getAdminByName(String username){
			return dao.getUserByUsername(username);
	}
	
	
	
	public boolean delAdmin(Admin a){
		return dao.delAdmin(a);
	}
	
	public boolean delAdminById(int id) {
		return dao.delAdminById(id);
	}
	

}
