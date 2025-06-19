<!--ログアウトの画面-->>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session.invalidate(); %>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>ログアウト</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <div class="page-container">
        <h2>ログアウトしました</h2>
        <!--JSTLを用いない形に変更-->>
        <a href="../login.jsp">ログイン画面へ</a>
    </div>
</body>

</html>