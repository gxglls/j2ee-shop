package com.taoduoduo.customer;

import java.util.ArrayList;


public class CustomerMrg {
	private static  CustomerMrg cm=null;
	private static CustomerDAO dao=null;
	
	static{
		if (cm==null) {
			cm=new CustomerMrg();
		}
		if(dao==null){
			dao=new CustomerDAO();
		}
	}
	
	public static CustomerMrg get_instance() {
		return cm;
	}
	
	
	public boolean add(Customer a) {
		return dao.add(a);
		
	}
	
	public ArrayList<Customer> getCustomers(){
		return dao.getCustomers();
		
	}
	
	public ArrayList<Customer> getCustomersByPage(int pageCur,int pageSize){
		return dao.getCustomersByPage(pageCur,pageSize);	
	}

	
	public boolean check(Customer u){
			return dao.check(u);
	}
	
	public Customer getCustomerByName(String username){
			return dao.getCustomerByName(username);
	}
	
	public Customer getCustomerById(int id){
			return dao.getCustomerById(id);
		
	}
	
	
	
	public boolean delCustomer(Customer a){
		return dao.delCustomer(a);
	}
	
	public boolean delCustomerById(int id) {
		return dao.delCustomerById(id);
	}
	
	public boolean updateCustomerById(Customer s,int id){
		return dao.updateCustomerById(s,id);
	}
	
	public void buyById(double cash,int id){
		dao.buyById(cash,id);
	}
	

}
