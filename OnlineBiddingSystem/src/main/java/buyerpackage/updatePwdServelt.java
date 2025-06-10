package buyerpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updatePwdServelt")
public class updatePwdServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pwd =request.getParameter("password");
		String email =request.getParameter("email");
		
		boolean value=buyercontrol.updatePwd(pwd,email);
		
		if(value) {
			
			String ps="password update successfully";
			response.getWriter().println("<script> alert('"+ps+"'); window.location.href='bidhomepage.jsp'</script>");
			 
			
			
			
		}
		
		else {
			String ps="password didn't update successfully";
			response.getWriter().println("<script> alert('"+ps+"'); window.location.href='buyerCheckEmail.jsp'</script>");
			
			
			
			
			
		}
		
		
		
		
		
		
	}

}
