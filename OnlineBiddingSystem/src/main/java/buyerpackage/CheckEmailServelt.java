package buyerpackage;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckEmailServelt")
public class CheckEmailServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
         String email=request.getParameter("email");
         
		
		try {
		boolean value=buyercontrol.checkEmail(email);
		
		if(value) {
			
		
			response.sendRedirect("buyerforgotpwd.jsp");
			
			HttpSession session = request.getSession();
	        session.setAttribute("email", email);

		
			
		}
		
		else {
			
			String ps="please enter correct email";
			response.getWriter().println("<script> alert('"+ps+"'); window.location.href='buyerCheckEmail.jsp'</script>");
			
		}
		
		}
		catch(Exception e) {
			e.printStackTrace();            	
		}
	}
}


