package login;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

final public class InputSanitizationSystem {

	private InputSanitizationSystem() {
		
	}
	public static String sanitizeInput(String input) {
		if (input == null)
			return null;

		// Remove angle brackets
		String sanitizedInput = input.replaceAll("<", "").replaceAll(">", "");
		sanitizedInput = input.replaceAll("&lt;", "").replaceAll("&gt;", "");

		// Remove script tags
		sanitizedInput = removeScriptTags(sanitizedInput);

		// Remove JavaScript events
		sanitizedInput = removeJavaScriptEvents(sanitizedInput);

		// Remove JavaScript in href attribute
		sanitizedInput = removeJavaScriptInHref(sanitizedInput);

		return sanitizedInput;
	}

	private static String removeScriptTags(String input) {
		Pattern scriptPattern = Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE);
		Matcher matcher = scriptPattern.matcher(input);

		return matcher.replaceAll("");

	}

	private static String removeJavaScriptEvents(String input) {
		Pattern eventPattern = Pattern.compile("on\\w+\\s*=\\s*(['\"(])", Pattern.CASE_INSENSITIVE);
		Matcher matcher = eventPattern.matcher(input);

		return matcher.replaceAll("");

	}

	private static String removeJavaScriptInHref(String input) {
		Pattern hrefPattern = Pattern.compile("href\\s*=\\s*(['\"]?)\\s*javascript:", Pattern.CASE_INSENSITIVE);
		Matcher matcher = hrefPattern.matcher(input);

		return matcher.replaceAll("");
	}
}
