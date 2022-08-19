package com.csm.ORSAC.webportal.util;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.web.multipart.MultipartFile;


/**
 * 
 * @author dibyamohan.panda
 * This class is used for Save 
 * uploaded files into a specific 
 * directory
 */
public class FileUploadUtil {
	
	
	/**
	 * 
	 * @param upload Directory
	 * @param fileName
	 * @param multipartfile
	 * This Method is used for store
	 * the file in the given path
	 * @return File Upload Status
	 * @throws IOException
	 */
	public static boolean saveFile(String uploadDir,String fileName,MultipartFile multipartfile) throws IOException {
		boolean status=false;
		InputStream inputStream=null; 
		try {
			Path uploadPath = Paths.get(uploadDir);
	         
	        if (!Files.exists(uploadPath)) { //If the upload path is not present create the directory
	            Files.createDirectories(uploadPath);
	        }
	       
	        inputStream=multipartfile.getInputStream();
	        Path filePath = uploadPath.resolve(fileName);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING); //Store the Files into upload directory
            status=true;
            
			} catch (IOException  ioe) {
				// TODO: handle exception
				 throw new IOException("Could not save file: " + fileName, ioe);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				if(inputStream!=null) {
				   inputStream.close();
				}
				
			}
			
		
		
		return status;
		
	}

}
