package buyerpackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ListItemPackage.ItemController;


@WebServlet("/buyerloginservelt")
public class buyerloginservelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("ondash")) {
			
			// Retrieve the session (do not create a new one if it doesn't exist)
		    HttpSession session = request.getSession(false);

		    buyermodel buyer = null;

		    if (session != null) {
		        // Get the buyer object from session
		    	buyer = (buyermodel)session.getAttribute("buyer");
		    	request.setAttribute("buyer", buyer);
		    	response.sendRedirect("buyerDashboard.jsp");
		    }

		    if (buyer == null) {
		        // Handle case where buyer is not in session (e.g., redirect to login)
		        response.sendRedirect("buyerlogin.jsp");
		        return;
		    }
			
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		
		try {
		    List<buyermodel> buyerlogin = buyercontrol.loginValidate(name, pwd);
		    
		    if(buyerlogin != null & !buyerlogin.isEmpty()) {
		        request.getSession().setAttribute("buyer", buyerlogin.get(0));
		        response.sendRedirect("buyerDashboard.jsp");
		        
		    } else {
				String alertMessage = "Invalid Credentials";
				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='buyerlogin.jsp'</script>");
			}

		}
		catch(Exception e) {
			e.printStackTrace();

			
		}
	
	}
		
}


