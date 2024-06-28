package healthcareproapplication;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

final public class RandomSGenerator {
	private static final Logger LOGGER = Logger.getLogger(RandomSGenerator.class.getName());
	private static final int SALT_LENGTH = 36;

	private RandomSGenerator() {

	}

	public static String generate() {
		try {
			// Use a cryptographically secure random number generator
			SecureRandom secureRandom = new SecureRandom();
			byte[] salt = new byte[SALT_LENGTH];
			secureRandom.nextBytes(salt);

			// Encode the salt as a Base64 string
			return Base64.getEncoder().encodeToString(salt);
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error generating salt", e);
			return null;
		}
	}

	public static String concatenatePasswordAndSalt(String password, String salt) {
		return password + salt;
	}
}
