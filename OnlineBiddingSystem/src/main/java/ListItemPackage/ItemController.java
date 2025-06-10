package ListItemPackage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ItemController {
	//Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean inserItemData(int sellerId, String itemName, double startingBid,Date closingDate , Date startDate , String itemImagePath, String description) {
		boolean isSuccess = false;
		try {
			// DB connection call
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			// SQL Query
			String sql = "INSERT INTO item (id, seller_id, item_name, starting_bid, closing_date, start_date, item_image_path, description) "
				    +  "VALUES (0, '" + sellerId + "', '" + itemName + "', '" + startingBid + "', '" + closingDate + "', '" + startDate + "', '" + itemImagePath + "', '" + description + "')";

			int rowsAffected = stmt.executeUpdate(sql);
			// Check if the query was successful
			if (rowsAffected > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<ItemModule> getItemsBySellerId(int sellerId) {
	    List<ItemModule> itemList = new ArrayList<>();
	    
	    try {
	    	
	    	//DB connection call
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			//Query
	        String sql = "SELECT * FROM item WHERE seller_id ='"+sellerId+"'";
	      
	         rs = stmt.executeQuery(sql);
	     
	        while (rs.next()) {
	                int id = rs.getInt("id");
	                int sid = rs.getInt("seller_id");
	                String name = rs.getString("item_name");
	                double sprice = rs.getDouble("starting_bid");
	                Date cDate = rs.getDate("closing_date");
	                Date sDate = rs.getDate("start_date");
	                String ipath = rs.getString("item_image_path");
	                String discription = rs.getString("description");
	                
	                ItemModule rItem = new ItemModule(id, sid, name, sprice, cDate, sDate, ipath, discription);
	                itemList.add(rItem);
	                } 
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return itemList;
	}
	
	//Delete item by item id
	public static boolean deleteByItemId(int ID) {
		
		try {
			//DB connection call
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			String sql = "delete from item where id='"+ID+"'";
			
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//Get item details by item id
	public static ItemModule getItemsByItemId(int itemId) {
		
		ItemModule rItem = null;
		
		try {
			//DB connection call
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			String sql = "select * from item where id='"+itemId+"'";
			
			rs = stmt.executeQuery(sql);
			
			 if (rs.next()) { // Move the cursor to the first row
		            int id = rs.getInt("id");
		            int sid = rs.getInt("seller_id");
		            String name = rs.getString("item_name");
		            double sprice = rs.getDouble("starting_bid");
		            Date cDate = rs.getDate("closing_date");
		            Date sDate = rs.getDate("start_date");
		            String ipath = rs.getString("item_image_path");
		            String discription = rs.getString("description");

		            rItem = new ItemModule(id, sid, name, sprice, cDate, sDate, ipath, discription);
		        }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rItem;
	}
	
	//update item by item id
	public static boolean updateItemDetails(int ItemId, String itemName, double startingBid,Date startDate, Date closingDate, String itemImagePath, String description) {
		try {
			//DB Connection
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			
			//Sql query
			String sql = "UPDATE item SET item_name='" + itemName + 
		             "', starting_bid='" + startingBid + 
		             "', closing_date='" + closingDate + 
		             "', start_date='" + startDate + 
		             "', item_image_path='" + itemImagePath + 
		             "', description='" + description + 
		             "' WHERE id='" + ItemId + "'";
			
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//Show all items in item table
	public static List<ItemModule> getAllItems(){
			
			ArrayList <ItemModule> itemList = new ArrayList<>();
			
			try {
				
				//DB connection call
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				//Query
				String sql = "select * from item";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt("id");
		            int sid = rs.getInt("seller_id");
		            String name = rs.getString("item_name");
		            double sprice = rs.getDouble("starting_bid");
		            Date cDate = rs.getDate("closing_date");
		            Date sDate = rs.getDate("start_date");
		            String ipath = rs.getString("item_image_path");
		            String discription = rs.getString("description");
					
					ItemModule Ilist = new ItemModule(id, sid, name, sprice, cDate, sDate, ipath, discription);
					itemList.add(Ilist);
					
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			return itemList;
		}
}
