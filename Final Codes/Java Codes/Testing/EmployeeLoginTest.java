package testing;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import login.IsEmployeeAuthenticatedSystem;

final public class EmployeeLoginTest {

	private IsEmployeeAuthenticatedSystem authenticationSystem;

	

	@Test
	public void testUnregisteredUsername() {
		// Given an unregistered username
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("Hamza", "H##43USt", "Employee", "HEU445#$@we");
			assertFalse("Authentication should fail for unregistered username", result);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();
		}

	}

	@Test
	public void testValidUsernameAndPassword() {
		// Given a valid username and password
		boolean result = false;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("HO8", "H##43USt", "Employee", "HEU445#$@we");
			assertTrue("Authentication should succeed for registered username and valid credentials", result);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();

		}
	}

	@Test
	public void testValidUsernameInvalidPassword() {
		// Given a valid username and an invalid password
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("ho8", "H##43USt", "Employee", "HEU445#$@we");
			assertFalse("Authentication should fail for registered username and invalid password", result);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testEmptyUsername() {
		// Given empty username and password
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("", "H##43USt", "Employee", "HEU445#$@we");
			assertFalse("Authentication should fail for empty username and password", result);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();

		}
	}

	@Test
	public void testEmptyPassword() {
		// Given empty username and password
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("HO8", "", "Employee", "HEU445#$@we");
			assertFalse("Authentication should fail for empty username and password", result);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testEmptyUsernameAndPassword() {
		// Given empty username and password
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("", "", "Employee", "HEU445#$@we");
			assertFalse("Authentication should fail for empty username and password", result);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testNullUsernameAndPassword() {
		// Given null username and password
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated(null, null, "Employee", "HEU445#$@we");
			assertFalse("Authentication should fail for null username and password", result);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testNullUsername() {
		// Given null username and password
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated(null, "H##43USt", "Employee", "HEU445#$@we");
			assertFalse("Authentication should fail for null username and password", result);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testNullPassword() {
		// Given null username and password
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("HO8", null, "Employee", "HEU445#$@we");
			assertFalse("Authentication should fail for null username and password", result);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testInvalidDatabaseCredentials() {
		// Given invalid database credentials
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("HO8", "H##43USt", "InvalidUser", "InvalidPass");
			assertFalse("Authentication should fail for invalid database credentials", result);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testValidCredentialsAndUserRole1() {
		// Given valid credentials, check the correct user role is returned
		try {
			authenticationSystem.isEmployeeAuthenticated("HO8", "H##43USt", "Employee", "HEU445#$@we");
			assertEquals("Register", authenticationSystem.getUserRole());
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testValidCredentialsAndUserRole2() {
		// Given valid credentials, check the correct user role is returned
		try {
			authenticationSystem.isEmployeeAuthenticated("S378", "H##43USt", "Employee", "HEU445#$@we");
			assertEquals("Doctor", authenticationSystem.getUserRole());
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testInvalidUserRole1() {
		// Given valid credentials, but the expected user role is incorrect
		try {
			authenticationSystem.isEmployeeAuthenticated("S378", "H##43USt", "Employee", "HEU445#$@we");
			assertNotEquals("The user role should not be Manager", "Manager", authenticationSystem.getUserRole());
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testInvalidUserRole2() {
		// Given valid credentials, but the expected user role is incorrect
		try {
			authenticationSystem.isEmployeeAuthenticated("HO8", "H##43USt", "Employee", "HEU445#$@we");
			assertNotEquals("The user role should not be Manager", "Manager", authenticationSystem.getUserRole());
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();

		}
	}

	@Test
	public void testMultipleConsecutiveAuthentications() {
		// Perform multiple consecutive authentications
		boolean result1 = false;
		boolean result2 = false;

		try {
			result1 = authenticationSystem.isEmployeeAuthenticated("HO8", "H##43USt", "Employee", "HEU445#$@we");
			result2 = authenticationSystem.isEmployeeAuthenticated("S378", "H##43USt", "Employee", "HEU445#$@we");
			assertTrue("Authentication should succeed for the first attempt", result1);
			assertTrue("Authentication should succeed for the second attempt", result2);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}

	}

	@Test
	public void testMultipleConsecutiveAuthentications2() {
		// Perform multiple consecutive authentications
		boolean result1 = false;
		boolean result2 = true;

		try {
			result1 = authenticationSystem.isEmployeeAuthenticated("HO8", "H##43USt", "Employee", "HEU445#$@we");
			result2 = authenticationSystem.isEmployeeAuthenticated("ooo", "H##43USt", "Employee", "HEU445#$@we");
			assertTrue("Authentication should succeed for the first attempt", result1);
			assertFalse("Authentication should succeed for the second attempt", result2);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}

	}

	@Test
	public void testMultipleConsecutiveAuthentications3() {
		// Perform multiple consecutive authentications
		boolean result1 = true;
		boolean result2 = true;

		try {
			result1 = authenticationSystem.isEmployeeAuthenticated("eee", "H##43USt", "Employee", "HEU445#$@we");
			result2 = authenticationSystem.isEmployeeAuthenticated("ooo", "H##43USt", "Employee", "HEU445#$@we");
			assertFalse("Authentication should succeed for the first attempt", result1);
			assertFalse("Authentication should succeed for the second attempt", result2);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}

	}

	@Test
	public void testEmptyDatabaseCredentials1() {
		// Given empty database credentials
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("HO8", "H##43USt", "", "");
			assertFalse("Authentication should fail for empty database credentials", result);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}
	}

	@Test
	public void testEmptyDatabaseCredentials2() {
		// Given empty database credentials
		boolean result = true;
		try {
			result = authenticationSystem.isEmployeeAuthenticated("S378", "H##43USt", "", "");
			assertFalse("Authentication should fail for empty database credentials", result);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();

		}
	}
}
