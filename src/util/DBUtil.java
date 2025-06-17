package util;

import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:postgresql://sales-db-server.postgres.database.azure.com:5432/postgres";
    private static final String USER = "analyst";
    private static final String PASSWORD = "AnalystPass123!";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}