package login;

import java.io.IOException;
import java.sql.SQLException;

import demo.MyLogger;

final public class Login {
	private static MyLogger LOGGER;

	private Login() {

	}

	public static String employeeLogin(String username, String password, String databaseUsername, String databasePassword)
			throws SQLException, IOException, InterruptedException {

		String sanitizedUsername = InputSanitizationSystem.sanitizeInput(username);
		String sanitizedPassword = InputSanitizationSystem.sanitizeInput(password);

		if (!InputValidationSystem.inputValidation(username, password) == false) {
			print("Invalid username or password.");
			return null;
		} else {
			try {
				if (IsEmployeeAuthenticatedSystem.isEmployeeAuthenticated(sanitizedUsername, sanitizedPassword,
						databaseUsername, databasePassword)) {
					return IsEmployeeAuthenticatedSystem.getUserRole();

				} else {
					print("Invalid username or password.12");
					return null;
				}
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

	public static boolean patientLogin(String username, String password, String position, String databaseUsername,
			String databasePassword) throws SQLException, IOException, InterruptedException {

		String sanitizedUsername = InputSanitizationSystem.sanitizeInput(username);
		String sanitizedPassword = InputSanitizationSystem.sanitizeInput(password);

		if (!InputValidationSystem.inputValidation(username, password) == false) {
			print("Invalid u111sername or password.");
			return false;
		} else {
			try {
				if (IsPatientAuthenticatedSystem.isPatientAuthenticated(sanitizedUsername, sanitizedPassword,
						databaseUsername, databasePassword)) {
					if (IsPatientAuthenticatedSystem.getUserRole().equalsIgnoreCase(position))
						return true;
					else {
						print("Invalid username or password.2");
						return false;
					}

				} else {
					print("Invalid username or password.3");
					return false;
				}
			} catch (NullPointerException | SQLException e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Sorry We got Enternal Error!");
				return false;
			} catch (Exception e) {
				LOGGER.writeToLog("Error during database connection", e);
				System.out.println("Sorry We got Enternal Error!");
				return false;
			}
		}

	}

	public static void print(String statement) {
		System.out.println(statement);
	}

}
