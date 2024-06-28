package registering;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import demo.MyLogger;
import healthcareproapplication.DataBaseConnecter;

final public class RegisterPatient {
	private static MyLogger LOGGER;
	
	private RegisterPatient() {
		
	}
	public static int registerPatient(String firstName, String middleName, String lastName, int age, String gender,
			String phoneNumber, String databaseUsername, String databasePassword) {
		String sqlQuery = "{CALL RegisterPatient(?, ?, ?, ?, ?, ?, ?)}";
		int id = 0;
		try (Connection connection = DataBaseConnecter.createConnection("healthclinicpro", databaseUsername,
				databasePassword)) {
			try (CallableStatement callableStatement = connection.prepareCall(sqlQuery)) {

				callableStatement.setString(1, firstName);
				callableStatement.setString(2, middleName);
				callableStatement.setString(3, lastName);
				callableStatement.setInt(4, age);
				callableStatement.setString(5, gender);
				callableStatement.setString(6, phoneNumber);

				callableStatement.registerOutParameter(7, Types.INTEGER);

				System.out.println("Executing stored procedure...");
				callableStatement.execute();
				System.out.println("Stored procedure executed successfully.");

				id = callableStatement.getInt(7);
				System.out.println("Returned patient ID: " + id);
				return id;
			} catch (SQLException e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("The patient is already existed.");
				return 0;
			}
			// If the DataBaseConnecter.createConnection method returns null,
			// a NullPointerException could occur when trying to use the connection.
		} catch (NullPointerException | SQLException e) {
			LOGGER.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
			return 0;

		} catch (Exception e) {
			LOGGER.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
			return 0;
		}

	}

}
