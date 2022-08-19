package com.csm.ORSAC.webportal.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;

/**
 * 
 * @author dibyamohan.panda
 *
 */
public class Base64ConverterUtil {
	
	/**
	 * 
	 * @param path
	 * @param fileName
	 * @param request
	 * This method is used for
	 * convert image into base64 format
	 * @return base image string
	 * @throws IOException
	 */
	public static String convertFileIntoBase64String(String path, String fileName, HttpServletRequest request) throws IOException {
		File file;
		FileInputStream fileInputStream = null;
		ByteArrayOutputStream byteArrayOutputStream = null;
		try {
			System.out.println(path +"Image Path" + fileName);
			
			file = new File(path +  fileName);
			fileInputStream = new FileInputStream(file);
			System.out.println(fileInputStream +"File Name");
			byteArrayOutputStream = new ByteArrayOutputStream();
			
			int b;
			byte[] buffer = new byte[1024];
			while ((b = fileInputStream.read(buffer)) != -1) {
				byteArrayOutputStream.write(buffer, 0, b);
			}
			System.out.println(byteArrayOutputStream +"File object Name");
			byte[] fileBytes = byteArrayOutputStream.toByteArray();
			fileInputStream.close();
			byteArrayOutputStream.close();

			byte[] encoded = Base64.encodeBase64(fileBytes);
			String encodedString = new String(encoded);
			System.out.println(encodedString + "Encode String");
			return encodedString;
		}catch (FileNotFoundException e) {
			e.getMessage();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(byteArrayOutputStream != null) {
				byteArrayOutputStream.close();
			}
			if(fileInputStream != null) {
				fileInputStream.close();
			}
		}
		return new String();
	}
}
