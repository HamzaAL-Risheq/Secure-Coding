package testing;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import login.IsPatientAuthenticatedSystem;

final public class PatientLoginTest {

	private IsPatientAuthenticatedSystem authenticationSystem;

	

	@Test
	public void testUnregisteredUsername() {
		// Given an invalid username
		boolean result = true;
		try {
			result = authenticationSystem.isPatientAuthenticated("Hamza", "H##43USt", "Patient", "PEN#$82");
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
			result = authenticationSystem.isPatientAuthenticated("HHH", "H##43USt", "Patient", "PEN#$82");
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
			result = authenticationSystem.isPatientAuthenticated("ho8", "H##43USt", "Patient", "PEN#$82");
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
			result = authenticationSystem.isPatientAuthenticated("", "H##43USt", "Patient", "PEN#$82");
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
			result = authenticationSystem.isPatientAuthenticated("HHH", "", "Patient", "PEN#$82");
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
			result = authenticationSystem.isPatientAuthenticated("", "", "Patient", "PEN#$82");
			assertFalse("Authentication should fail for empty username and password", result);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testNullUsername() {
		// Given null username and password
		boolean result = true;
		try {
			result = authenticationSystem.isPatientAuthenticated(null, "H##43USt", "Patient", "PEN#$82");
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
			result = authenticationSystem.isPatientAuthenticated("HHH", null, "Patient", "PEN#$82");
			assertFalse("Authentication should fail for null username and password", result);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testNullUsernameAndPassword() {
		// Given null username and password
		boolean result = true;
		try {
			result = authenticationSystem.isPatientAuthenticated(null, null, "Patient", "PEN#$82");
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
			result = authenticationSystem.isPatientAuthenticated("HHH", "H##43USt", "Enployee", "HEU445#$@we");
			assertFalse("Authentication should fail for invalid database credentials", result);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testValidCredentialsAndUserRole() {
		// Given valid credentials, check the correct user role is returned

		try {
			authenticationSystem.isPatientAuthenticated("HHH", "H##43USt", "Patient", "PEN#$82");
			assertEquals("Patient", authenticationSystem.getUserRole());

		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testInvalidUserRole() {
		// Given valid credentials, but the expected user role is incorrect
		
		try {
			authenticationSystem.isPatientAuthenticated("HHH", "H##43USt", "Patient", "PEN#$82");
			assertNotEquals("Doctor", authenticationSystem.getUserRole());
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();

		}
	}

	@Test
	public void testMultipleConsecutiveAuthentications() {
		// Perform multiple consecutive authentications with the same credentials
		boolean result1 = false;
		boolean result2 = false;
		try {
			result1 = authenticationSystem.isPatientAuthenticated("HHH", "H##43USt", "Patient", "PEN#$82");
			result2 = authenticationSystem.isPatientAuthenticated("AAA", "A##43USt", "Patient", "PEN#$82");
			assertTrue("Authentication should succeed for the first attempt", result1);
			assertFalse("Authentication should not succeed for the second attempt", result2);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();
		}

	}

	@Test
	public void testMultipleConsecutiveAuthentications2() {
		// Perform multiple consecutive authentications with the same credentials
		boolean result1 = false;
		boolean result2 = false;
		try {
			result1 = authenticationSystem.isPatientAuthenticated("HHH", "H##43USt", "Patient", "PEN#$82");
			result2 = authenticationSystem.isPatientAuthenticated("ooo", "H##43USt", "Patient", "PEN#$82");
			assertTrue("Authentication should succeed for the first attempt", result1);
			assertTrue("Authentication should succeed for the second attempt", result2);
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
			result1 = authenticationSystem.isPatientAuthenticated("eee", "H##43USt", "Employee", "HEU445#$@we");
			result2 = authenticationSystem.isPatientAuthenticated("ooo", "H##43USt", "Employee", "HEU445#$@we");
			assertFalse("Authentication should succeed for the first attempt", result1);
			assertFalse("Authentication should succeed for the second attempt", result2);
		} catch (SQLException | IOException | InterruptedException e) {

			e.printStackTrace();
		}

	}

	@Test
	public void testEmptyDatabaseCredentials() {
		// Given empty database credentials
		boolean result = true;
		try {
			result = authenticationSystem.isPatientAuthenticated("HHH", "H##43USt", "", "");
			assertFalse("Authentication should fail for empty database credentials", result);
		} catch (SQLException | IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}

}
