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

@WebServlet("/ItemDisplayServlet")
public class ItemDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		 
		if(action.equals("oninsert")) {
			int SellerId = Integer.parseInt(request.getParameter("seller_id"));
	
			List<ItemModule> items = ItemController.getItemsBySellerId(SellerId);
		    request.setAttribute("items", items);
		    request.setAttribute("seller_id", SellerId);
		    request.getRequestDispatcher("ItemDisplaySeller.jsp").forward(request, response);
		    
		} else if(action.equals("ondash")) {
			int SellerId = Integer.parseInt(request.getParameter("seller_id"));
			
			List<ItemModule> items = ItemController.getItemsBySellerId(SellerId);
			
		    request.setAttribute("items", items);
		    request.setAttribute("seller_id", SellerId);
		    request.getRequestDispatcher("ItemDisplaySeller.jsp").forward(request, response);
		} else if (action.equals("ondelete")) {
			int SellerId = Integer.parseInt(request.getParameter("seller_id"));
			
			List<ItemModule> items = ItemController.getItemsBySellerId(SellerId);
			
		    request.setAttribute("items", items);
		    request.setAttribute("seller_id", SellerId);
		    request.getRequestDispatcher("ItemDisplaySeller.jsp").forward(request, response);
		}else if(action.equals("route")){
			HttpSession session = request.getSession(false);    
			int sellerId = 0;
			if (session != null) {
			    SellerModel seller = (SellerModel) session.getAttribute("seller");

			    if (seller != null) {
			        
			        sellerId = seller.getId();
			        String sellerName = seller.getName();
			    }
			   }else {
				   System.out.println("There is error!");
			   }
			
			List<ItemModule> items = ItemController.getItemsBySellerId(sellerId);
			
			request.setAttribute("items", items);
			request.setAttribute("seller_id", sellerId);
			request.getRequestDispatcher("ItemDisplaySeller.jsp").forward(request, response);
		       
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		
	}

}
