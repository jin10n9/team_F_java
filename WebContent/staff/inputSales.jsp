<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String userName = (String) session.getAttribute("userName");
  String role = (String) session.getAttribute("userRole");

  if (userName == null || !"staff".equals(role)) {
    response.sendRedirect("../login.jsp");
    return;
  }

  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
  String today = sdf.format(new java.util.Date());
%>

<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <title>販売実績入力</title>
    <style>
      input[type="number"] {
        width: 60px;
      }

      label {
        display: inline-block;
        width: 150px;
      }
    </style>
  </head>

  <body>
    <div class="page-container">
      <h2>販売実績入力 (<%= today %>)</h2>

      <form action="../RegisterSalesServlet" method="post">
        <input type="hidden" name="date" value="<%= today %>" />

        <label>ホワイトビール:</label>
        <input type="number" name="white_beer" value="0" min="0" required /><br /><br />

        <label>ラガー:</label>
        <input type="number" name="lager" value="0" min="0" required /><br /><br />

        <label>ペールエール:</label>
        <input type="number" name="pale_ale" value="0" min="0" required /><br /><br />

        <label>フルーツビール:</label>
        <input type="number" name="fruit_beer" value="0" min="0" required /><br /><br />

        <label>黒ビール:</label>
        <input type="number" name="black_beer" value="0" min="0" required /><br /><br />

        <label>IPA:</label>
        <input type="number" name="ipa" value="0" min="0" required /><br /><br />

        <input type="submit" value="登録する" />
      </form>

      <p><a href="menu.jsp">メニューに戻る</a></p>
    </div>
  </body>
</html>
