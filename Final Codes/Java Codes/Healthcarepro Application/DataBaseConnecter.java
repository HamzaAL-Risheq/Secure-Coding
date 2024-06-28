package healthcareproapplication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

final public class DataBaseConnecter {

	private static final Logger LOGGER = Logger.getLogger(DataBaseConnecter.class.getName());
	private static String username;
	private static String password;

	// Private constructor to prevent instantiation
	//	public DataBaseConnecter() {
	//		throw new IllegalStateException("Utility class");
	//	}

	public static Connection createConnection(String databaseName, String databaseUsername, String databasePassword)
			throws SQLException {
		Connection connection = null;

		try {
			// Load the MySQL JDBC driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			String databaseURL = "jdbc:mysql://localhost:3306/" + databaseName;
			username = databaseUsername;
			password = databasePassword;

			connection = DriverManager.getConnection(databaseURL, username, password);
		} catch (ClassNotFoundException | SQLException e) {
			LOGGER.log(Level.SEVERE, "Error during database connection", e);
			throw new SQLException("Failed to connect to the database", e);
		}

		return connection;
	}

	public static void closeConnection(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				LOGGER.log(Level.WARNING, "Error closing database connection", e);
			}
		}
	}
}
