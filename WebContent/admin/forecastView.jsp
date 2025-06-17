<!--発注予測量表示の画面-->>

<!--ここは仮置き-->>
<%@ page import="java.util.*, model.ForecastResult" %>
    <% List<ForecastResult> forecasts = (List<ForecastResult>) request.getAttribute("forecastList");
            %>

            <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <!DOCTYPE html>
                <html lang="ja">

                <head>
                    <meta charset="UTF-8">
                    <title>発注予測結果</title>
                    <link rel="stylesheet" href="../css/style.css">
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
                            <c:forEach var="forecast" items="${forecastList}">
                                <tr>
                                    <td data-label="日付">${forecast.sales_date}</td>
                                    <td data-label="ホワイトビール">${forecast.white_beer}</td>
                                    <td data-label="ラガー">${forecast.lager}</td>
                                    <td data-label="ペールエール">${forecast.pale_ale}</td>
                                    <td data-label="フルーツビール">${forecast.fruit_beer}</td>
                                    <td data-label="黒ビール">${forecast.black_beer}</td>
                                    <td data-label="IPA">${forecast.ipa}</td>
                                </tr>
                            </c:forEach>
                        </table>
                        <a href="dashboard.jsp">← ダッシュボードへ戻る</a>
                    </div>
                </body>

                </html>