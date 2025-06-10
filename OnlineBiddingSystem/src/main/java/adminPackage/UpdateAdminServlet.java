package adminPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateAdminServlet")
public class UpdateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String hometown = request.getParameter("hometown");
		String action = request.getParameter("action");
		
		boolean isTrue;
		isTrue = AdminController.updateprofile(id, firstName, lastName, username, password, hometown);
		
		if(isTrue == true) {
			if(action.equals("ondash")) {
				String alertMessage = "Data Update Sucessful";
				response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='adminLogin.jsp'</script>");
			} else if (action.equals("onmanage")){
				List<AdminModel> admindetails = AdminController.getById(id);
				request.setAttribute("admindetails", admindetails);
				
				String alertMessage = "Data Update Sucessful";
				response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='AdminListServlet'</script>");
			}
						
			}
				
		else {
			 	RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jpg");
			 	dis2.forward(request, response);
			 }
				
		}
	
	
	
}


