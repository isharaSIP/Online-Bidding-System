package adminPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminInsertServlet")
public class AdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String hometown = request.getParameter("hometown");
		
		boolean isTrue;
		
		isTrue = AdminController.insertdata(firstName, lastName, username, password, hometown);
				
		if(isTrue == true) {
			String alertMessage = "Register Sucessful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='AdminListServlet'</script>");		
			}
		
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jpg");
			dis2.forward(request, response);
		}
		
	}
		
}

