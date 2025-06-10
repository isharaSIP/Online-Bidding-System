package buyerpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


public class buyercontrol {
	
	
	//database connection
	

	private static final String DB_URL ="jdbc:mysql://localhost:3306/bidding_system_db";
	private static final String DB_USER ="root";
	private static final String DB_PASSWORD ="8856";

		static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		
		catch(Exception e){
			System.err.println("MySQL JDBC Driver not found.");
			 e.printStackTrace();
		}
		
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    System.out.println("MySQL JDBC Driver loaded successfully.");
		} catch (ClassNotFoundException e) {
		    System.out.println("MySQL JDBC Driver not found.");
		    e.printStackTrace();
		}

		
		}



public static boolean insertRegister(String name,String email,String pwd,String phoneNumber) {
	
	String sql="insert into buyer(name,phoneNumber,pwd,email) values (?,?,?,?)";
	
	  try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)){
	    	
    	  
	    	try(PreparedStatement checkstmt = connection.prepareStatement(sql)) {
	    		
	    		checkstmt.setString(1,name);
	    		checkstmt.setString(2,phoneNumber);
	    		checkstmt.setString(3,pwd);
	    		checkstmt.setString(4,email);
	    		
	    		return checkstmt.executeUpdate() > 0;
	    		
	    	}
	    	
	
	  }
	  catch(Exception e) {
		  e.printStackTrace();
		  return false;
	  }
		  
	  }


//Login Validate 
public static List<buyermodel> loginValidate(String username, String password) {
    String sql = "SELECT * FROM buyer WHERE name = ? AND pwd = ?";
    ArrayList<buyermodel> buyer = new ArrayList<>();

    try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
         PreparedStatement pstmt = connection.prepareStatement(sql)) {

        pstmt.setString(1, username);
        pstmt.setString(2, password);

        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String phoneNumber = rs.getString("phoneNumber");
                String pwd = rs.getString("pwd");
                String email = rs.getString("email");

                buyer.add(new buyermodel(id, name, email, pwd, phoneNumber));
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return buyer;
}

			



public static boolean checkEmail(String email) {
	
	String sql="select count(id) as em from buyer where email=?";
	
	try(Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	PreparedStatement checkstmt = connection.prepareStatement(sql)){
		
		checkstmt.setString(1,email);
		
		try(ResultSet rs=checkstmt.executeQuery()){
			
		
			if(rs.next()) {
				int buyerid=rs.getInt("em");
				System.out.println(buyerid);
				return buyerid>0;
				
			}
			else
				return false;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return false;		
}

public static boolean updatePwd(String password,String email) {
	
	String sql="update buyer set pwd=? where email=?";
	
	try(Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			
			PreparedStatement checkstmt = connection.prepareStatement(sql)){
				
				checkstmt.setString(1,password);
				checkstmt.setString(2,email);
				
				int rowsAffected=checkstmt.executeUpdate();
					
				
					return rowsAffected>0;
				
				
			}
				catch(Exception e) {
				e.printStackTrace();
			}
				return false;		
		}
	
		//retrive all data from buyer
public static List<buyermodel> getAllBid(){
List<buyermodel> buyers = new ArrayList<>();
String selectQuery = "SELECT * FROM buyer";

try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
     PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)){
	
		
    try( ResultSet resultSet = preparedStatement.executeQuery()){

    while (resultSet.next()) {
        buyermodel buyer =new buyermodel();
        // Assuming 'payment_id' is the column name for the primary key
        buyer.setId(resultSet.getInt("id")); // Assuming the column is payment_id
        buyer.setName(resultSet.getString("name"));
        buyer.setEmail(resultSet.getString("email"));
        buyer.setPhoneNumber(resultSet.getString("phonenumber"));
        buyer.setPwd(resultSet.getString("pwd"));
        buyers.add(buyer);
       
    }

}
}catch (SQLException e) {
    System.err.println("Database error: " + e.getMessage());
}
return buyers;
}



//update buyer profile

public static boolean updateBuyerProfile(int id,String name,String email,String pwd,String phonenumber) {
	
	String update="update buyer set name = ?,email = ?,phonenumber = ?,pwd = ? where id = ?";
	
	try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    PreparedStatement preparedStatement = connection.prepareStatement(update)) {
	
		    preparedStatement.setString(1,name);
            preparedStatement.setString(2,email);
            preparedStatement.setString(3,phonenumber);
            preparedStatement.setString(4,pwd);
            preparedStatement.setInt(5,id);
           
           

            return preparedStatement.executeUpdate() > 0;
	}
     
    catch (SQLException e) {
         System.err.println("Database error: " + e.getMessage());
         return false;
     }
 
    }

//delete buyer profile


public static boolean deletedata(int id) {
	
	String deletesql="delete from buyer where id= ?";
	

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
         



}
	
	



		
		



