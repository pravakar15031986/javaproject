
package com.csm.ORSAC.webportal.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.csm.ORSAC.adminconsole.webportal.util.OrsacEmailPortalConstant;

public final class EmailUtil {

	public static final Logger LOG = LoggerFactory.getLogger(EmailUtil.class);

	Properties props;

	public static String sendAppcMail(String emailId, String mailTxt, String mailSub) {
		Properties props;
		try {
			props = new Properties();

			props.put(OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_SMTPAUTH, "true");
			props.put(OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_SMTPSTARTTLSENABLE, "true");
			props.put(OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_SMTPHOST,
					OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_IP);
			props.put(OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_SMTPPORT,
					OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_PORT);

			props.put("mail.smtp.debug", "false");
			props.put("mail.smtp.socketFactory.port",
					OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_PORT);
			props.put("mail.smtp.ssl.checkserveridentity", true); // Compliant (Added on 25-08-2020)
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");

			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(
							OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_FROM,
							OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_PASSWORD);
				}
			});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(OrsacEmailPortalConstant.wrsisEmailPropertiesFileConstants.EMAIL_FROM));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
			message.setSubject(mailSub);
			message.setContent(mailTxt, "text/html; charset=utf-8");
			Transport.send(message);
			LOG.info("EmailUtil::sendAppcMail(): Email sent successfully");
			return OrsacEmailPortalConstant.SUCCESS;
		} catch (MessagingException mex) {
			LOG.error("EmailUtil::sendAppcMail():" + mex);

			Exception ex = mex;
			do {
				if (ex instanceof SendFailedException) {
					SendFailedException sfex = (SendFailedException) ex;
					Address[] invalid = sfex.getInvalidAddresses();
					if (invalid != null) {
					}
					Address[] validUnsent = sfex.getValidUnsentAddresses();
					if (validUnsent != null) {

					}
					Address[] validSent = sfex.getValidSentAddresses();
					if (validSent != null) {
					}
				}

				if (ex instanceof MessagingException)
					ex = ((MessagingException) ex).getNextException();
				else
					ex = null;
			} while (ex != null);
		}
		return OrsacEmailPortalConstant.FAILURE;

	}

}
