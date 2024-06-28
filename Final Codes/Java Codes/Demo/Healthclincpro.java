/*
 * Demo class represents a simple healthcare clinic application.
 * Users can log in as employees or patients, perform various tasks,
 * such as viewing account information, medical reports, and registering
 * patients or employees.
 *
 * Functionality:
 * 	- Login as an employee or patient
 * 	- View account information
 * 	- View medical reports
 * 	- Enter new medical reports
 * 	- Register new patients and employees
 *
 * Usage:
 * The application serves as a basic healthcare management system
 * with user authentication, information retrieval, and registration features.
 * 
 * @author Hamza.Osama
 * 
 */
package demo;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Scanner;

import login.Login;
import medicalreport.EnterMedicalReport;
import medicalreport.Medical;
import medicalreport.ViewMedicalReport;
import registering.CreateEmployeeCredentials;
import registering.CreatePatientCredentials;
import registering.RegisterEmployee;
import registering.RegisterPatient;
import viewaccountinformation.Employee;
import viewaccountinformation.Patient;
import viewaccountinformation.ViewEmployeeInformation;
import viewaccountinformation.ViewPatientAccountInformation;
import login.InputValidationSystem;

public final class Healthclincpro {

	private static Scanner input = new Scanner(System.in);
	private static String username;
	private static int options = -1;
	private static String databaseUsername;
	private static String databasePassword;
	private static String userPosition;

	private Healthclincpro() {

	}

	public static void main(String[] args) throws SQLException, IOException, InterruptedException {
		try {

			print("Please indicate your position: Are you an employee or a patient?");
			userPosition = getUserInput();

			MyLogger.writeToLog("Entered position is: {0}", userPosition);

			databasePassword = Users.getEnvironmentVariable(userPosition);

			if ("Employee".equalsIgnoreCase(userPosition))
				databaseUsername = "Employee";

			else if ("Patient".equalsIgnoreCase(userPosition))
				databaseUsername = "Patient";

			MyLogger.writeToLog("The used database username and passowrd are: {0}, {1}", databaseUsername,
					databasePassword);

			String employeeRole = null;
			String password = "";

			boolean flag = false;

			for (int i = 0; i < 3; i++) {
				print("Please enter your credentials:");
				print("Username:");
				username = getUserInput();
				print("Password:");
				password = getUserInput();

				MyLogger.writeToLog("Username:" + username);
				MyLogger.writeToLog("Username:" + password);

				if ("Employee".equalsIgnoreCase(userPosition)) {
					employeeRole = Login.employeeLogin(username, password, databaseUsername, databasePassword);
					MyLogger.writeToLog("Employee role is: {0}", employeeRole);

					MyLogger.writeToLog("The used user username and passowrd are: {0}, {1}", username, password);

					if (employeeRole != null)
						flag = true;

				} else if ("Patient".equalsIgnoreCase(userPosition))
					flag = Login.patientLogin(username, password, userPosition, databaseUsername, databasePassword);
				MyLogger.writeToLog("The used user username and passowrd are: {0}, {1}", username, password);

				if (flag) {
					MyLogger.writeToLog("Successful  Login: {0}", flag);
					break;

				} else {
					MyLogger.writeToLog("Unsuccessful  Login: {0}", flag);

				}

			}
			if (!flag) {
				System.exit(0);
			}
			while (true) {
				if (employeeRole != null && "Doctor".equals(employeeRole)) {

					databasePassword = Users.getEnvironmentVariable("Doctor");
					databaseUsername = "Doctor";

					MyLogger.writeToLog("Employee role: {0}", employeeRole);
					MyLogger.writeToLog("Employee database username and password: {0}", databasePassword,
							databaseUsername);

					handleDoctorOptions(username);
				}

				else if (employeeRole != null && "Register".equals(employeeRole)) {

					databasePassword = Users.getEnvironmentVariable("Register");
					databaseUsername = "Register";

					MyLogger.writeToLog("Employee role: {0}", employeeRole);
					MyLogger.writeToLog("Employee database username and password: {0}", databasePassword,
							databaseUsername);

					handleRegisterOptions(username);
				}

				else if ("Patient".equalsIgnoreCase(userPosition)
						&& Login.patientLogin(username, password, userPosition, databaseUsername, databasePassword)) {

					MyLogger.writeToLog("Employee database username and password: {0}", databasePassword,
							databaseUsername);

					handlePatientOptions(username);
				}
			}

		} catch (SQLException e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
		}
	}

	// Handle options for patients
	private static void handlePatientOptions(String username) throws SQLException {
		try {
			MyLogger.writeToLog("Handling  options for patient: " + username);

			print("Choose one of the following options by entering the corresponding number:");
			print("0. Exit the application");
			print("1. View account information");
			print("2. View medical report");
			options = Integer.parseInt(getUserInput());
			MyLogger.writeToLog("The entered option is {0} by {1}: ", options, username);

			switch (options) {
			case 1 -> {
				Patient patient = ViewPatientAccountInformation.viewAccountInformation(username, databaseUsername,
						databasePassword);
				MyLogger.writeToLog("Return result from ViewPatientAccountInformation for this username", username,
						patient);

				print(patient.toString());
			}
			case 2 -> viewMedicalReport();
			case 0 -> {

				System.exit(0);
			}
			default -> print("Invalid option. Please enter a valid number.");
			}
		} catch (Exception e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");

		} finally {
			if (options == 0)
				closeResources();
		}
	}

	// Handle options for registration
	private static void handleRegisterOptions(String username) throws SQLException {
		try {
			MyLogger.writeToLog("Handling registration options for user: " + username);

			print("Choose one of the following options by entering the corresponding number:");
			print("0. Exit the application");
			print("1. View account information");
			print("2. Enter patient information");
			print("3. Enter employee information");
			options = Integer.parseInt(getUserInput());
			MyLogger.writeToLog("The entered option is {0} by {1}: ", options, username);

			switch (options) {
			case 1 -> viewEmployeeAccountInformation();
			case 2 -> registerPatient();
			case 3 -> registerEmployee();
			case 0 -> {

				System.exit(0);
			}
			default -> print("Invalid option. Please enter a valid number.");
			}
			MyLogger.writeToLog("Registration options handled successfully.");
		} catch (Exception e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");

		} finally {
			if (options == 0)
				closeResources();
		}
	}

	// Handle options for doctors
	private static void handleDoctorOptions(String username) throws SQLException {
		try {
			MyLogger.writeToLog("Handling options for Doctor: " + username);
			print("Choose one of the following options by entering the corresponding number:");
			print("0. Exit the application");
			print("1. View account information");
			print("2. View medical report");
			print("3. Enter medical report");
			options = Integer.parseInt(getUserInput());
			MyLogger.writeToLog("The entered option is {0} by {1}: ", options, username);

			switch (options) {
			case 1 -> viewEmployeeAccountInformation();
			case 2 -> {
				print("Enter patient username");
				String patientUsername = getUserInput();
				MyLogger.writeToLog("Viewing medical report for patient: " + patientUsername);
				viewMedicalReport();
				MyLogger.writeToLog("Medical report viewed successfully.");

			}
			case 3 -> {
				print("Enter medical report");
				String medicalreport = getUserInput();

				InputValidationSystem.medicalReportLimit(medicalreport);
				print("Enter the treatment");
				String treatment = getUserInput();
				print("Enter the patient username");
				String patientUsername = getUserInput();

				EnterMedicalReport.enterMedicalReport(patientUsername, username, medicalreport, treatment,
						databaseUsername, databasePassword);
				MyLogger.writeToLog("The entered patient user for new medical report" + ": " + patientUsername);
				MyLogger.writeToLog("The entered medical report is: " + medicalreport);

			}
			case 0 -> {

				System.exit(0);
			}
			default -> print("Invalid option. Please enter a valid number.");
			}
			MyLogger.writeToLog("Doctor options handled successfully.");
		} catch (Exception e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");

		} finally {
			if (options == 0)
				closeResources();
		}

	}

	// Register a new employee
	private static void registerEmployee() throws SQLException {
		try {
			MyLogger.writeToLog("Registering a new employee.");

			print("Enter employee first name:");
			String employeeFirstName = getUserInput();
			print("Enter employee middle name:");
			String employeeMiddleName = getUserInput();
			print("Enter employee last name:");
			String employeeLastName = getUserInput();
			print("Enter employee age:");
			int age = Integer.parseInt(getUserInput());
			print("Enter employee gender: Female or Male");
			String gender = getUserInput();
			if (!"female".equalsIgnoreCase(gender))
				return;
			else if (!"male".equalsIgnoreCase(gender))
				return;
			print("Enter employee role:");
			String role = getUserInput();
			int employeeId = RegisterEmployee.registerEmployee(employeeFirstName, employeeMiddleName, employeeLastName,
					age, gender, role, databaseUsername, databasePassword);

			print("How many phone numbers does the employee have?\r\n");
			int numberOfPhoneNumbers = Integer.parseInt(getUserInput());

			print("Enter username for the employee:");
			String newEmployeeUsername = getUserInput();
			print("Enter passowrd for the employee:");
			String newEmployeePassword = getUserInput();

//			CreateEmployeeCredentials newUser = new CreateEmployeeCredentials();
			CreateEmployeeCredentials.createUsername(newEmployeeUsername, newEmployeePassword, employeeId,
					databaseUsername, databasePassword);

			MyLogger.writeToLog(employeeFirstName, employeeMiddleName, employeeLastName, age, gender, role, employeeId,
					numberOfPhoneNumbers, newEmployeeUsername);

			for (int i = 0; i < numberOfPhoneNumbers; i++) {
				String phoneNumber;
				do {
					print("Enter the phone number (numeric only):");
					phoneNumber = getUserInput();
				} while (!isNumeric(phoneNumber) && !isValidPhoneNumber(phoneNumber));

				RegisterEmployee.registerPhoneNumber(phoneNumber, databaseUsername, databasePassword);
			}

			MyLogger.writeToLog("Employee registered successfully.");

		} catch (Exception e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
		} finally {
			if (options == 0)
				closeResources();
		}
	}

	// Register a new patient
	private static void registerPatient() throws SQLException {
		try {
			MyLogger.writeToLog("Registering a new patient.");

//			RegisterPatient patient = new RegisterPatient();
			print("Enter patient first name:");
			String patientFirstName = getUserInput();
			print("Enter patient middle name:");
			String patientMiddleName = getUserInput();
			print("Enter patient last name:");
			String patientLastName = getUserInput();
			print("Enter patient age:");
			int age = Integer.parseInt(getUserInput());
			print("Enter patient gender: Female or Male");
			String gender = getUserInput();
			if (!"female".equalsIgnoreCase(gender))
				return;
			else if (!"male".equalsIgnoreCase(gender))
				return;
			print("Enter patient phone number:");
			String phoneNumber;
			do {
				phoneNumber = getUserInput();
			} while (!isNumeric(phoneNumber) && !isValidPhoneNumber(phoneNumber));
			int patientId = RegisterPatient.registerPatient(patientFirstName, patientMiddleName, patientLastName, age,
					gender, phoneNumber, databaseUsername, databasePassword);

			print("Enter username for the patient:");
			String newPatientUsername = getUserInput();
			print("Enter passowrd for the patient:");
			String newPatientPassword = getUserInput();

//			CreatePatientCredentials newUser = new CreatePatientCredentials();
			CreatePatientCredentials.createUsername(newPatientUsername, newPatientPassword, patientId, databaseUsername,
					databasePassword);
			MyLogger.writeToLog(patientFirstName, patientMiddleName, patientLastName, age, gender, phoneNumber,
					patientId, newPatientUsername);

			MyLogger.writeToLog("Patient registered successfully.");

		} catch (Exception e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");

		} finally {
			if (options == 0)
				closeResources();
		}
	}

	private static boolean isValidPhoneNumber(String phoneNumber) {
		return phoneNumber.matches("\\d{10}");
	}

	// View employee account information
	private static void viewEmployeeAccountInformation() throws SQLException {
		try {
			Employee employeeInfo = ViewEmployeeInformation.viewAccountInformation(username, databaseUsername,
					databasePassword);
			print(employeeInfo.toString());
		} catch (Exception e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
		}
	}

	private static void viewMedicalReport() throws SQLException {
		try {
			Medical medicalReport = ViewMedicalReport.viewMedicalReport(username, databaseUsername, databasePassword);
			print(medicalReport.toString());
		} catch (Exception e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
		}
	}

	// Generic print method
	private static <T> void print(T statement) {
		System.out.println(statement);
	}

	// Get user input
	public static <T> T getUserInput() {

		return (T) input.nextLine();

	}

	private static void closeResources() {
		if (input != null) {
			input.close();
		}
	}

	// Check if a string is numeric
	private static boolean isNumeric(String input) {
		try {
			Integer.parseInt(input);
			return true;
		} catch (NumberFormatException e) {
			MyLogger.writeToLog("Error during database connection", e);
			System.out.println("Sorry, We got an Internal Error!");
			return false;
		}
	}

}