package ListItemPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ItemDeleteServlet")
public class ItemDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			int sid = Integer.parseInt(request.getParameter("sid"));
			boolean isTrue = ItemController.deleteByItemId(id);
			
			if(isTrue == true) {
				String alertMessage = "Item deleted successfully!";
				response.getWriter().println("<script> alert('" + alertMessage + "');"
						+ "window.location.href = 'ItemDisplayServlet?action=ondelete&seller_id="+sid+"'</script>");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
