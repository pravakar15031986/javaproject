package com.csm.ORSAC.adminconsole.webportal.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * This is generic class for service request.
 * 
 * @author niranjan.biswal
 *
 * @param <T>
 */
public class GenericServiceRequest<T> {

	public static final Logger LOG = LoggerFactory.getLogger(GenericServiceRequest.class);

	private static String membershipurl;

	private T data;

	public GenericServiceRequest() {
		//my bundle
	}

	public GenericServiceRequest(T data) {
		this();
		this.data = data;
	}

	/**
	 * This method is use for send post request to service layer.
	 * 
	 * @param serviceUrl : Url for service layer
	 * @return : return a JsonNode object as response.
	 * @throws IOException
	 */
	public JsonNode sendPOST(String serviceUrl) throws IOException {
		JsonNode actualObj = null;
		String url = membershipurl + serviceUrl;
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
		ObjectMapper mapper = new ObjectMapper();
		con.setDoOutput(true);
		try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {

			String dataString = mapper.writeValueAsString(data);
			wr.write(dataString.getBytes());
		}
		int responseCode = con.getResponseCode();

		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			actualObj = mapper.readTree(response.toString());

		} else {
			LOG.info(OrsacPortalConstant.MESSAGE);

		}
		return actualObj;
	}

	public JsonNode sendGET(String serviceUrl) {
		HttpURLConnection con = null;
		JsonNode actualObj = null;
		BufferedReader bufferedReader = null;
		String url = membershipurl + serviceUrl;
		URL obj;
		StringBuilder content = new StringBuilder();
		try {
			obj = new URL(url);
			con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET");
			bufferedReader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line;
			// read from the urlconnection via the bufferedreader
			while ((line = bufferedReader.readLine()) != null) {
				content.append(line);
			}
			int responseCode = con.getResponseCode();
			LOG.info("responseCode"+responseCode);
		} catch (IOException e) {
			LOG.error("GenericServiceRequest::sendGET():" + e.getMessage());
		} finally {
			try {
				if (bufferedReader != null)
					bufferedReader.close();
			} catch (IOException e) {
				LOG.error("GenericServiceRequest::sendGET():" + e.getMessage());
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			actualObj = mapper.readTree(content.toString());
		} catch (IOException e) {
			LOG.error("GenericServiceRequest::sendGET():" + e.getMessage());
		}
		return actualObj;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
