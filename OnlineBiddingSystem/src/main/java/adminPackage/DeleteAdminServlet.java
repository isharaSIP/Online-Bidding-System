package adminPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        boolean isDeleted = AdminController.deleteAdmin(id);

        if (isDeleted) {
            response.getWriter().println("<script>alert('Admin Deleted Successfully'); window.location.href='AdminListServlet'</script>");
        } else {
            response.getWriter().println("<script>alert('Failed to Delete Admin'); window.location.href='AdminListServlet'</script>");
        }
    }
}