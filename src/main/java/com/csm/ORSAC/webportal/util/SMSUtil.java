
package com.csm.ORSAC.webportal.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

@Component
public class SMSUtil {

	public static final Logger LOG = LoggerFactory.getLogger(SMSUtil.class);
	

	
	
	@Value("${sms.send.indicator}")
	private String smsIndicator;

	@Value("${sms.main.url}")
	private String smsUrl;

	@Value("${sms.app.value}")
	private String smsApp;

	@Value("${sms.u.value}")
	private String smsU;

	@Value("${sms.h.value}")
	private String smsH;

	@Value("${sms.op.value}")
	private String smsOp;
	
	
	
	
	

	// accept 2 param , mobile and message.dynamically url generate and fire that
	// url
	public  String sendSms(String mobileNo, String message) {
		
		LOG.info("SMSUtil::sendSms(): Inside sms method, indicator val-" + smsIndicator +" smsUrl-->"+smsUrl+"  smsApp->"+smsApp);
		if (OrsacPortalConstant.YES.equalsIgnoreCase(smsIndicator)) {
			/*
			 * 
			 * http://172.29.0.59/playsms/index.php?app=ws&
			 * u=wrsis&h=778a09eaa19ae31409aa92099d49d257&op=pv&to =[mobile
			 * numbers]&msg=[message u want to send]
			 */
			LOG.info("SMSUtil::sendSms(): now sending sms...");
			
			String myURL = smsUrl + "?app=" + smsApp + "&u=" + smsU + "&h=" + smsH + "&op=" + smsOp + "&to=" + mobileNo
					+ "&msg=" + message;
			LOG.info("Request URL for sending sms:" + myURL);
			StringBuilder sb = new StringBuilder();
			URLConnection urlConn = null;
			InputStreamReader in = null;
			try {
				URL url = new URL(myURL);
				urlConn = url.openConnection();
				if (urlConn != null)
					urlConn.setReadTimeout(60 * 1000);
				if (urlConn != null && urlConn.getInputStream() != null) {
					in = new InputStreamReader(urlConn.getInputStream(), Charset.defaultCharset());
					BufferedReader bufferedReader = new BufferedReader(in);
					if (bufferedReader != null) {
						int cp;
						while ((cp = bufferedReader.read()) != -1) {
							sb.append((char) cp);
						}
						bufferedReader.close();
					}
				}
				in.close();
			} catch (Exception e) {
				LOG.error("SMSUtil::sendSms():" + e);
				throw new RuntimeException("Exception while calling URL for sending sms:" + myURL, e);

			}
			return sb.toString();
		}
		return "";
	}

}
