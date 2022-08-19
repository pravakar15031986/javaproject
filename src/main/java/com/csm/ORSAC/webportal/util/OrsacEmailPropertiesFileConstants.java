package com.csm.ORSAC.webportal.util;

import java.util.ResourceBundle;

import com.csm.ORSAC.adminconsole.webportal.util.OrsacEmailPortalConstant;

public final class OrsacEmailPropertiesFileConstants {

	public static OrsacEmailPropertiesFileConstants theObject;

	public synchronized static OrsacEmailPropertiesFileConstants createWrsisEmailPropertiesFileConstants() {
		if (theObject == null)
			theObject = new OrsacEmailPropertiesFileConstants();
		return theObject;
	}

	private final ResourceBundle wrsisResourcesBundel;
	// mail integration

	public final String EMAIL_SMTPAUTH;
	public final String EMAIL_SMTPSTARTTLSENABLE;
	public final String EMAIL_SMTPHOST;
	public final String EMAIL_SMTPPORT;
	public final String EMAIL_IP;
	public final String EMAIL_PORT;
	public final String EMAIL_FROM;
	public final String EMAIL_PASSWORD;
	public final String EMAIL_SUBJECT_WRSIS;

	private OrsacEmailPropertiesFileConstants() {

		wrsisResourcesBundel = ResourceBundle.getBundle("email");

		// mail integration

		EMAIL_SMTPAUTH = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_SMTPAUTH).trim();
		EMAIL_SMTPSTARTTLSENABLE = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_SMTPSTARTTLSENABLE)
				.trim();
		EMAIL_SMTPHOST = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_SMTPHOST).trim();
		EMAIL_SMTPPORT = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_SMTPPORT).trim();
		EMAIL_IP = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_IP).trim();
		EMAIL_PORT = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_PORT).trim();
		EMAIL_FROM = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_FROM).trim();
		EMAIL_PASSWORD = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_PSWD).trim();
		EMAIL_SUBJECT_WRSIS = wrsisResourcesBundel.getString(OrsacEmailPortalConstant.EMAIL_SUBJECT_WRSIS).trim();

	}

}
