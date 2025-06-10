package SellerPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateSellerServlet")
public class UpdateSellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		String name= request.getParameter("name");
		String nic= request.getParameter("nic");
		String province= request.getParameter("province");
		String district= request.getParameter("district");
		String mobile= request.getParameter("mobile");
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		
		boolean isTrue;
		isTrue = SellerController.updateSeller(id, name, nic, province, district, mobile, email, password);
		
		String source = request.getParameter("source");

		if (isTrue) {
		    List<SellerModel> sellerdetails = SellerController.getById(id);
		    request.setAttribute("sellerdetails", sellerdetails);

		    String alertMessage = "Data Update Successful";
		    if ("admin".equals(source)) {
		        response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='ViewSellersServlet'</script>");
		    } else {
		        response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='sellerlogin.jsp'</script>");
		    }
		} else {
		    RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
		    dis2.forward(request, response);
		}

	}

}
