package demo;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import viewaccountinformation.Patient;

final public class MyLogger {
	final static Logger LOGGER = Logger.getLogger("MyLog");
	private MyLogger() {
		// The private constructor prevents the creation of an instance of 
		//the utility class using the new keyword. Since utility classes 
		//typically contain only static methods and should not maintain any state, 
		//it doesn't make sense to create instances of them.
	}
	static {
		try {
			FileHandler fh;
			String logFilePath = "logfile3.log";
			fh = new FileHandler(logFilePath, true);
			LOGGER.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);
			LOGGER.setUseParentHandlers(false);

			// Add shutdown hook to close the FileHandler
			Runtime.getRuntime().addShutdownHook(new Thread(() -> {
				if (fh != null) {
					fh.close();
				}
			}));
		} catch (IOException | SecurityException e) {
			System.out.println("The logging system has an error.");
		}
	}

	public static void writeToLog(String msg) {
		LOGGER.log(Level.INFO, msg);

	}

	public static void writeToLog(String msg, String msg2) {
		LOGGER.log(Level.INFO, msg, msg2);

	}

	public static void writeToLog(String msg, boolean msg2) {
		LOGGER.log(Level.INFO, msg, msg2);

	}

	public static void writeToLog(String msg, int msg2, String msg3) {
		if (LOGGER.isLoggable(Level.INFO))
			LOGGER.log(Level.INFO, "{0}: {1}, {2}", new Object[] { msg, msg2, msg3 });

	}

	public static void writeToLog(String msg, String msg2, String msg3) {
		if (LOGGER.isLoggable(Level.INFO))
			LOGGER.log(Level.INFO, "{0} {1} {2}", new Object[] { msg, msg2, msg3 });

	}

	public static void writeToLog(String msg, Exception e) {
		LOGGER.log(Level.WARNING, msg, e);

	}

	public static void writeToLog(String msg, String msg2, Patient patient) {
		if (LOGGER.isLoggable(Level.INFO))
			LOGGER.log(Level.INFO, " {0}: {1}, {2} ", new Object[] { msg, msg2, patient });
	}

	public static void writeToLog(String firstName, String middleName, String lastName, int age, String gender,
			String role, int employeeId, int numberOfPhoneNumbers, String newEmployeeUsername) {
		LOGGER.log(Level.INFO, "Employee Registration Information:" + "\n  First Name: {0}" + "\n  Middle Name: {1}"
				+ "\n  Last Name: {2}" + "\n  Age: {3}" + "\n  Gender: {4}" + "\n  Role: {5}" + "\n  Employee ID: {6}"
				+ "\n  Number of Phone Numbers: {7}" + "\n  New Employee Username: {8}",
				new Object[] { firstName, middleName, lastName, age, gender, role, employeeId, numberOfPhoneNumbers,
						newEmployeeUsername });
	}

	public static void writeToLog(String firstName, String middleName, String lastName, int age, String gender,
			String phoneNumber, int patientId, String newPatientUsername) {
		LOGGER.log(Level.INFO,
				"Patient Registration Information:" + "\n  First Name: {0}" + "\n  Middle Name: {1}"
						+ "\n  Last Name: {2}" + "\n  Age: {3}" + "\n  Gender: {4}" + "\n  Phone Number: {5}"
						+ "\n  Patient ID: {6}" + "\n  New Patient Username: {7}",
				new Object[] { firstName, middleName, lastName, age, gender, phoneNumber, patientId,
						newPatientUsername });
	}

}

// LOGGER.setUseParentHandlers(true);
//fh= new FileHandler(System.getProperty("user.home")+System.getProperty("file.separator")+"alog.log",true);
