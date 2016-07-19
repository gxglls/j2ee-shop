package com.taoduoduo.category;

import java.util.ArrayList;

public class CategoryMrg {
	
	private static  CategoryMrg am=null;
	private static CategoryDAO dao=null;
	
	static{
		if (am==null) {
			am=new CategoryMrg();
		}
		if(dao==null){
			dao=new CategoryDAO();
		}
	}
	
	
	public static CategoryMrg get_instance() {
		return am;
	}
	
	
	public boolean add(Category c){
		return dao.add(c);
	}
	
	
	public  void getCategories(ArrayList<Category> list,int id){
		dao.getCategories(list,id);
	}
	

	public   boolean addChildCatetory(int pid,String name) {
		// TODO Auto-generated method stub
			return dao.addChildCatetory(pid,name);
	}

	public   Category loadById(int id) {
		// TODO Auto-generated method stub
		return dao.loadById(id);
	}
	
	public int getIdByName(String name){
		return dao.getIdByName(name);
	}
	
	public boolean delCategoryById(int id) {
		return dao.delCategoryById(id);
	}
	
	public Category getCategoryByName(String name){
		return dao.getCategoryByName(name);
	}
	

}
