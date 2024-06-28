package demo;

final public class Users {
	private Users() {

	}

	public static String getEnvironmentVariable(String variableName) {

		if ("Employee".equalsIgnoreCase(variableName))
			return System.getenv("Employee");

		else if ("Register".equalsIgnoreCase(variableName))
			return System.getenv("Register");

		else if ("Doctor".equalsIgnoreCase(variableName))
			return System.getenv("Doctor");

		else if ("Patient".equalsIgnoreCase(variableName))
			return System.getenv("Patient");

		else
			System.out.println("Invalid input!");

		return null;
	}

}
