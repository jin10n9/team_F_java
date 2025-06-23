<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <title>ユーザー登録</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>

  <body>
    <div class="page-container">
      <form action="RegisterServlet" method="post">
        <label for="name">名前：</label>
        <input type="text" name="name" required /><br />

        <label for="email">メールアドレス：</label>
        <input type="email" name="email" required /><br />

        <label for="password">パスワード：</label>
        <input type="password" name="password" required /><br />

        <label for="role">役割：</label>
        <select name="role" required>
          <option value="staff">スタッフ</option>
          <option value="admin">管理者</option></select
        ><br />

        <input type="submit" value="登録" />
      </form>
    </div>
  </body>
</html>
