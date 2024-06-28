package viewaccountinformation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import demo.MyLogger;
import healthcareproapplication.DataBaseConnecter;

final public class ViewEmployeeInformation {
	private static MyLogger LOGGER;

	private ViewEmployeeInformation() {
		
	}
	public static Employee viewAccountInformation(String username, String databaseUsername, String databasePassword)
			throws SQLException {


		String view = "{CALL healthclinicpro.viewEmployeeInfo(?, ?, ?, ?, ?, ?, ?, ?)}";
		System.out.println(username);
		System.out.println(databaseUsername);
		System.out.println(databasePassword);
		try (Connection connection = DataBaseConnecter.createConnection("healthclinicpro", databaseUsername,
				databasePassword)) {
			try (CallableStatement callableStatement = connection.prepareCall(view)) {

				callableStatement.setString(1, username);
				callableStatement.registerOutParameter(2, Types.VARCHAR);
				callableStatement.registerOutParameter(3, Types.VARCHAR);
				callableStatement.registerOutParameter(4, Types.VARCHAR);
				callableStatement.registerOutParameter(5, Types.INTEGER);
				callableStatement.registerOutParameter(6, Types.VARCHAR);
				callableStatement.registerOutParameter(7, Types.VARCHAR);
				callableStatement.registerOutParameter(8, Types.VARCHAR);

				callableStatement.execute();

				String employeeFirstName = callableStatement.getString(2);
				String employeeMiddleName = callableStatement.getString(3);
				String employeeLastName = callableStatement.getString(4);
				int age = callableStatement.getInt(5);
				String gender = callableStatement.getString(6);
				String phoneNumber = callableStatement.getString(7);
				String role = callableStatement.getString(8);

				return new Employee(employeeFirstName, employeeMiddleName, employeeLastName, gender, age, role,
						phoneNumber);

				// If the DataBaseConnecter.createConnection method returns null,
				// a NullPointerException could occur when trying to use the connection.
			} catch (NullPointerException | SQLException e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Sorry, We got an Internal Error!");
				return null;
			} catch (Exception e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Sorry, We got an Internal Error!");
				return null;
			}
		}
		
	}
}
