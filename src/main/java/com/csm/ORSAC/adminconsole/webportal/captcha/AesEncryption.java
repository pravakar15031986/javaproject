package com.csm.ORSAC.adminconsole.webportal.captcha;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * AES-GCM inputs - 12 bytes IV, need the same IV and secret keys for encryption and decryption.
 * <p>
 * The output consist of iv, password's salt, encrypted content and auth tag in the following format:
 * output = byte[] {i i i s s s c c c c c c ...}
 * <p>
 * i = IV bytes
 * s = Salt bytes
 * c = content bytes (encrypted content)
 */
public class AesEncryption {
	
	public static final Logger LOG = LoggerFactory.getLogger(AesEncryption.class);

	//@Value("${aes.enc.pswd}")
	private static final String AES_ENC_PSWD="wrsisdotcom";
		
    private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";

    private static final int TAG_LENGTH_BIT = 128; 
    private static final int IV_LENGTH_BYTE = 12;
    private static final int SALT_LENGTH_BYTE = 16;
    private static final Charset UTF_8 = StandardCharsets.UTF_8;

    // return a base64 encoded AES encrypted text
    public static String encrypt(String rText) {
    	 String encText = "..";
    	try {
	    	byte[] pText =rText.getBytes(UTF_8);
	        // 16 bytes salt
	        byte[] salt = CryptoUtils.getRandomNonce(SALT_LENGTH_BYTE);
	
	        // GCM recommended 12 bytes iv?
	        byte[] iv = CryptoUtils.getRandomNonce(IV_LENGTH_BYTE);
	
	        // secret key from password
	        SecretKey aesKeyFromPassword = CryptoUtils.getAESKeyFromPassword(AES_ENC_PSWD.toCharArray(), salt);
	
	        Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
	
	        // ASE-GCM needs GCMParameterSpec
	        cipher.init(Cipher.ENCRYPT_MODE, aesKeyFromPassword, new GCMParameterSpec(TAG_LENGTH_BIT, iv));
	
	        byte[] cipherText = cipher.doFinal(pText);
	
	        // prefix IV and Salt to cipher text
	        byte[] cipherTextWithIvSalt = ByteBuffer.allocate(iv.length + salt.length + cipherText.length)
	                .put(iv)
	                .put(salt)
	                .put(cipherText)
	                .array();
	     // string representation, base64, send this string to other for decryption.
	        encText=Base64.getEncoder().encodeToString(cipherTextWithIvSalt);
    	}catch (Exception e) {
    		LOG.error("AesEncryption::encrypt():"+e);
		}
        
        return  encText;

    }

    // we need the same password, salt and iv to decrypt it
    public static String decrypt(String cText) {
    	String rawText = "";
    	try {
	    	byte[] decode = Base64.getDecoder().decode(cText.getBytes(UTF_8));
	
	        // get back the iv and salt from the cipher text
	        ByteBuffer bb = ByteBuffer.wrap(decode);
	
	        byte[] iv = new byte[IV_LENGTH_BYTE];
	        bb.get(iv);
	
	        byte[] salt = new byte[SALT_LENGTH_BYTE];
	        bb.get(salt);
	
	        byte[] cipherText = new byte[bb.remaining()];
	        bb.get(cipherText);
	
	        // get back the aes key from the same password and salt
	        SecretKey aesKeyFromPassword = CryptoUtils.getAESKeyFromPassword(AES_ENC_PSWD.toCharArray(), salt);
	
	        Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
	
	        cipher.init(Cipher.DECRYPT_MODE, aesKeyFromPassword, new GCMParameterSpec(TAG_LENGTH_BIT, iv));
	
	        byte[] plainText = cipher.doFinal(cipherText);
	        rawText=new String(plainText, UTF_8);
    	}catch (Exception e) {
    		LOG.error("AesEncryption::decrypt():"+e);
		}
        return rawText;

    }

    

}