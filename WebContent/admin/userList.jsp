<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.User" %>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>ユーザーの一覧</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <div class="page-container">
        <h2>ユーザー管理</h2>
        <table border="1">
            <tr>
                <th>ユーザー名</th>
                <th>役割</th>
                <th>操作</th>
            </tr>
            <% List<User> userList = (List<User>) request.getAttribute("userList");
                    for (User u : userList) {
                    %>
                    <tr>
                        <td>
                            <%= u.getName() %>
                        </td>
                        <td>
                            <%= u.getRole() %>
                        </td>
                        <td>
                            <a href="EditUserServlet?id=<%= u.getId() %>">編集</a>
                            <a href="DeleteUserServlet?id=<%= u.getId() %>">削除</a>
                        </td>
                    </tr>
                    <% } %>
        </table>
    </div>
</body>

</html>