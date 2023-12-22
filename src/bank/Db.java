package bank;

import java.sql.Connection;
import java.sql.DriverManager;

public class Db {
	static Connection conn=null;
	public static Connection connect() {
		try {
			String url="jdbc:mysql://localhost:3306/bank";
			String username="root";
			String password="Shiva2209$";
			conn=DriverManager.getConnection(url, username,password);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
}
