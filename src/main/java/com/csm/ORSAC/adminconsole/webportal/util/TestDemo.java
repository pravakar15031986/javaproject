package com.csm.ORSAC.adminconsole.webportal.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestDemo {

	private static final Logger LOG = LoggerFactory.getLogger(TestDemo.class);

	public static List<String> getFinancialYearList() {
		List<String> list = new ArrayList<>();
		int year = Calendar.getInstance().get(Calendar.YEAR);

		for (int a = year + 1; a >= 2009; a--) {
			int b = a + 1;

			LOG.info("b =" + b);

		}
		return list;
	}

}
