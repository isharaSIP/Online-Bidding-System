package SellerPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SellerProfileServlet")
public class SellerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//processRequest(request, response);
		String action = request.getParameter("action");
		
		if(action.equals("onlog")) {
			SellerModel seller = (SellerModel) request.getSession().getAttribute("seller");
			
			if(seller != null) {
				//Forward user data to profile.jsp
				request.setAttribute("seller", seller);
				request.getRequestDispatcher("sellerDashboard.jsp").forward(request, response);
			} else {
				//Hanlde case where user is not logged in
				response.sendRedirect("sellerlogin.jsp");
			}
		}
		else if(action.equals("ondash")) {
			//for dashboard communication
			SellerModel seller = (SellerModel) request.getSession().getAttribute("seller");
			
			if(seller != null) {
				//Forward user data to profile.jsp
				request.setAttribute("seller", seller);
				request.getRequestDispatcher("sellerDashboard.jsp").forward(request, response);
			} else {
				//Hanlde case where user is not logged in
				response.sendRedirect("sellerlogin.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//processRequest(request, response);
	}
	
//	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//Retrieve user information from session
//		SellerModel seller = (SellerModel) request.getSession().getAttribute("seller");
//		
//		if(seller != null) {
//			//Forward user data to profile.jsp
//			request.setAttribute("seller", seller);
//			request.getRequestDispatcher("sellerDashboard.jsp").forward(request, response);
//		} else {
//			//Hanlde case where user is not logged in
//			response.sendRedirect("login.jsp");
//		}
//	}

}
