package registering;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import demo.MyLogger;
import healthcareproapplication.DataBaseConnecter;

final public class CreateEmployeeCredentials {
	private static MyLogger LOGGER;

	private CreateEmployeeCredentials() {

	}

	public static void createUsername(String username, String password, int employeeId, String databaseUsername,
			String databasePassword) throws SQLException {
		String createUserProcedure = "{CALL healthclinicpro.CreateUserAndStoreSecret(?, ?, ?, ?)}";
//		RandomSGenerator salt = new RandomSGenerator();
		String generatedSalt = RandomSGenerator.generate();
		try (Connection connection = DataBaseConnecter.createConnection("healthclinicpro", databaseUsername,
				databasePassword)) {
			try (CallableStatement callableStatement = connection.prepareCall(createUserProcedure)) {

				callableStatement.setString(1, username);
				callableStatement.setString(2, password);
				callableStatement.setLong(3, employeeId);
				callableStatement.setString(4, generatedSalt);
				callableStatement.executeUpdate();
			} catch (SQLException e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("This employee username is already existed.");

			}
		} catch (NullPointerException | SQLException e) {
			LOGGER.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");

		} catch (Exception e) {
			LOGGER.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
		}
	}

}
