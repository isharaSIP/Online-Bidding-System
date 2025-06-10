package SellerPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SellerController {

	//Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Insert Data Function
	public static boolean insertSeller(String name, String nic, String province, String district, String mobile, String email, String password) {
		boolean isSuccess = false;
		try {
			//DB Connection call
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			String sql = "insert into seller values(0,'"+name+"', '"+nic+"', '"+province+"', '"+district+"', '"+mobile+"', '"+email+"', '"+password+"')";
			int rs = stmt.executeUpdate(sql);
			if(rs >0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//Login Validate
	public static List<SellerModel> loginValidate(String email, String password){
		
		ArrayList<SellerModel> seller = new ArrayList<>();
		
		try {
			//DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//Sql query
			String sql = "select * from seller where " + "email= '"+email+"' and password= '"+password+"' ";
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String nic = rs.getString(3);
				String province = rs.getString(4);
				String district = rs.getString(5);
				String mobile = rs.getString(6);
				String semail = rs.getString(7);
				String pass = rs.getString(8);
				
				SellerModel se = new SellerModel(id, name, nic, province, district, mobile, semail, pass);
				seller.add(se);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return seller;
		
	}
	
	//display user
	public static List<SellerModel> sellerProfile (String Id){
				
		int convertID = Integer.parseInt(Id);
				
		ArrayList<SellerModel> seller = new ArrayList<>();
				
		try {
			//DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
					
			//SQL Query
			String sql = "select * from seller where id = '"+convertID+"'";
					
			rs = stmt.executeQuery(sql);
					
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String nic = rs.getString(3);
				String province = rs.getString(4);
				String district = rs.getString(5);
				String mobile = rs.getString(6);
				String semail = rs.getString(7);
				String pass = rs.getString(8);
						
				SellerModel se = new SellerModel(id, name, nic, province, district, mobile, semail, pass);
				seller.add(se);
			}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return seller;
		}
	
	//GetById
	public static  List<SellerModel> getById (String Id){
		int convertedID = Integer.parseInt(Id);
		
		ArrayList<SellerModel> seller = new ArrayList<>();
		
		try {
			//DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from seller where id = '"+convertedID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String nic = rs.getString(3);
				String province = rs.getString(4);
				String district = rs.getString(5);
				String mobile = rs.getString(6);
				String semail = rs.getString(7);
				String pass = rs.getString(8);
				
				SellerModel us = new SellerModel(id, name, nic, province, district, mobile, semail, pass);
				seller.add(us);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return seller;
	}
	
			//Seller Profile Update
			public static boolean updateSeller(String id, String name, String nic, String province, String district, String mobile, String email, String password) {
				try {
					//DBConnection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					//SQL Query
					String sql = "update seller set name='"+name+"', nic='"+nic+"', province='"+province+"', district='"+district+"', mobile='"+mobile+"' , email='"+email+"', password='"+password+"' "+ "where id = '"+id+"'";
					
					int rs = stmt.executeUpdate(sql);
					
					if(rs >0) {
						isSuccess = true;
					}
					else {
						isSuccess = false;

					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return isSuccess;
			}
			
			//Delete Seller
			public static boolean deleteseller(String id) {
				int convID = Integer.parseInt(id);
				
				try {
					//DB Connection
					con = DBConnection.getConnection();
					stmt = con.createStatement();
					
					//Sql Query
					String sql = "delete from seller where id = '"+convID+"' ";
					
					int rs = stmt.executeUpdate(sql);
					
					if(rs >0) {
						isSuccess = true;
					}
					else {
						isSuccess = false;

					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return isSuccess;
			}
			
			//GetAllData
			public static List<SellerModel> getAllSellers(){
			    ArrayList<SellerModel> sellers = new ArrayList<>();

			    try {
			        con = DBConnection.getConnection();
			        stmt = con.createStatement();
			        String sql = "SELECT * FROM seller";
			        rs = stmt.executeQuery(sql);

			        while(rs.next()) {
			            int id = rs.getInt(1);
			            String name = rs.getString(2);
			            String nic = rs.getString(3);
			            String province = rs.getString(4);
			            String district = rs.getString(5);
			            String mobile = rs.getString(6);
			            String email = rs.getString(7);
			            String password = rs.getString(8);

			            SellerModel seller = new SellerModel(id, name, nic, province, district, mobile, email, password);
			            sellers.add(seller);
			        }
			    } catch (Exception e) {
			        e.printStackTrace();
			    }

			    return sellers;
			}
			
			//Get Seller Count
			public static int getSellerCount() {
			    int count = 0;
			    try {
			        con = DBConnection.getConnection();
			        stmt = con.createStatement();
			        String sql = "SELECT COUNT(*) FROM seller";
			        rs = stmt.executeQuery(sql);
			        if (rs.next()) {
			            count = rs.getInt(1);
			        }
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			    return count;
			}


			//search function
			public static List<SellerModel> getSellersByProvince(String province) {
				  ArrayList<SellerModel> sellers = new ArrayList<>();

				  try {
				    con = DBConnection.getConnection();
				    stmt = con.createStatement();
				    String sql = "SELECT * FROM seller WHERE province LIKE '%" + province + "%'";
				    rs = stmt.executeQuery(sql);

				    while (rs.next()) {
				      int id = rs.getInt(1);
				      String name = rs.getString(2);
				      String nic = rs.getString(3);
				      String prov = rs.getString(4);
				      String district = rs.getString(5);
				      String mobile = rs.getString(6);
				      String email = rs.getString(7);
				      String pass = rs.getString(8);

				      sellers.add(new SellerModel(id, name, nic, prov, district, mobile, email, pass));
				    }
				  } catch (Exception e) {
				    e.printStackTrace();
				  }

				  return sellers;
				}

			


}
