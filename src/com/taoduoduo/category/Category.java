package com.taoduoduo.category;

public class Category {
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getIsLeaf() {
		return isLeaf;
	}
	public void setIsLeaf(int isLeaf) {
		this.isLeaf = isLeaf;
	}

	int id;
	int pid;
	String name;
	int grade;
	int isLeaf;
	int scount;
	
	
	public int getScount() {
		return scount;
	}
	public void setScount(int scount) {
		this.scount = scount;
	}

		
	
}
