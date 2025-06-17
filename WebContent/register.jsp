<!-- 名前/Email/パスワードの登録画面-->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="ja">

    <head>
        <meta charset="UTF-8">
        <title>ユーザー登録</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="page-container">
            <form action="RegisterServlet" method="post">
                名前: <input type="text" name="name" required><br>
                Email: <input type="email" name="email" required><br>
                パスワード: <input type="password" name="password" required><br>
                <input type="submit" value="登録">
            </form>
        </div>
    </body>

    </html>


    <!-- データベースについて以下の構成を想定しています 本来のデータベースに合わせて変更必要かも 
    CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
); -->