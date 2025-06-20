<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String userName=(String) session.getAttribute("userName"); String role=(String) session.getAttribute("userRole");
if (userName==null || !"admin".equals(role)) { response.sendRedirect("../login.jsp"); return; } %>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>管理者メニュー</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <div class="page-container">
        <h1>ようこそ、<%= userName %> さん。（管理者）</h1>

        <ul>
            <li><a href="userList.jsp">ユーザー管理</a></li>
            <li><a href="../shared/salesSummary.jsp">販売実績の確認</a></li>
            <li><a href="forecastView.jsp">発注予測の確認</a></li>
            <li><a href="../shared/logout.jsp">ログアウト</a></li>
        </ul>
    </div>
</body>

</html>