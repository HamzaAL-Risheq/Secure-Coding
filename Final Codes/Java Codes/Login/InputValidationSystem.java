package login;

final public class InputValidationSystem {

	private InputValidationSystem() {

	}

	public static boolean inputValidation(String username, String password) {
		if (username == null || password == null) {
			return false;
		}

		if (username.trim().isEmpty() || password.trim().isEmpty()) {
			return false;
		}

		if (!username.matches("^[a-zA-Z0-9]*$") || !password.matches("^[a-zA-Z0-9]*$")) {
			return false;
		}

		int minUsernameLength = 5;
		int maxUsernameLength = 8;
		int minPasswordLength = 8;
		int maxPasswordLength = 8;

//		if (username.length() < minUsernameLength || username.length() > maxUsernameLength
//				|| password.length() < minPasswordLength || password.length() > maxPasswordLength) {
//			return false;
//		}
//
//		return true;
		// Simplified boolean return
		return !(username.length() < minUsernameLength || username.length() > maxUsernameLength
				|| password.length() < minPasswordLength || password.length() > maxPasswordLength);

	}

	public static void medicalReportLimit(String input) {
		if (input.length() <= 1000) {
			System.out.println("Entered!");
		} else {
			System.out.println("Input exceeds the maximum limit of 2000 characters. Please try again.");
		}
	}
}
