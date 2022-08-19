package com.csm.ORSAC.adminconsole.webportal.config;



import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.crypto.password.PasswordEncoder;

public class MD5PasswordEncoder implements PasswordEncoder {


	private final Log logger = LogFactory.getLog(getClass());

	public MD5PasswordEncoder() {
		 // empty block
	}

	@Override
	public String encode(CharSequence rawPassword) {
		
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = md.digest(((String) rawPassword).getBytes());
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < bytes.length; i++) {
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
			generatedPassword = sb.toString().toUpperCase();
			generatedPassword=generatedPassword.toLowerCase();
		} catch (NoSuchAlgorithmException e) {
			logger.error("MD5PasswordEncoder::encode():"+e);
		}
		return generatedPassword;
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {

		if (encodedPassword == null || encodedPassword.length() == 0) {
			logger.warn("Empty encoded password");
			return false;
		}
		return checkPassword(rawPassword, encodedPassword);
	}

	private boolean checkPassword(CharSequence rawPassword, String encodedPassword) {
		boolean match = false;

		String pw = encode(rawPassword).toLowerCase().trim();

		
		String pw1 = encodedPassword.trim();

		if (pw1.equals(pw)) {
			match = true;
		} else {
			logger.info("MD5PasswordEncoder::checkPassword():Password Doesn't Match.");
			
		}
		return match;
	}
}
