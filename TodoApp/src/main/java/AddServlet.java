import java.io.IOException;

import dao.TodoADO;
import db.DB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uname = request.getParameter("uname");
        String todo = request.getParameter("todo");
        String ustatus = request.getParameter("ustatus");

        HttpSession session = request.getSession();

        try {
            TodoADO ado = new TodoADO(DB.getConn());
            boolean f = ado.addTodo(uname, todo, ustatus);

            if (f) session.setAttribute("succ", "Todo Added Successfully");
            else session.setAttribute("fail", "Todo Not Added");

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
