package buyerpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateBuyerProfileServelt")
public class updateBuyerProfileServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		int id = Integer.parseInt(request.getParameter("id"));
		//System.out.println("ID: " + id);

		String name = request.getParameter("name");
		//System.out.println("Name: " + name);

		String email = request.getParameter("email");
		//System.out.println("Email: " + email);

		String phoneNumber = request.getParameter("mobile");
		//System.out.println("Phone Number: " + phoneNumber);

		String pwd = request.getParameter("password");
		//System.out.println("Password: " + pwd);
		
		boolean value=buyercontrol.updateBuyerProfile(id,name,email,pwd,phoneNumber);
		
		if(action.equals("onbuyer") && value) {
			String ps="Profile update successfully";
			response.getWriter().println("<script> alert('"+ps+"'); window.location.href='buyerloginservelt?action=ondash'</script>");
		}else if(action.equals("onadmin")) {
			String ps="Profile update successfully";
			response.getWriter().println("<script> alert('"+ps+"'); window.location.href='buyerdisplay.jsp'</script>");
		}else {
			String ps="Profile didn't update successfully";
			response.getWriter().println("<script> alert('"+ps+"'); window.location.href='buyerloginservelt?action=ondash'</script>");
			
			
			
			
			
		}
		
		
		
		
		
		
	}

}
