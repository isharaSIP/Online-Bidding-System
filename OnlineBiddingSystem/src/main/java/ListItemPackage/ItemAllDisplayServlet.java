package ListItemPackage;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SellerPackage.SellerModel;
import buyerpackage.buyermodel;

@WebServlet("/ItemAllDisplayServlet")
public class ItemAllDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
		if(action.equals("ondashA")) {
			List<ItemModule> item = ItemController.getAllItems();
			request.setAttribute("item", item);
			request.getRequestDispatcher("ItemDisplayForAdmin.jsp").forward(request, response);
		} else if(action.equals("ondashB")){
			
			List<ItemModule> item = ItemController.getAllItems();
			HttpSession session = request.getSession(false);    
			int buyerID = 0;
			if (session != null) {
			    buyermodel buyer = (buyermodel) session.getAttribute("buyer");
			    request.setAttribute("buyer", buyer);
			   }else {
				   System.out.println("There is error!");
			   }
			;
			request.setAttribute("item", item);
			request.getRequestDispatcher("ItemDisplayForBidder.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
