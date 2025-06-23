<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>フルーツビール売上と天気の相関関係</title>
  <link rel="stylesheet" href="../css/style.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      background-color: #f5f5f5;
      padding: 20px;
    }
    h1 {
      color: #333;
      margin-bottom: 30px;
    }
    .image-container {
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
    }
    .image-container img {
      width: 300px;
      height: auto;
      border: 1px solid #ccc;
      box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
    }
    .back-link {
      display: block;
      margin-top: 40px;
      font-size: 1rem;
      color: #007bff;
      text-decoration: none;
    }
    .back-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <h1>フルーツビール売上と天気の相関関係</h1>

  <div class="image-container">
    <img src="../images/フルーツ・曜日.png" alt="曜日と売上の相関">
    <img src="../images/フルーツ・気温.png" alt="気温と売上の相関">
    <img src="../images/フルーツ・降水量.png" alt="降水量と売上の相関">
  </div>

  <a href="salesSummary.jsp" class="back-link">← カレンダーに戻る</a>
</body>
</html>
