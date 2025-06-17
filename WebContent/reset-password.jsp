<!--パスワードリセット用の画面 ログイン画面(login.jsp)から飛ばされる-->>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <title>パスワードリセット</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="page-container">
            <h2>パスワードをリセット</h2>
            <form action="ResetPasswordServlet" method="post">
                メールアドレス：<input type="email" name="email" required><br>
                新しいパスワード：<input type="password" name="newPassword" required><br>
                <button type="submit">リセット</button>
            </form>
        </div>
    </body>

    </html>