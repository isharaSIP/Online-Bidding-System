package buyerpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import online_bid.BidControl;


@WebServlet("/deleteBuyerServlet")
public class deleteBuyerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int ID=Integer.parseInt(request.getParameter("id"));
	
		try{
			boolean deleteans=buyercontrol.deletedata(ID);
			
			if(deleteans)
				response.sendRedirect("bidhomepage.jsp");
			else {
				
				String alertMessage = "Data didn't delete unsuccessfully";
			response.setContentType("text/html");
			response.getWriter().println(
			    "<div style='padding:15px; background-color:red; color:white; font-weight:bold; " +
			    "border-radius:5px; width:fit-content; margin:20px auto; text-align:center;'>" +
			    alertMessage + "</div>" +
			    "<script>" +
			    "setTimeout(function() {" +
			    "  window.location.href='histroy.jsp';" +
			    "}, 2500);" +  // Redirect after 2 seconds
			    "</script>"
			);
			}	
		}
		catch(Exception e) {
			
			e.getMessage();
			
		}
              
}
}
