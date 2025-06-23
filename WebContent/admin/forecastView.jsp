<%@ page import="java.util.*, model.ForecastResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<ForecastResult> forecasts = (List<ForecastResult>) request.getAttribute("forecastList");
%>

<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <title>発注予測結果</title>
    <link rel="stylesheet" href="../css/style.css" />
  </head>

  <body>
    <div class="page-container">
      <h2>📈 発注予測数量</h2>
      <table border="1">
        <tr>
          <th>対象日</th>
          <th>White</th>
          <th>Lager</th>
          <th>Pale Ale</th>
          <th>Fruit</th>
          <th>Black</th>
          <th>IPA</th>
        </tr>
        <%
          if (forecasts != null) {
            for (ForecastResult forecast : forecasts) {
        %>
        <tr>
          <td data-label="日付"><%= forecast.getSales_date() %></td>
          <td data-label="ホワイトビール"><%= forecast.getWhite_beer() %></td>
          <td data-label="ラガー"><%= forecast.getLager() %></td>
          <td data-label="ペールエール"><%= forecast.getPale_ale() %></td>
          <td data-label="フルーツビール"><%= forecast.getFruit_beer() %></td>
          <td data-label="黒ビール"><%= forecast.getBlack_beer() %></td>
          <td data-label="IPA"><%= forecast.getIpa() %></td>
        </tr>
        <%
            }
          }
        %>
      </table>
      <a href="dashboard.jsp">← ダッシュボードへ戻る</a>
    </div>
  </body>
</html>
