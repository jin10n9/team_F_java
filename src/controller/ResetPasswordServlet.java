package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;

import util.DBUtil;

public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "UPDATE \"User\" SET \"PasswordHash\" = ? WHERE \"Email\" = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, hashedPassword);
                pstmt.setString(2, email);
                int updated = pstmt.executeUpdate();

                if (updated > 0) {
                    request.setAttribute("message", "パスワードが再設定されました。");
                } else {
                    request.setAttribute("message", "該当するメールアドレスが見つかりません。");
                }
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}