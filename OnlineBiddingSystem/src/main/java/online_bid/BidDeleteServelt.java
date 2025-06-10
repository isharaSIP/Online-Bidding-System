package online_bid;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buyerpackage.buyermodel;

@WebServlet("/BidDeleteServelt")
public class BidDeleteServelt extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int ID = Integer.parseInt(request.getParameter("id"));
            boolean deleteAns = BidControl.deletedata(ID);
            
            buyermodel buyer = (buyermodel) request.getSession().getAttribute("buyer");
            int buyerid = buyer.getId();
            
            if (deleteAns) {
                // If delete is successful
                response.getWriter().println("<script>alert('History deleted successfully!'); window.location.href = 'Bidhistroy.jsp?buyerid="+buyerid+"';</script>");
            } else {
                // If delete fails
                response.getWriter().println("<script>alert('Failed to delete history.'); window.location.href = 'Bidhistroy.jsp?buyerid="+buyerid+"';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace(); // For debugging
            response.getWriter().println("<script>alert('An error occurred.'); window.location.href = 'buyerlogin.jsp';</script>");
        }
    }
}


