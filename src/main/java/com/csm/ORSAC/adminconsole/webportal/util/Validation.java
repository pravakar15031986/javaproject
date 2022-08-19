package com.csm.ORSAC.adminconsole.webportal.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {

	private static Pattern pattern;
	private static Matcher matcher;

	// Name Validation
	public static boolean validateName(String name) {
		return name.matches("([a-zA-Z.'\\s]){3,60}");
	}

	// Email Validation
	public static boolean validateEmail(String email) {

		return email.matches("^([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
	}

	// Mobile Number validation
	public static boolean validateMobile(String mobile) {

		return mobile.matches("\\d{10,11}");
	}
}
