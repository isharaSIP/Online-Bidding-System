package online_bid;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


	@WebServlet("/BidInsertServelt")
	public class BidInsertServelt extends HttpServlet {
		private static final long serialVersionUID = 1L;
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
			String name=request.getParameter("name");
			BigDecimal price = new BigDecimal(request.getParameter("price"));
			String item=request.getParameter("item");
			int buyerid = Integer.parseInt(request.getParameter("buyerid"));
			
			try {
			
			boolean insert=BidControl.insertdata(buyerid, name,price,item);
		    
			if(insert)
				response.sendRedirect("buyerDashboard.jsp");
				
			else {
                    

				String alertMessage = "Data Insert failed";
				response.setContentType("text/html");
				response.getWriter().println(
				    "<div style='padding:15px; background-color:red; color:white; font-weight:bold; " +
				    "border-radius:5px; width:fit-content; margin:20px auto; text-align:center;'>" +
				    alertMessage + "</div>" +
				    "<script>" +
				    "setTimeout(function() {" +
				    "  window.location.href='bidhomepage.jsp';" +
				    "}, 2500);" +  // Redirect after 2 seconds
				    "</script>"
				);

			}
				
			
			}
			
			catch (Exception e) {
	            // Handle any other exceptions
	            request.setAttribute("errorMessage", "An error occurred while processing the payment: " + e.getMessage());
	            RequestDispatcher dispatcher = request.getRequestDispatcher("unsuccessfull.jsp");
	            dispatcher.forward(request, response);
	        }
			
			
			
		}
		
		

	}
	


