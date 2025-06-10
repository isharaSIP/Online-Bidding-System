package SellerPackage;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewSellersServlet")
public class ViewSellersServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String province = request.getParameter("province");

    List<SellerModel> allSellers;
    if (province != null && !province.trim().isEmpty()) {
      allSellers = SellerController.getSellersByProvince(province.trim());
    } else {
      allSellers = SellerController.getAllSellers();
    }

    request.setAttribute("allSellers", allSellers);
    RequestDispatcher dispatcher = request.getRequestDispatcher("displaySellers.jsp");
    dispatcher.forward(request, response);
  }
}

