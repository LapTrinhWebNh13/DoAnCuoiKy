package connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection getConnection()
	{
		Connection conn = null;
		try
		{		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlygiasu", "root", "Tuvy12032017");
			System.out.println("thanh cong");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("loi");
		}
		return conn;
	}
}