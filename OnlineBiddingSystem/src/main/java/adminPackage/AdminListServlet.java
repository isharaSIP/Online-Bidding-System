package adminPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminListServlet")
public class AdminListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Call controller method to get all admins
        List<AdminModel> admins = AdminController.getAllAdmins(); // We'll create this method next

        // Set attribute for JSP
        request.setAttribute("admins", admins);

        // Forward to adminList.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminList.jsp");
        dispatcher.forward(request, response);
    }
}