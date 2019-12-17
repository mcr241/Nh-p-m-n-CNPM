package database;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataBase {
	public static Connection getConnection() {
		Connection connection = null;
		try {
//			System.out.println(Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"));
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			String user = "sa";
			String pass = "sa";
			String url = "jdbc:sqlserver://localhost:1434;databaseName=EleMarket";
			connection = DriverManager.getConnection(url, user, pass);
		} catch (Exception ex) {
			System.out.println(ex);
			
		}
		

		return connection;
	}
	
	
	public static void main(String[] args) {
		System.out.println(DataBase.getConnection());
	}
}
