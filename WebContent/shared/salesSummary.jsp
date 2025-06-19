<!--販売実績確認画面 天気も含めてカレンダー形式に-->>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.SalesRecord" %>
<%@ page session="true" %>

<%
    List<SalesRecord> records = (List<SalesRecord>) request.getAttribute("salesRecords");
%>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>販売実績カレンダー</title>
    <link rel="stylesheet" href="../css/calendar.css">
</head>

<body>
    <div class="page-container">
        <h2>販売実績と天気カレンダー</h2>
        <table class="calendar-table" border="1">
            <tr>
                <th>日付</th>
                <th>天気</th>
                <th>White</th>
                <th>Lager</th>
                <th>Pale Ale</th>
                <th>Fruit</th>
                <th>Black</th>
                <th>IPA</th>
            </tr>

            <% if (records != null) {
                   for (SalesRecord record : records) {
            %>
            <tr>
                <td data-label="日付"><%= record.getSales_date() %></td>
                <td data-label="天気"><%= record.getWeather() %></td>
                <td data-label="ホワイトビール"><%= record.getWhite_beer() %></td>
                <td data-label="ラガー"><%= record.getLager() %></td>
                <td data-label="ペールエール"><%= record.getPale_ale() %></td>
                <td data-label="フルーツビール"><%= record.getFruit_beer() %></td>
                <td data-label="黒ビール"><%= record.getBlack_beer() %></td>
                <td data-label="IPA"><%= record.getIpa() %></td>
            </tr>
            <%   }
               } else { %>
            <tr>
                <td colspan="8">データがありません。</td>
            </tr>
            <% } %>
        </table>
        <a href="menu.jsp">← メニューへ戻る</a>
    </div>
</body>

</html>
