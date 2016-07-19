package com.taoduoduo.product;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.taoduoduo.tool.DB;

public class ProductDAO {
	public boolean add(Product a) {
		Connection conn = DB.getConn();
		try {
			PreparedStatement stmt = conn
					.prepareStatement("insert into product(categoryid,name,price,descr,stock,shelf,image,time,sallerid) values(?,?,?,?,?,?,?,?,?)");
			stmt.setInt(1, a.getCategoryid());
			stmt.setString(2, a.getName());
			stmt.setDouble(3, a.getPrice());
			stmt.setString(4, a.getDescr());
			stmt.setInt(5, a.getStock());
			stmt.setInt(6, a.getShelf());
			stmt.setString(7, a.getImage());
			stmt.setString(8, a.getTime());
			stmt.setInt(9, a.getSallerid());
			;
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}

	}

	public ArrayList<Product> getProducts() {
		Connection conn = DB.getConn();
		ArrayList<Product> users = new ArrayList<Product>();
		try {
			PreparedStatement stmt = conn
					.prepareStatement("select * from product");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Product a = new Product();
				a.setId(rs.getInt("id"));
				a.setCategoryid(rs.getInt("categoryid"));
				a.setName(rs.getString("name"));
				a.setPrice(rs.getDouble("price"));
				a.setDescr(rs.getString("descr"));
				a.setStock(rs.getInt("stock"));
				a.setShelf(rs.getInt("shelf"));
				a.setImage(rs.getString("image"));
				a.setTime(rs.getString("time"));
				a.setSallerid(rs.getInt("sallerid"));
				users.add(a);
			}
			return users;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

	public ArrayList<Product> findProducts(int[] categoryId, String keyWord,
			double lowNormalPrice, double highNormalPrice) {

		ArrayList<Product> temp = new ArrayList<Product>();
		try {
			Connection conn = DB.getConn();
			String sql = "select * from product where 1=1";

			// Àà±ð
			if (categoryId.length > 0) {
				if (categoryId[0] == 0) {
					;
				} else {
					String back = "";
					for (int i = 0; i < categoryId.length; i++) {
						if (i < categoryId.length - 1) {
							back += categoryId[i] + ",";
						} else {
							back += categoryId[i];
						}
					}
					sql += " and categoryid in (" + back + ") ";
				}

			}

			// ¹Ø¼ü×Ö
			if (keyWord != null && !keyWord.trim().equals("")) {
				sql += " and name like '%" + keyWord + "%' or descr like '%"
						+ keyWord + "%'";
			}

			if (lowNormalPrice > 0) {
				sql += " and price >" + lowNormalPrice;
			}

			if (highNormalPrice > 0) {
				sql += " and price <" + highNormalPrice;
			}
			
			
			System.out.println(sql);
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Product c = new Product();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPrice(rs.getDouble("price"));
				c.setCategoryid(rs.getInt("categoryid"));
				c.setImage(rs.getString("image"));
				c.setShelf(rs.getInt("shelf"));
				c.setStock(rs.getInt("stock"));
				temp.add(c);
			}
			return temp;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

	public ArrayList<Product> getProductsByPage(int pageCur, int pageSize) {

		Connection conn = DB.getConn();
		ArrayList<Product> users = new ArrayList<Product>();
		int preNum = (pageCur - 1) * pageSize;
		try {
			PreparedStatement stmt = conn
					.prepareStatement("select * from product limit ?,?");
			stmt.setInt(1, preNum);
			stmt.setInt(2, pageSize);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Product a = new Product();
				a.setId(rs.getInt("id"));
				a.setCategoryid(rs.getInt("categoryid"));
				a.setName(rs.getString("name"));
				a.setPrice(rs.getDouble("price"));
				a.setDescr(rs.getString("descr"));
				a.setStock(rs.getInt("stock"));
				a.setShelf(rs.getInt("shelf"));
				a.setImage(rs.getString("image"));
				a.setTime(rs.getString("time"));
				a.setSallerid(rs.getInt("sallerid"));
				users.add(a);
			}
			return users;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public Product getProductByName(String username) {
		Connection conn = DB.getConn();
		try {
			PreparedStatement stmt = conn
					.prepareStatement("select * from product where name=?");
			stmt.setString(1, username);
			System.out.println(username);
			ResultSet rs = stmt.executeQuery();
			Product a = new Product();
			while (rs.next()) {
				a.setName(rs.getString("name"));
				a.setCategoryid(rs.getInt("categoryid"));
				a.setName(rs.getString("name"));
				a.setPrice(rs.getDouble("price"));
				a.setDescr(rs.getString("descr"));
				a.setStock(rs.getInt("stock"));
				a.setShelf(rs.getInt("shelf"));
				a.setImage(rs.getString("image"));
				a.setTime(rs.getString("time"));
				a.setSallerid(rs.getInt("sallerid"));
			}
			return a;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

	public boolean delProduct(Product a) {
		Connection conn = DB.getConn();
		try {
			PreparedStatement stmt = conn
					.prepareStatement("delete from product where id=?");
			stmt.setInt(1, a.getId());
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	public boolean delProductById(int id) {
		Connection conn = DB.getConn();
		try {
			PreparedStatement stmt = conn.prepareStatement("delete from product where id=?");
			stmt.setInt(1, id);
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	public Product getProductById(int id) {
		Connection conn = DB.getConn();
		Product a = new Product();
		try {
			PreparedStatement stmt = conn
					.prepareStatement("select * from product where id=" + id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setCategoryid(rs.getInt("categoryid"));
				a.setName(rs.getString("name"));
				a.setPrice(rs.getDouble("price"));
				a.setDescr(rs.getString("descr"));
				a.setStock(rs.getInt("stock"));
				a.setShelf(rs.getInt("shelf"));
				a.setImage(rs.getString("image"));
				a.setTime(rs.getString("time"));
				a.setSallerid(rs.getInt("sallerid"));
			}
			return a;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public boolean updateProduct(Product a) {
		Connection conn = DB.getConn();
		try {
			PreparedStatement stmt = conn
					.prepareStatement("update product set categoryid=?,name=?,price=?,descr=?,stock=?,shelf=?,image=?,time=? where id=?");
			stmt.setInt(1, a.getCategoryid());
			stmt.setString(2, a.getName());
			stmt.setDouble(3, a.getPrice());
			stmt.setString(4, a.getDescr());
			stmt.setInt(5, a.getStock());
			stmt.setInt(6, a.getShelf());
			stmt.setString(7, a.getImage());
			stmt.setString(8, a.getTime());
			stmt.setInt(9, a.getSallerid());
			;
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	public ArrayList<Product> getProductsByCategoryId(int categoryid) {
		Connection conn = DB.getConn();
		ArrayList<Product> users = new ArrayList<Product>();
		try {
			PreparedStatement stmt = conn
					.prepareStatement("select * from product where categoryid=?");
			stmt.setInt(1, categoryid);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Product a = new Product();
				a.setId(rs.getInt("id"));
				a.setCategoryid(rs.getInt("categoryid"));
				a.setName(rs.getString("name"));
				a.setPrice(rs.getDouble("price"));
				a.setDescr(rs.getString("descr"));
				a.setStock(rs.getInt("stock"));
				a.setShelf(rs.getInt("shelf"));
				a.setImage(rs.getString("image"));
				a.setTime(rs.getString("time"));
				a.setSallerid(rs.getInt("sallerid"));
				users.add(a);
			}
			return users;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}

	public boolean shelfById(int id, int shelf) {
		Connection conn = DB.getConn();
		try {
			PreparedStatement stmt = conn
					.prepareStatement("update product set shelf=? where id=?");
			stmt.setInt(1, shelf);
			stmt.setInt(2, id);
			stmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}

	}
}
