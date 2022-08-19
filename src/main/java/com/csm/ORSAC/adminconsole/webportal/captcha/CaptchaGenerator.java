package com.csm.ORSAC.adminconsole.webportal.captcha;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.security.SecureRandom;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CaptchaGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private int height = 0;
	private int width = 0;

	public static final String CAPTCHA_KEY = "captcha_key_name";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws IOException, ServletException {
		// Expire response
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setHeader("Pragma1", "no-cache");
		response.setDateHeader("Max-Age", 0);

		BufferedImage image = new BufferedImage(300, 30, // width, height
				BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics2D = image.createGraphics();

		String inputNumberString = "";
		SecureRandom r2 = new SecureRandom(); // as sonar cube
		char[] str = { '*', '-', '+', '>', '<', 'F', 'L', 'M' };
		int[] array = new int[3];
		int ranlen = r2.nextInt(str.length);
		int a = 0, b = 0, c1 = 0, d = 0;
		int flag = 0;

		switch (ranlen) {
		case 0:// FOr Multiplication.
			a = r2.ints(1, 10).findFirst().getAsInt();
			b = r2.ints(1, 10).findFirst().getAsInt();
			c1 = a * b;
			inputNumberString = "What is the Output ? " + a + " * " + b + " = ";
			break;
		case 1:// FOr Subtraction.
			a = r2.ints(10, 99).findFirst().getAsInt();
			b = r2.ints(0, 10).findFirst().getAsInt();
			c1 = a - b;
			inputNumberString = "What is the Output ? " + a + " - " + b + " = ";
			break;
		case 2:// FOr Addition.
			a = r2.ints(1, 10).findFirst().getAsInt();
			b = r2.ints(1, 99).findFirst().getAsInt();
			c1 = a + b;
			inputNumberString = "What is the Output ? " + a + " + " + b + " = ";
			break;
		case 3:// FOr getting Greatest No.
			a = r2.ints(1, 10).findFirst().getAsInt();
			array[0] = a;
			flag = 0;
			for (int j = 1; j < 3; j++) {
				flag = 0;
				// Loop:
				b = r2.ints(1, 99).findFirst().getAsInt();
				for (int k = 0; k < array.length; k++) {
					if (array[k] == b) {

						break;
					}

				}
				if (array[j] != b) {
					array[j] = b;
				}

			}

			c1 = getMax(array);
			inputNumberString = "Which is the greatest No. ? " + array[0] + "," + array[1] + "," + array[2] + " = ";
			break;
		case 4:// FOr getting Smallest No.

			a = r2.ints(1, 10).findFirst().getAsInt();
			array[0] = a;

			for (int j = 1; j < 3; j++) {
				flag = 0;
				// Loop:
				b = r2.ints(1, 99).findFirst().getAsInt();
				for (int k = 0; k < array.length; k++) {
					if (array[k] == b) {

					}

				}
				array[j] = b;
			}

			c1 = getMin(array);
			inputNumberString = "Which is the smallest No. ? " + array[0] + " , " + array[1] + " , " + array[2] + " = ";
			break;
		case 5:// FOr getting First No.
			a = r2.ints(1, 10).findFirst().getAsInt();
			b = r2.ints(1, 99).findFirst().getAsInt();
			d = r2.ints(1, 99).findFirst().getAsInt();
			c1 = a;
			inputNumberString = "Which is the first No. ? " + a + " , " + b + " , " + d + " = ";
			break;
		case 6:// FOr getting Last No.
			a = r2.ints(1, 10).findFirst().getAsInt();
			b = r2.ints(1, 99).findFirst().getAsInt();
			d = r2.ints(1, 99).findFirst().getAsInt();
			c1 = d;
			inputNumberString = "Which is the last No. ? " + a + " , " + b + " , " + d + " = ";
			break;
		case 7:// FOr getting Middle No.
			a = r2.ints(1, 10).findFirst().getAsInt();
			b = r2.ints(1, 99).findFirst().getAsInt();
			d = r2.ints(1, 99).findFirst().getAsInt();
			c1 = b;
			inputNumberString = "Which is the Middle No. ? " + a + " , " + b + " , " + d + " = ";
			break;
		}

		Color c = new Color(0.6662f, 0.6662f, 0.6662f);
		c.getTransparency();
		GradientPaint gp = new GradientPaint(30, 30, c, 15, 25, Color.white, true);
		graphics2D.setPaint(gp);
		Font font = new Font("Roboto", Font.CENTER_BASELINE, 15);
		graphics2D.setFont(font);
		graphics2D.drawString(inputNumberString, 2, 20);
		graphics2D.dispose();

		HttpSession session = req.getSession(true);

		session.setAttribute(CAPTCHA_KEY, AesEncryption.encrypt(c1 + ""));
		OutputStream outputStream = response.getOutputStream();
		ImageIO.write(image, "jpeg", outputStream);
		outputStream.close();

	}

	public static int getMax(int[] inputArray) {
		int maxValue = inputArray[0];
		for (int i = 1; i < inputArray.length; i++) {
			if (inputArray[i] > maxValue) {
				maxValue = inputArray[i];
			}
		}
		return maxValue;
	}

	// Method for getting the minimum value
	public static int getMin(int[] inputArray) {
		int minValue = inputArray[0];
		for (int i = 1; i < inputArray.length; i++) {
			if (inputArray[i] < minValue) {
				minValue = inputArray[i];
			}
		}
		return minValue;
	}
}
