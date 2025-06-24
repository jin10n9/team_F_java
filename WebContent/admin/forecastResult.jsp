<%@ page import="java.util.*, model.ForecastResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<ForecastResult> forecasts = (List<ForecastResult>) request.getAttribute("forecastList");
 
  Map<String, Map<String, Double>> table = new LinkedHashMap<>();
 
  for (ForecastResult forecast : forecasts) {
    String day = forecast.getWeekday();
    String beer = forecast.getBeerName();
    double pred = forecast.getPrediction();
 
    if (!table.containsKey(day)) {
      table.put(day, new HashMap<>());
    }
    table.get(day).put(beer, pred);
  }
%>
 
<table border="1">
<tr>
<th>曜日</th>
<th>White</th>
<th>Lager</th>
<th>Pale Ale</th>
<th>Fruit</th>
<th>Black</th>
<th>IPA</th>
</tr>
<%
    for (String day : table.keySet()) {
      Map<String, Double> beers = table.get(day);
  %>
<tr>
<td><%= day %></td>
<td><%= beers.getOrDefault("ホワイトビール(本)", 0.0) %></td>
<td><%= beers.getOrDefault("ラガー(本)", 0.0) %></td>
<td><%= beers.getOrDefault("ペールエール(本)", 0.0) %></td>
<td><%= beers.getOrDefault("フルーツビール(本)", 0.0) %></td>
<td><%= beers.getOrDefault("黒ビール(本)", 0.0) %></td>
<td><%= beers.getOrDefault("IPA(本)", 0.0) %></td>
</tr>
<%
    }
  %>
</table>