package medicalreport;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import demo.MyLogger;
import healthcareproapplication.DataBaseConnecter;

final public class ViewMedicalReport {
	private static MyLogger LOGGER;

	private ViewMedicalReport() {

	}

	public static Medical viewMedicalReport(String username, String databaseUsername, String databasePassword)
			throws SQLException {
		String view = "{CALL healthclinicpro.viewMedicalReport(?, ?, ?)}";

		try (Connection connection = DataBaseConnecter.createConnection("healthclinicpro", databaseUsername,
				databasePassword)) {
			try (CallableStatement callableStatement = connection.prepareCall(view)) {

				callableStatement.setString(1, username);
				callableStatement.registerOutParameter(2, Types.VARCHAR);
				callableStatement.registerOutParameter(3, Types.VARCHAR);

				callableStatement.execute();

				String medicalReport = callableStatement.getString(2);
				String doctorName = callableStatement.getString(3);

				return new Medical(medicalReport, doctorName);
			} catch (NullPointerException | SQLException e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Sorry, We got an Internal Error!");

			} catch (Exception e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Sorry, We got an Internal Error!");
			}
		}
		return null;
	}
}
