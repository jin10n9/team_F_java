<!--販売実績確認画面-->>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*, model.SalesRecord" %>
        <%@ page session="true" %>
            <% List<SalesRecord> records = (List<SalesRecord>) request.getAttribute("salesRecords");
                    %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <title>販売実績カレンダー</title>
                        <link rel="stylesheet" href="<c:url value='/css/calendar.css' />">
                    </head>

                    <body>
                        <div class="page-container">
                            <h2>販売実績と天気カレンダー</h2>
                            <table class="calendar-table">
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
                                <c:forEach var="record" items="${salesRecords}">
                                    <tr>
                                        <td data-label="日付">${record.sales_date}</td>
                                        <td data-label="天気">${record.weather}</td>
                                        <td data-label="ホワイトビール">${record.white_beer}</td>
                                        <td data-label="ラガー">${record.lager}</td>
                                        <td data-label="ペールエール">${record.pale_ale}</td>
                                        <td data-label="フルーツビール">${record.fruit_beer}</td>
                                        <td data-label="黒ビール">${record.black_beer}</td>
                                        <td data-label="IPA">${record.ipa}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <a href="menu.jsp">← メニューへ戻る</a>
                        </div>
                    </body>

                    </html>