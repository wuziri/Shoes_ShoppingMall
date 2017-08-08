package cn.wuziri.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private final String Driver = "com.mysql.jdbc.Driver";

	private final String URL = "jdbc:mysql://localhost:3306/distance?characterEncoding=utf8&useSSL=true";

	private final String USER = "root";

	private final String PASSWORD = "root";

	private Connection conn = null;

	public DBConnection() throws SQLException {
		try {
			Class.forName(Driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		this.conn = DriverManager.getConnection(URL, USER, PASSWORD);
	}

	public Connection getConnection() {
		//System.out.println("连接数据库成功...");
		return conn;
	}

	public void close() {
		if (this.conn != null) {
			try {
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
