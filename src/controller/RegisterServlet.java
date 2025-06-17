// 名前・Email・パスワード登録処理

package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // DB接続情報（※あなたの環境に合わせて修正）
    private static final String DB_URL = "jdbc:postgresql://sales-db-server.postgres.database.azure.com:5432/postgres";
    private static final String DB_USER = "analyst";
    private static final String DB_PASS = "AnalystPass123!";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字コード
        request.setCharacterEncoding("UTF-8");

        // フォーム入力を取得
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String plainPassword = request.getParameter("password");

        try {
            // パスワードをハッシュ化
            String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());

            // DB登録
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {

                String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, hashedPassword);

                stmt.executeUpdate();
            }

            // 完了ページへ遷移
            response.sendRedirect("registerDone.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("ユーザー登録に失敗しました");
        }
    }
}


// データベースについて以下の構成を想定しています 本来のデータベースに合わせて変更必要かも 
//     CREATE TABLE users (
//     id INT AUTO_INCREMENT PRIMARY KEY,
//     name VARCHAR(100),
//     email VARCHAR(255) UNIQUE,
//     password VARCHAR(255)
// );
