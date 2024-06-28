package registering;

import java.security.SecureRandom;
import java.util.Base64;

final public class RandomSGenerator {
	private static final int SALT_LENGTH = 36;

	private RandomSGenerator() {

	}

	public static String generate() {
		// Use a cryptographically secure random number generator
		SecureRandom secureRandom = new SecureRandom();
		byte[] salt = new byte[SALT_LENGTH];
		secureRandom.nextBytes(salt);

		// Encode the salt as a Base64 string
		return Base64.getEncoder().encodeToString(salt);

	}

	public static String concatenatePasswordAndSalt(String password, String salt) {
		return password + salt;
	}
}
