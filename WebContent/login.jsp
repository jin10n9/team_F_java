<!--ログイン画面-->>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>ログイン - H&C BAR</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="login-page">
    <div class="login-container">
        <h2>H&C BAR 発注予測システム</h2>

        <%-- エラーメッセージの表示 --%>
            <c:if test="${not empty errorMessage}">
                <div class="error">${errorMessage}</div>
            </c:if>

            <form method="post" action="login">
                <label for="email">メールアドレス:</label><br>
                <input type="email" id="email" name="email" required><br><br>

                <label for="password">パスワード:</label><br>
                <input type="password" id="password" name="password" required><br><br>

                <input type="submit" value="ログイン">
            </form>

            <p><a href="reset-password.jsp">パスワードを忘れた方はこちら</a></p>
    </div>
</body>

</html>