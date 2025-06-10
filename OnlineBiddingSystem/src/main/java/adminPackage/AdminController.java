package adminPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminController {

	//Connect DB
	private static boolean isSucess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
		
	//Insert Data Function 
	public static boolean insertdata(String firstName, String lastName, String username, String password, String hometown) {
	    boolean isSuccess = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        con = DBConnection.getConnection();
	        String sql = "INSERT INTO admin (id, firstName, lastName, username, password, hometown) VALUES (?, ?, ?, ?, ?, ?)";
	        pstmt = con.prepareStatement(sql);

	        pstmt.setInt(1, 0); // assuming id is auto-incremented
	        pstmt.setString(2, firstName);
	        pstmt.setString(3, lastName);
	        pstmt.setString(4, username);
	        pstmt.setString(5, password);
	        pstmt.setString(6, hometown);

	        int rowsAffected = pstmt.executeUpdate();

	        if (rowsAffected > 0) {
	            isSuccess = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Optionally close resources
	    }
	    return isSuccess;
	}
		
		//Login Validate 
		public static List<AdminModel>loginValidate(String username, String password){
	
			ArrayList<AdminModel> admin = new ArrayList<>();
			try {	
				//DB CONNECTION CALL
				con=DBConnection.getConnection();
				stmt=con.createStatement();
				
				String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					int id = rs.getInt(1);
					String firstName = rs.getString(2);
					String lastName = rs.getString(3);
					String Username = rs.getString(4);
					String Password = rs.getString(5);
					String hometown = rs.getString(6);

					AdminModel u = new AdminModel(id, firstName, lastName, Username, Password, hometown);	
					admin.add(u);
							
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return admin;
		}
		
		public static List<AdminModel> AdminProfile(String Id) {
		    int convertID = Integer.parseInt(Id);
		    ArrayList<AdminModel> admin = new ArrayList<>();
		    
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;

		    try {
		        con = DBConnection.getConnection();
		        String sql = "SELECT * FROM admin WHERE id = ?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, convertID);
		        rs = pstmt.executeQuery();

		        if (rs.next()) {
		            int id = rs.getInt(1);
		            String firstName = rs.getString(2);
		            String lastName = rs.getString(3);
		            String username = rs.getString(4);
		            String password = rs.getString(5);
		            String hometown = rs.getString(6);

		            AdminModel u = new AdminModel(id, firstName, lastName, username, password, hometown);
		            admin.add(u);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        // Close resources if needed
		    }
		    return admin;
		}
		
		//User Profile Update 	
		public static boolean updateprofile(String id, String firstName, String lastName, String username, String password, String hometown) {
		    boolean isSuccess = false;
		    Connection con = null;
		    PreparedStatement pstmt = null;

		    try {
		        con = DBConnection.getConnection();
		        String sql = "UPDATE admin SET firstName=?, lastName=?, username=?, password=?, hometown=? WHERE id=?";
		        pstmt = con.prepareStatement(sql);

		        // Set parameters
		        pstmt.setString(1, firstName);
		        pstmt.setString(2, lastName);
		        pstmt.setString(3, username);
		        pstmt.setString(4, password);
		        pstmt.setString(5, hometown);
		        pstmt.setString(6, id); // Make sure id is passed as string or convert accordingly

		        int rowsAffected = pstmt.executeUpdate();

		        if (rowsAffected > 0) {
		            isSuccess = true;
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        // Optionally close resources
		    }

		    return isSuccess;
		}
		
		//GetById function
		public static List<AdminModel> getById(String Id) {
		    int convertedID = Integer.parseInt(Id);
		    ArrayList<AdminModel> admin = new ArrayList<>();

		    Connection con = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;

		    try {
		        con = DBConnection.getConnection();
		        String sql = "SELECT * FROM admin WHERE id = ?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, convertedID);
		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		            int id = rs.getInt(1);
		            String firstName = rs.getString(2);
		            String lastName = rs.getString(3);
		            String username = rs.getString(4);
		            String password = rs.getString(5);
		            String hometown = rs.getString(6);

		            AdminModel ad = new AdminModel(id, firstName, lastName, username, password, hometown);
		            admin.add(ad);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        // Close resources if needed
		    }
		    return admin;
		}	
		
		public static List<AdminModel> getAllAdmins() {
		    ArrayList<AdminModel> admins = new ArrayList<>();
		    try {
		        con = DBConnection.getConnection();
		        stmt = con.createStatement();
		        String sql = "SELECT * FROM admin";
		        rs = stmt.executeQuery(sql);

		        while (rs.next()) {
		            int id = rs.getInt(1);
		            String firstName = rs.getString(2);
		            String lastName = rs.getString(3);
		            String username = rs.getString(4);
		            String password = rs.getString(5);
		            String hometown = rs.getString(6);

		            AdminModel admin = new AdminModel(id, firstName, lastName, username, password, hometown);
		            admins.add(admin);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return admins;
		}
		
		public static boolean deleteAdmin(String id) {
		    boolean isSuccess = false;
		    Connection con = null;
		    PreparedStatement pstmt = null;

		    try {
		        con = DBConnection.getConnection();
		        String sql = "DELETE FROM admin WHERE id = ?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, id);

		        int rowsAffected = pstmt.executeUpdate();

		        if (rowsAffected > 0) {
		            isSuccess = true;
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        // Optionally close resources
		    }
		    return isSuccess;
		}
		
		
}
