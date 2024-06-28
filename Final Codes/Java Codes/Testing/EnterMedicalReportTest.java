package testing;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import medicalreport.EnterMedicalReport;

final public class EnterMedicalReportTest {

	
	@Test
	public void testEnterMedicalReport() {
		// Test with valid data
		boolean result = false;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", "Doctor",
					"S@#m378H");
			assertTrue("Succsful added.", result);

		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}
	}

	@Test
	public void testEnterMedicalReportEmptyPatientUsername() {
		// Test with empty patientUsername
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("", "S378", "Valid", "Prescription", "Doctor", "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());

		}

	}

	@Test
	public void testEnterMedicalReportEmptyDoctorUsername() {
		// Test with empty doctorUsername
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "", "Valid", "Prescription", "Doctor", "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}
	}

	@Test
	public void testEnterMedicalReportEmptyDoctorUsernameAndPatientUsername() {
		// Test with empty doctorUsername and patientUsername
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("", "", "Valid", "Prescription", "Doctor", "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}
	}

	@Test
	public void testEnterMedicalReportNullDoctorUsername() {
		// Test with null doctorUsername
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", null, "Valid", "Prescription", "Doctor", "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}
	}

	@Test
	public void testEnterMedicalReportNullPatientUsername() {
		// Test with null patientUsername
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport(null, "S378", "Valid", "Prescription", "Doctor", "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}
	}

	@Test
	public void testEnterMedicalReportNullPatientAndDoctorUsername() {
		// Test with null patient and doctor username
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport(null, null, "Valid", "Prescription", "Doctor", "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}
	}

	@Test
	public void testEnterMedicalReportExceedingLimit() {
		// Test with medicalReport exceeding the allowed limit
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Very long medical report……", "Prescription",
					"Doctor", "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}

	@Test
	public void testEnterMedicalReportWithWrongDatabaseUsername() {
		// Enter Medical Report with Wrong Database Username
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", "Employee",
					"S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}

	@Test
	public void testEnterMedicalReportWithWrongDatabasePassword() {
		// Enter Medical Report with Wrong Database Password
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", "Employee",
					"S@#m333378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}

	@Test
	public void testEnterMedicalReportWithNullDatabaseUsername() {
		// Enter Medical Report with Null Database Username
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", null, "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}

	@Test
	public void testEnterMedicalReportWithNullDatabasePassword() {
		// Enter Medical Report with Null Database password
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", "Doctor", null);
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}

	@Test
	public void testEnterMedicalReportWithNullDatabasePasswordAndUsername() {
		// Enter Medical Report with Null Database password and username
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", null, null);
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}

	@Test
	public void testEnterMedicalReportWithEmptyDatabaseUsername() {
		// Enter Medical Report with Database password and username
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", "", "S@#m378H");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}

	@Test
	public void testEnterMedicalReportWithEmptyDatabasePassword() {
		// Enter Medical Report with Database password and username
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", "Doctor", "");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}

	@Test
	public void testEnterMedicalReportWithEmptyDatabasePasswordAndUsername() {
		// Enter Medical Report with Database password and username
		boolean result = true;
		try {
			result = EnterMedicalReport.enterMedicalReport("HHH", "S378", "Valid", "Prescription", "", "");
			assertFalse("Ensure that the provided data meets the required constraints.", result);
		} catch (SQLException | IOException | InterruptedException e) {
			fail("Unexpected SQLException: " + e.getMessage());
		}

	}
}
/*
 * assertThrows(SQLException.class, () -> { ... }): This method is part of the
 * JUnit framework. It asserts that the provided lambda expression (the second
 * parameter) throws an exception of the specified type (SQLException in this
 * case).
 */
