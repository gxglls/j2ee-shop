package com.taoduoduo.product;

import java.util.ArrayList;


public class ProductMrg {
	private static  ProductMrg pm=null;
	private static ProductDAO dao=null;
	
	static{
		if (pm==null) {
			pm=new ProductMrg();
		}
		if(dao==null){
			dao=new ProductDAO();
		}
	}
	
	public static ProductMrg get_instance() {
		return pm;
	}
	
	
	public boolean add(Product a) {
		return dao.add(a);
		
	}
	
	public ArrayList<Product> getProducts(){
		return dao.getProducts();
	}
	
	public ArrayList<Product> getProductsByCategoryId(int Categoryid){
		return dao.getProductsByCategoryId(Categoryid);
	}
	
	public ArrayList<Product> getProductsByPage(int pageCur,int pageSize){
		return dao.getProductsByPage(pageCur,pageSize);	
	}

	
	
	public Product getProductByName(String username){
			return dao.getProductByName(username);
	}
	
	public Product getProductById(int id){
			return dao.getProductById(id);
		
	}
	
	
	
	public boolean delProduct(Product a){
		return dao.delProduct(a);
	}
	
	public boolean delProductById(int id) {
		return dao.delProductById(id);
	}
	
	public boolean updateProduct(Product s){
		return dao.updateProduct(s);
	}
	
	public boolean shelfById(int id,int shelf) {
		return dao.shelfById(id,shelf);
	}
	
	public ArrayList<Product> findProducts(int[] categoryId, String keyWord,
			double lowNormalPrice, double highNormalPrice){
		return dao.findProducts(categoryId,keyWord,lowNormalPrice,highNormalPrice);
	}
	

}
