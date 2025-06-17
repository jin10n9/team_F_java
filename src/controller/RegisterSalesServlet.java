package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.DBUtil;

@WebServlet("/RegisterSalesServlet")
public class RegisterSalesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ユーザー情報をセッションから取得
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");

        if (userName == null || !"staff".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        // パラメータ取得
        String sales_date = request.getParameter("sales_date");
        int white_beer = Integer.parseInt(request.getParameter("white_beer"));
        int lager = Integer.parseInt(request.getParameter("lager"));
        int pale_ale = Integer.parseInt(request.getParameter("pale_ale"));
        int fruit_beer = Integer.parseInt(request.getParameter("fruit_beer"));
        int black_beer = Integer.parseInt(request.getParameter("black_beer"));
        int ipa = Integer.parseInt(request.getParameter("ipa"));

        // DB接続し登録処理
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO sales (user_name, date, white_beer, lager, pale_ale, fruit_beer, black_beer, ipa) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userName);
            stmt.setString(2, sales_date);
            stmt.setInt(3, white_beer);
            stmt.setInt(4, lager);
            stmt.setInt(5, pale_ale);
            stmt.setInt(6, fruit_beer);
            stmt.setInt(7, black_beer);
            stmt.setInt(8, ipa);

            stmt.executeUpdate();
            response.sendRedirect("menu.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "販売実績の登録に失敗しました");
            request.getRequestDispatcher("staff/inputSales.jsp").forward(request, response);
        }
    }
}
