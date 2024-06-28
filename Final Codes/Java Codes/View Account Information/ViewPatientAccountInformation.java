package viewaccountinformation;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import demo.MyLogger;
import healthcareproapplication.DataBaseConnecter;

final public class ViewPatientAccountInformation {
	private static MyLogger LOGGER;

	private ViewPatientAccountInformation() {

	}

	public static Patient viewAccountInformation(String username, String databaseUsername, String databasePassword)
			throws SQLException, ClassNotFoundException {
		String view = "{CALL healthclinicpro.viewPatientInfo(?, ?, ?, ?, ?, ?, ?)}";

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

				callableStatement.execute();

				String patientFirstName = callableStatement.getString(2);
				String patientMiddleName = callableStatement.getString(3);
				String patientLastName = callableStatement.getString(4);
				int age = callableStatement.getInt(5);
				String gender = callableStatement.getString(6);
				String phoneNumber = callableStatement.getString(7);

				return new Patient(patientFirstName, patientMiddleName, patientLastName, gender, age, phoneNumber);
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
