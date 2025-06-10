package SellerPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			List<SellerModel> sellerlogin = SellerController.loginValidate(email, password);
			
			if(sellerlogin != null && !sellerlogin.isEmpty()) {
				
				request.getSession().setAttribute("seller", sellerlogin.get(0));

				String alertMessage = "Login Successful";
				response.setContentType("text/html");
				response.getWriter().println("<script>");
				response.getWriter().println("alert('" + alertMessage + "');");
				response.getWriter().println("window.location.href = 'SellerProfileServlet?action=onlog';");
				response.getWriter().println("</script>");

			}
			else {
				String alertMessage = "Login Failed, Please Try Agein!";
				response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='sellerlogin.jsp'</script>");
			}
			
			request.setAttribute("sellerlogin", sellerlogin);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
