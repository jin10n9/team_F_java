package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import org.mindrot.jbcrypt.BCrypt;
import util.DBUtil;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // フォームから受け取る
        String email       = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        // パスワードをハッシュ化
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        try (Connection conn = DBUtil.getConnection()) {
            // 表名と列名を小文字＆スネークケースに
            String sql = 
                "UPDATE public.user " +
                "SET password_hash = ? " +
                "WHERE email = ?";

            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, hashedPassword);
                pstmt.setString(2, email);

                int updated = pstmt.executeUpdate();
                if (updated > 0) {
                    request.setAttribute("message", "パスワードが再設定されました。");
                } else {
                    request.setAttribute("message", "該当するメールアドレスが見つかりません。");
                }
                request.getRequestDispatcher("login.jsp")
                       .forward(request, response);
            }

        } catch (SQLException e) {
            throw new ServletException("データベース更新中にエラーが発生しました", e);
        }
    }
}
