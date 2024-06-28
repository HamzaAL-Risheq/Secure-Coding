package medicalreport;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import demo.MyLogger;
import healthcareproapplication.DataBaseConnecter;

final public class EnterMedicalReport {
	private static MyLogger LOGGER;

	private EnterMedicalReport() {

	}

	public static boolean enterMedicalReport(String patientUsername, String doctorUsername, String medicalReport,
			String treatment, String databaseUsername, String databasePassword)
			throws SQLException, IOException, InterruptedException {
		String view = "{CALL healthclinicpro.EnterMedicalReport(?, ?, ?, ?)}";

		// Validate and limit medical report size
		if (medicalReport.length() > 10) {
			System.out.println(
					"Medical report exceeds the allowed limit of 2000 characters. Please enter a shorter report.");
			return false;
		}

		try (Connection connection = DataBaseConnecter.createConnection("healthclinicpro", databaseUsername,
				databasePassword)) {
			try (CallableStatement callableStatement = connection.prepareCall(view)) {

				callableStatement.setString(1, patientUsername);
				callableStatement.setString(2, doctorUsername);
				callableStatement.setString(3, medicalReport);
				callableStatement.setString(4, treatment);

				callableStatement.execute();
				return true;
			} catch (SQLException e) {
				System.out.println("There is an issue with the entered data.");
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

}
