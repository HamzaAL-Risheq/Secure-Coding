package registering;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.CallableStatement;

import demo.MyLogger;
import healthcareproapplication.DataBaseConnecter;

final public class RegisterEmployee {

	private static int employeeId;
	private static MyLogger LOGGER;

	private RegisterEmployee() {

	}

	public static int registerEmployee(String firstName, String middleName, String lastName, int age, String gender,
			String role, String databaseUsername, String databasePassword) throws SQLException {

		String sqlQuery = "{CALL RegisterEmployee(?, ?, ?, ?, ?, ?, ?)}";
		try (Connection connection = DataBaseConnecter.createConnection("healthclinicpro", databaseUsername,
				databasePassword)) {
			try (CallableStatement callableStatement = connection.prepareCall(sqlQuery)) {
				callableStatement.setString(1, firstName);
				callableStatement.setString(2, middleName);
				callableStatement.setString(3, lastName);
				callableStatement.setInt(4, age);
				callableStatement.setString(5, gender);
				callableStatement.setString(6, role);

				callableStatement.registerOutParameter(7, Types.INTEGER);

				callableStatement.execute();

				return employeeId = callableStatement.getInt(7);
			} catch (SQLException e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Employee is already existed");
				return 0;

			}
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

	public static void registerPhoneNumber(String phoneNumber, String databaseUsername, String databasePassword)
			throws SQLException {
		String addPhoneNumber = "{CALL healthclinicpro.RegisterPhoneNumber(?, ?)}";
		try (Connection connection = DataBaseConnecter.createConnection("healthclinicpro", databaseUsername,
				databasePassword)) {
			try (CallableStatement callableStatement = connection.prepareCall(addPhoneNumber)) {

				callableStatement.setString(1, phoneNumber);
				callableStatement.setLong(2, employeeId);

				callableStatement.executeUpdate();
			} catch (NullPointerException | SQLException e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Sorry, We got an Internal Error!");

			} catch (Exception e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Sorry, We got an Internal Error!");
			}
		}
	}
}
