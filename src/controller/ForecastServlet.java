package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import model.ForecastResult;

@WebServlet("/forecast")
public class ForecastServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String apiUrl = "https://team-f.azurewebsites.net/api/HttpExample?"; // ←関数キーに置き換える
        List<ForecastResult> forecastList = new ArrayList<>();
 
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
 
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            StringBuilder jsonBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
 
            reader.close();
            conn.disconnect();
 
            // JSONをパース
            JSONObject jsonObj = new JSONObject(jsonBuilder.toString());
            JSONArray predictions = jsonObj.getJSONArray("predicted_sales");
 
            // モデル名ごとに曜日順に整理（または必要に応じて日付と変換）
            for (int i = 0; i < predictions.length(); i++) {
                JSONObject pred = predictions.getJSONObject(i);
                ForecastResult result = new ForecastResult();
 
                result.setBeerName(pred.getString("モデル名"));
                result.setWeekday(pred.getString("曜日"));
                result.setPrediction(pred.getDouble("予測値"));
 
                forecastList.add(result);
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        request.setAttribute("forecastList", forecastList);
        request.getRequestDispatcher("/forecastResult.jsp").forward(request, response);
    }
}