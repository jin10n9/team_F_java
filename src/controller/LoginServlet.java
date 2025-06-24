package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.mindrot.jbcrypt.BCrypt;
import util.DBUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = 
                "SELECT user_id, name, password_hash, role " +
                "FROM public.user " +
                "WHERE email = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String hashedPassword = rs.getString("password_hash");
                        if (BCrypt.checkpw(password, hashedPassword)) {
                            // ログインに成功したとき
                            HttpSession session = request.getSession();
                            session.setAttribute("userName", rs.getString("name"));
                            session.setAttribute("userRole", rs.getString("role"));
                            session.setAttribute("userId",   rs.getInt   ("user_id"));

                            // 管理者と従業員で異なるページに遷移
                            if ("admin".equals(rs.getString("role"))) {
                                response.sendRedirect("admin/dashboard.jsp");
                            } else {
                                response.sendRedirect("staff/inputSales.jsp");
                            }
                            return;
                        }
                    }
                }
            }

            // ログインに失敗したとき
            request.setAttribute("errorMessage", "メールアドレスまたはパスワードが正しくありません。");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("データベース接続に失敗しました", e);
        }
    }
}
