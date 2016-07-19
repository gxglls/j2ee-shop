package com.taoduoduo.cart;

import java.util.ArrayList;


public class Cart {
	
	public ArrayList<CartItem> items=new ArrayList<CartItem>();
	
	public void add(CartItem item){
		for(int i=0;i<items.size();i++){
			if(item.getProductId()==items.get(i).getProductId()){
				items.get(i).setCount(items.get(i).getCount()+1);
				return;
			}
		}
		items.add(item);
	}
	
	
	public boolean del(int id){
		for(int i=0;i<items.size();i++){
			if(id==items.get(i).getProductId()){
				items.remove(i);
				return true;
			}
		}
		return false;
	}
	
	public double getTotalPrice(){
		double temp=0;
		for(int i=0;i<items.size();i++){
			temp+=items.get(i).getTotalPrice();
		}
		return temp;
	}
	
}
