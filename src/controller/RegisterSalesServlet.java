package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.DBUtil;

@WebServlet("/RegisterSalesServlet")
public class RegisterSalesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("userName");

        if (userName == null || !"staff".equals(session.getAttribute("userRole"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        String salesDate = request.getParameter("sales_date");

        // 商品ごとの販売量を取得
        int[] salesVolumes = {
            Integer.parseInt(request.getParameter("white_beer")),
            Integer.parseInt(request.getParameter("lager")),
            Integer.parseInt(request.getParameter("pale_ale")),
            Integer.parseInt(request.getParameter("fruit_beer")),
            Integer.parseInt(request.getParameter("black_beer")),
            Integer.parseInt(request.getParameter("ipa"))
        };

        int[] productIds = {1, 2, 3, 4, 5, 6};
        int weatherId = 1;

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO \"SalesRecord\" (\"Date\", \"ProductID\", \"WeatherID\", \"SalesVolume\") "
                       + "VALUES (?, ?, ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                for (int i = 0; i < productIds.length; i++) {
                    stmt.setString(1, salesDate);
                    stmt.setInt(2, productIds[i]);
                    stmt.setInt(3, weatherId);
                    stmt.setInt(4, salesVolumes[i]);
                    stmt.addBatch();
                }
                stmt.executeBatch();
            }

            response.sendRedirect("menu.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "販売実績の登録に失敗しました");
            request.getRequestDispatcher("staff/inputSales.jsp").forward(request, response);
        }
    }
}
