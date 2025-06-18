<!--従業員用のメニュー画面-->>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String userName=(String) session.getAttribute("userName"); String role=(String) session.getAttribute("userRole");
    if (userName==null || !"staff".equals(role)) { response.sendRedirect("../login.jsp"); return; } %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>従業員メニュー</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <div class="page-container">
        <h1>こんにちは、<%= userName %> さん。（従業員）</h1>

        <ul>
            <li><a href="inputSales.jsp">販売実績の入力</a></li>
            <li><a href="../shared/salesSammary.jsp">販売実績の確認</a></li>
            <li><a href="../shared/logout.jsp">ログアウト</a></li>
        </ul>
    </div>
</body>

</html>