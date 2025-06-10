package adminPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");		
	
		try {
			List<AdminModel> adminlogin = AdminController.loginValidate(username, password);
			if(adminlogin != null & !adminlogin.isEmpty()) {
				
				request.getSession().setAttribute("admin", adminlogin.get(0));
				response.sendRedirect("AdminDashboardServlet");
			}
			
			else {
				String alertMessage = "Invalid Credentials";
				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='adminLogin.jsp'</script>");
			}
				
	
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
}
