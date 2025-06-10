package ListItemPackage;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import SellerPackage.SellerController;
import SellerPackage.SellerModel;

@WebServlet("/ItemEditServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  // 1MB
	    maxFileSize = 1024 * 1024 * 5,    // 5MB
	    maxRequestSize = 1024 * 1024 * 10 // 10MB
	)
public class ItemEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("edit")) {
			int itemId = Integer.parseInt(request.getParameter("id"));
			ItemModule item = ItemController.getItemsByItemId(itemId);
			request.setAttribute("item", item);
			request.getRequestDispatcher("ItemEdit.jsp").forward(request, response);
		}else if(action.equals("onadmin")) {
			int itemId = Integer.parseInt(request.getParameter("id"));
			ItemModule item = ItemController.getItemsByItemId(itemId);
			request.setAttribute("item", item);
			request.getRequestDispatcher("ItemEditAdmin.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemId= Integer.parseInt(request.getParameter("id"));
		System.out.println("print id: " + itemId);
		//int sellerId= Integer.parseInt(request.getParameter("sellerId"));
		String ItemName = request.getParameter("itemName");
		String Description = request.getParameter("description");
		Double startingBid= Double.parseDouble(request.getParameter("startingBid"));
		Date startDate = Date.valueOf(request.getParameter("startDate"));
		Date closingDate = Date.valueOf(request.getParameter("closingDate"));
		String action = request.getParameter("action");
		
		// Handle image upload
        Part imagePart = request.getPart("itemImage");
        String fileName = getSubmittedFileName(imagePart);

        if (fileName == null || fileName.isEmpty()) {
            response.getWriter().write("No image file selected.");
            return;
        }

        // Define the upload directory
        String uploadPath = getServletContext().getRealPath("/") + "itemImage";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Save the image file
        File file = new File(uploadDir, fileName);
        imagePart.write(file.getAbsolutePath());

        // Construct the relative image path for the database
        String imagePath = "itemImage/" + fileName;
		
		boolean isTrue = ItemController.updateItemDetails(itemId, ItemName, startingBid,startDate, closingDate, imagePath, Description);
		
		if((isTrue == true) && action.equals("onseller")) {
			String alertMessage = "Item is updated Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='ItemDisplayServlet?action=route'</script>");
		}
		else if((isTrue == true) && action.equals("onadmin")) {
			String alertMessage = "Item is updated Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='ItemAllDisplayServlet?action=ondashA'</script>");
		}
		else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}
	
	 // Utility method to extract the file name from the Part object
    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
    }
	
}
