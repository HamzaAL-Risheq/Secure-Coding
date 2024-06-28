import com.code_intelligence.jazzer.api.*;

import login.IsEmployeeAuthenticatedSystem;
import login.IsPatientAuthenticatedSystem;
import medicalreport.EnterMedicalReport;
import java.io.IOException;
import java.sql.SQLException;


public class FuzzingTestTemplate {

	public static void fuzzerTestOneInput(FuzzedDataProvider data) {
		try (SilentCloseable unused = BugDetectors.allowNetworkConnections( (host, port) -> {
			return host.equals("localhost") && port == 3306;})) {

			testEmployeeLogin(data);
            testPatientLogin(data);
			testEnterMedicalReport(data);

		}catch(Exception e){
			System.out.println("Safaa");
			System.out.println(e);
		}
	}

	private static void testEmployeeLogin(FuzzedDataProvider data) {
		try {
			String employeeUsername = data.consumeString(10);
			String employeePassword = data.consumeString(10);

			String databaseUsername = data.consumeString(12);
			String databasePassword = data.consumeString(12);

			IsEmployeeAuthenticatedSystem.isEmployeeAuthenticated(employeeUsername, employeePassword, "Employee", "HEU445#$@we");

		} catch (SQLException | IOException | InterruptedException e) {
			System.out.println("Safaa2");
			System.out.println(e);
		}
	}

	private static void testPatientLogin(FuzzedDataProvider data) {

		try {
			String patientUsername = data.consumeString(10);
			String patientPassword = data.consumeString(10);

			String databaseUsername = data.consumeString(12);
			String databasePassword = data.consumeString(12);

			IsPatientAuthenticatedSystem.isPatientAuthenticated(patientUsername, patientPassword, "Patient", "PEN#$82");

		} catch (SQLException | IOException | InterruptedException e) {

		}
	}

	private static void testEnterMedicalReport(FuzzedDataProvider data) {

		try {

			String patientUsername = data.consumeString(10);
			String doctorUsername = data.consumeString(10);
			String medicalReport = data.consumeString(255);
			String treatment = data.consumeString(255);

			EnterMedicalReport.enterMedicalReport(patientUsername, doctorUsername, medicalReport, treatment, "Doctor",
					"S@#m378H");

		} catch (SQLException | IOException | InterruptedException e) {

		}
	}
}
