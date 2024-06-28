package login;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import demo.MyLogger;
import healthcareproapplication.DataBaseConnecter;

final public class IsPatientAuthenticatedSystem {

	private static String userRole;
	private static MyLogger LOGGER;

	private IsPatientAuthenticatedSystem() {

	}

	public static boolean isPatientAuthenticated(String username, String password, String databaseUsername,
			String databasePassword) throws SQLException, IOException, InterruptedException {

		DataBaseConnecter connector = new DataBaseConnecter();
		try (Connection connection = connector.createConnection("healthclinicpro", databaseUsername,
				databasePassword)) {

			String loginProcedureCall = "{CALL PatientLoginChecker(?, ?, ?, ?)}";

			try (CallableStatement loginProcedureStatement = connection.prepareCall(loginProcedureCall)) {
				loginProcedureStatement.setString(1, username);
				loginProcedureStatement.setString(2, password);
				loginProcedureStatement.registerOutParameter(3, Types.VARCHAR);
				loginProcedureStatement.registerOutParameter(4, Types.VARCHAR);

				loginProcedureStatement.execute();

				String loginResult = loginProcedureStatement.getString(3);

				if ("SUCCESS".equals(loginResult)) {
					userRole = loginProcedureStatement.getString(4);
					return true;
				} else
					return false;

			} catch (SQLException e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Invalid username or password!");
				return false;
			}
		} catch (NullPointerException | SQLException e) {
			LOGGER.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
			return false;

		} catch (Exception e) {
			LOGGER.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
			return false;
		}
	}

	public static String getUserRole() {
		return userRole;
	}

	public static void print(String statement) {
		System.out.println(statement);
	}
}
