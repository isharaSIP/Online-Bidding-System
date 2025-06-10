package online_bid;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import online_bid.bidmodel;


public class BidControl {


		//database connection details
		

	private static final String DB_URL ="jdbc:mysql://localhost:3306/bidding_system_db";
	private static final String DB_USER ="root";
	private static final String DB_PASSWORD ="8856";

		static {
		
		
		
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    System.out.println("MySQL JDBC Driver loaded successfully.");
		} catch (ClassNotFoundException e) {
		    System.out.println("MySQL JDBC Driver not found.");
		    e.printStackTrace();
		}

		
		}
		



//insert to database

public static boolean insertdata(int buyerid, String name,BigDecimal price,String item) {
	
	String condition="select MAX(price) as max_price from bidauction where item=?";
	String insertsql="INSERT INTO bidauction(buyerid,name,price,item) VALUES (?, ?, ?, ?)";


    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)){
    	
    	  
    	try(PreparedStatement checkstmt = connection.prepareStatement(condition)) {
    		
    		checkstmt.setString(1,item);
    	
         ResultSet rs =checkstmt.executeQuery();
    	
         if (rs.next()) {
             BigDecimal currentMax = rs.getBigDecimal("max_price");
             if (currentMax != null && price.compareTo(currentMax) <= 0) {
                 // New bid is not higher than current max
                 return false;
             }
         }
         
    	}
    
         
    	try(PreparedStatement preparedStatement = connection.prepareStatement(insertsql)) {
    	 preparedStatement.setInt(1, buyerid);
         preparedStatement.setString(2,name);
         preparedStatement.setBigDecimal(3,price);
         preparedStatement.setString(4,item);
        
         return preparedStatement.executeUpdate() > 0;
    }
    }
    
    catch(Exception e) {
	e.printStackTrace();
	return false;
    }
}




//delete bid
public static boolean deletedata(int id) {
	
	String deletesql="delete from bidauction where id= ?";
	

    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
         PreparedStatement preparedStatement = connection.prepareStatement(deletesql)) {
    	
    	 preparedStatement.setInt(1,id);
         return preparedStatement.executeUpdate() > 0;

     } 
    catch (SQLException e) {
         System.err.println("Database error: " + e.getMessage());
         return false;
     }
 
    }
         
	
//read all bids


// Method to retrieve all payments from the database
public static List<bidmodel> getAllBid(int byerid) {
List<bidmodel> bids = new ArrayList<>();
String selectQuery = "SELECT * FROM bidauction where buyerid=?";

try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
     PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
		preparedStatement.setInt(1,byerid);
		
    try( ResultSet resultSet = preparedStatement.executeQuery()){

    while (resultSet.next()) {
        bidmodel bid =new bidmodel();
        // Assuming 'payment_id' is the column name for the primary key
        bid.setId(resultSet.getInt("id")); // Assuming the column is payment_id
        bid.setName(resultSet.getString("name"));
        bid.setPrice(resultSet.getBigDecimal("price"));
        bid.setItem(resultSet.getString("item"));
        bids.add(bid);
       
    }

}
}catch (SQLException e) {
    System.err.println("Database error: " + e.getMessage());
}
return bids;
}




//update bid
public static boolean updatedata(String id,String name,BigDecimal price,String item) {
	
	String condition="select MAX(price) as max_price from bidauction where item=?";
	String update="update bidauction set price = ? where id = ?";
	
	
	try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)){
		
		try(PreparedStatement checkstmt = connection.prepareStatement(condition)) {
    		
    		checkstmt.setString(1,item);
    	
         ResultSet rs =checkstmt.executeQuery();
    	
         if (rs.next()) {
             BigDecimal currentMax = rs.getBigDecimal("max_price");
             System.out.println(currentMax);
             if (currentMax != null && price.compareTo(currentMax) <= 0) {
            	 System.out.println("hi");
                 // New bid is not higher than current max
                 return false;
             }
         }
         
    	}
		
		
	try(PreparedStatement preparedStatement = connection.prepareStatement(update)) {

            preparedStatement.setBigDecimal(1,price);
            preparedStatement.setString(2,id);
            System.out.println(id);
              int rowUpdated=preparedStatement.executeUpdate();
              System.out.println(rowUpdated);
            return rowUpdated > 0;
	}
	}
    catch (SQLException e) {
         System.err.println("Database error: " + e.getMessage());
         return false;
     }
 
         
}
}


	




















