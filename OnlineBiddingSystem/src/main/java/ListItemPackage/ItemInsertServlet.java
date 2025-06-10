package ListItemPackage;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import SellerPackage.SellerModel;

@WebServlet("/ItemInsertServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1MB
    maxFileSize = 1024 * 1024 * 5,    // 5MB
    maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class ItemInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        HttpSession session = request.getSession(false); 
        
        if(action.equals("newList")) {
			SellerModel seller = (SellerModel) session.getAttribute("seller");
			request.setAttribute("seller_", seller);
			request.getRequestDispatcher("ItemInsert.jsp").forward(request, response);
        }
    	
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sellerId = Integer.parseInt(request.getParameter("sid"));
        System.out.println(sellerId);
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        double startingBid = Double.parseDouble(request.getParameter("startingBid"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date closingDate = Date.valueOf(request.getParameter("closingDate"));

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

        // Insert item data into the database
        boolean result = ItemController.inserItemData(sellerId, itemName, startingBid, closingDate, startDate, imagePath, description);

        if (result) {
        	String alertMessage = "Item added successfully!";
            String redirectUrl = "ItemDisplayServlet?action=oninsert&seller_id=" + sellerId;
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='" + redirectUrl + "';</script>");
        } else {
            response.getWriter().write("Failed to add auction item.");
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
