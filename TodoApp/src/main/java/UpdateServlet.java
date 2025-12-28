import java.io.IOException;

import dao.TodoADO;
import db.DB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.model;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("hiddenId"));
        String uname = request.getParameter("uname");
        String todo = request.getParameter("todo");
        String ustatus = request.getParameter("ustatus");

        HttpSession session = request.getSession();

        try {
            TodoADO ado = new TodoADO(DB.getConn());
            model t = new model();
            t.setId(id);
            t.setName(uname);
            t.setTodo(todo);
            t.setStatus(ustatus);

            boolean f = ado.updateTodo(t);

            if (f) session.setAttribute("succ", "Todo Updated Successfully");
            else session.setAttribute("fail", "Todo Not Updated");

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
