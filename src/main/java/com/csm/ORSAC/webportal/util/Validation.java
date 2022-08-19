package com.csm.ORSAC.webportal.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {

	private static Pattern pattern;
	private static Matcher matcher;

	public static boolean validatePassword(String password) {
		pattern = Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$.]).{8,20})");
		matcher = pattern.matcher(password);
		return matcher.matches();
	}

	public static boolean validateFileUpload(String fileName) {
		return fileName.matches("(^[a-zA-Z0-9\\_\\-\\ \\(\\)]+)+\\.(jpeg|png|jpg|JPEG|PNG|JPG|pdf|PDF)$");
	}

	public static boolean validatePdfFile(String fileName) {
		return fileName.matches("(^[a-zA-Z0-9\\_\\-\\ ]+)+\\.(pdf|PDF)$");
	}

	public static boolean validateImageFileUpload(String fileName) {
		return fileName.matches("(^[a-zA-Z0-9\\_\\-\\ ]+)+\\.(jpeg|png|jpg|JPEG|PNG|JPG|PDF|pdf)$");
	}

	public static boolean validateProfilePhotoUpload(String fileName) {
		return fileName.matches("(^[a-zA-Z0-9\\_\\-\\ ]+)+\\.(jpeg|png|jpg|JPEG|PNG|JPG)$");
	}

	public static boolean validateAdvisoryUpload(String fileName) {
		return fileName.matches("(^[a-zA-Z0-9\\_\\-\\ ]+)+\\.(pdf|doc|docx|PDF|DOC|DOCX)$");
	}

	public static boolean validateStartWithZero(String str) {
		return str.startsWith("0");
	}

	public static boolean validateName(String name) {
		return name.matches("([a-zA-Z\\.\\-'\\s]){3,60}"); // Name should be contain alphabets with . and -
	}

	public static boolean validateEmail(String email) {

		return email.matches("^([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6}$");
	}

	public static boolean validateMobile(String mobile) {

		return mobile.matches("\\d{6,15}");
	}

	public static boolean validateBlankSpacesInString(String name) {
		int count = 0;
		if (name.length() != 0) {
			for (int i = 0; i < name.length(); i++) {
				if (name.charAt(i) == ' ') {
					count++;
				}
			}
		}
		if (count > 0) {
			return false;
		} else {
			return true;
		}
	}

	public static boolean validateConsecutiveBlankSpacesInString(String name) {
		int count = 0;

		if (name.length() != 0) {

			for (int i = 0; i < name.length() && i + 1 < name.length(); i++) {

				if ((name.charAt(i) == ' ') && (name.charAt(i + 1) == ' ')) {

					count++;
				}

			}
		}
		if (count > 0) {
			return false;
		} else {
			return true;
		}
	}

	public static boolean validateFirstBlankSpace(String blankSpace) {
		if (blankSpace.charAt(0) == ' ') {
			return false;
		}
		return true;
	}

	public static boolean validateLastBlankSpace(String blankSpace) {
		int len = blankSpace.length();

		if (blankSpace.charAt(len - 1) == ' ') {
			return false;
		}
		return true;
	}

	public static boolean validateAlphaNumeric(String str) {
		return str.matches("^[a-zA-Z0-9]{2,50}$");

	}

	public static boolean validateUserName(String userName) {
		return userName.matches("^[a-zA-Z0-9_.-]{2,50}$");

	}

	public static boolean validateNumberOnly(String number) {
		return number.matches("^[0-9]+$");
	}

	public static boolean validateDecimalNumberOnly(String number) {
		return number.matches("^[0-9.]+$");
	}

	public static boolean validateAlphabatesOnly(String str) {
		return str.matches("^[a-zA-Z\\s]{1,50}$");
	}

	public static boolean validateUserAddress(String address) {
		return address.matches("^([a-zA-Z0-9\\s(:)#;/,.-]){0,200}$");
	}

	public static boolean validatePinNo(String str) {
		return str.matches("[a-zA-Z][0-9]{9}[a-zA-Z]");

	}

	public static boolean landLineNo(String str) {
		return str.matches("[0-9]{0,15}");

	}

	public static boolean isAlphanumeric(String str) {
		return str != null && str.matches("^[a-zA-Z\\s]{2,50}[0-9]{0,50}");
	}

	public static boolean UserName(String str) {
		return str.matches("^[a-zA-Z0-9_.-]{8,30}$");

	}

	public static boolean validateRaceName(String name) {
		return name.matches("([a-zA-Z.'\\s]){1,1}");
	}

	public static boolean validateXlslFile(String name) {
		return name.matches("(^[a-zA-Z0-9\\_\\-\\ ]+)+\\.(xlsx)$");
	}

	public static boolean validateSpecialCharAtFirstAndLast(String name) {
		int len = name.length();
		if (name.charAt(0) == '!' || name.charAt(0) == '@' || name.charAt(0) == '#' || name.charAt(0) == '$'
				|| name.charAt(0) == '&' || name.charAt(0) == '*' || name.charAt(0) == '(' || name.charAt(0) == ')') {
			return false;
		} else if (name.charAt(len - 1) == '!' || name.charAt(len - 1) == '@' || name.charAt(len - 1) == '#'
				|| name.charAt(len - 1) == '$' || name.charAt(len - 1) == '&' || name.charAt(len - 1) == '*'
				|| name.charAt(len - 1) == '(' || name.charAt(len - 1) == ')') {
			return false;
		}
		return true;
	}

	public static boolean validateQuestion(String str) {
		return str.matches("^[a-zA-Z0-9\\s]{1,200}$");

	}

	public static boolean validateLinkIcon(String str) {
		return str.matches("^[a-zA-Z0-9- ]{1,50}$");
	}

	public static boolean validateFileName(String str) {
		return str.matches("^[a-zA-Z.]{1,50}$");
	}

	public static boolean validateDemographyName(String str) {
		return str.matches("^[a-zA-Z0-9 ]{1,50}$");

	}

	public static boolean validateRoleName(String str) {
		return str.matches("^[a-zA-Z_]{1,50}$");
	}

	public static boolean validateRoleAlias(String str) {
		return str.matches("^[a-zA-Z\\s_]{1,50}$");
	}

	public static boolean validateOrgName(String str) {
		return str.matches("^[a-zA-Z\\s]{1,50}$");
	}

	public static boolean validateAdvisoryNo(String str) {
		return str.matches("^[a-zA-Z0-9]{0,50}$");

	}

	public static boolean validateFungicideQuantity(String str) {
		return str.matches("^(?:\\d*\\.\\d{1,2}|\\d+)$");

	}

	public static boolean validateInfectionsType(String str) {
		return str.matches("^[0-9;+-]+$");
	}

	public static boolean validateRace(String str) {
		return str.matches("^[a-zA-Z0-9-,_()]{0,50}$");
	}

	public static boolean validateVirulencePhenotype(String str) {
		return str.matches("^[a-zA-Z0-9(),-]{0,200}$");
	}

	public static boolean validateFungicideName(String str) {
		return str.matches("^[a-zA-Z0-9- ]{0,200}$");
	}
}
