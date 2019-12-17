import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.impl.CategoryDaoImpl;
import database.DataBase;

public class test {
	public static void main(String[] args) {
		Connection connection = DataBase.getConnection();
//		CategoryDaoImpl x = new CategoryDaoImpl();
		System.out.println(connection);
	}
}
