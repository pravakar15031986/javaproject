package com.csm.ORSAC.adminconsole.webportal.util;

import java.security.SecureRandom;

public class OrsacUtillity {

	public static String generatePassword() {
		String password = null;

		password = getAlphaNumericString(6);

		return password;
	}

	// function to generate a random string of length n
	static String getAlphaNumericString(int n) {

		// chose a Character random from this String
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

		// create StringBuffer size of AlphaNumericString

		StringBuilder sb1 = new StringBuilder(n);

		SecureRandom random = new SecureRandom();

		for (int i = 0; i < n; i++) {

			// generate a random number between
			// 0 to AlphaNumericString variable length

			int index1 = random.nextInt(AlphaNumericString.length());

			// add Character one by one in end of sb

			sb1.append(AlphaNumericString.charAt(index1));

		}
		return sb1.toString();
	}

}
