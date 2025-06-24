package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.mindrot.jbcrypt.BCrypt;
import util.DBUtil;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ユーザー情報を取得
        String name           = request.getParameter("name");
        String email          = request.getParameter("email");
        String plainPassword  = request.getParameter("password");
        String role           = request.getParameter("role");

        try {
            // パスワードをハッシュ化
            String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());

            try (Connection conn = DBUtil.getConnection()) {
                // 表名と列名を小文字スネークケースに統一
                String sql = 
                    "INSERT INTO public.user (name, email, password_hash, role) " +
                    "VALUES (?, ?, ?, ?)";

                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, hashedPassword);
                    stmt.setString(4, role);
                    stmt.executeUpdate();
                }
            }

            // 登録成功後のリダイレクト
            response.sendRedirect("registerDone.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("ユーザー登録に失敗しました", e);
        }
    }
}
