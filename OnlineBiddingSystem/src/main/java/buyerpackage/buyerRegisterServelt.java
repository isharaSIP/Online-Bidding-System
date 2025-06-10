package buyerpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import online_bid.BidControl;


@WebServlet("/buyerRegisterServelt")
public class buyerRegisterServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		String phoneNumber=request.getParameter("phoneNumber");
		
try {
			
			boolean insert=buyercontrol.insertRegister(name,email,pwd,phoneNumber);
		     
				
			if(insert) {
				
			        response.sendRedirect("buyerRegSuc.jsp");
			
			}
			else {
				request.setAttribute("errorMessage", "Registration failed. Please try again.");
		        request.getRequestDispatcher("buyerRegister.jsp").forward(request, response);
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
