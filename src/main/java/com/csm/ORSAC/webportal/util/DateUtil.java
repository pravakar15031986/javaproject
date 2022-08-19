package com.csm.ORSAC.webportal.util;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

public class DateUtil {

	public static final Logger LOG = LoggerFactory.getLogger(DateUtil.class);

	public static final String DATE_FORMAT_DDMMYYYY = OrsacPortalConstant.DATE_FORMAT_DDMMYYYY;
	public static final String DATE_FORMAT_DDMMYYYYHHMM = OrsacPortalConstant.DATE_FORMAT_DDMMYYYYHHMMA;
	public static final String DATE_FORMAT_DDMMMYYYY = OrsacPortalConstant.DATE_FORMAT_DDMMMYYYY;
	public static final String SQL_DATE_FORMAT = OrsacPortalConstant.DATE_FORMAT_YYYYMMDD;
	public static final String SQL_DATE_FORMAT1 = OrsacPortalConstant.DATE_FORMAT_YYYYMMDDHHMMSS;

	public static Date StringMMMToDate(String strDate) {
		Date date = null;
		try {
			if (strDate != null) {
				SimpleDateFormat formatter = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMMYYYY);
				Date varDate = formatter.parse(strDate);
				formatter = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMYYYY);
				String strDate1 = formatter.format(varDate);

				date = DateUtil.StringToSqlDate1(strDate1);
			}
		} catch (Exception e) {
			LOG.error("DateUtil::StringMMMToDate():" + e.getMessage());

		}
		return date;
	}

	public static Date StringToDate(String strDate) {
		Date date = null;
		try {
			if (strDate != null) {
				SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT_DDMMYYYY);
				date =  formatter.parse(strDate);
			}

		} catch (Exception e) {
			LOG.error("DateUtil::StringToDate():" + e.getMessage());

		}
		return date;
	}

	public static Date StringToDate(String strDate, String format) {
		Date date = null;
		try {
			if (strDate != null) {
				SimpleDateFormat formatter = new SimpleDateFormat(format);
				date = formatter.parse(strDate);
			}
		} catch (Exception e) {
			LOG.error("DateUtil::StringToDate(String strDate, String format):" + e.getMessage());

		}
		return date;
	}

	public static String DateToString(Date date) {
		String strDate = null;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT_DDMMYYYY);
			if (date != null) {
				strDate = formatter.format(date);
			}

		} catch (Exception e) {
			LOG.error("DateUtil::DateToString():" + e.getMessage());

		}
		return strDate;
	}

	public static String DateToString(Date date, String format) {
		String strDate = null;
		try {
			if (date != null) {
				SimpleDateFormat formatter = new SimpleDateFormat(format);
				strDate = formatter.format(date);
			}

		} catch (Exception e) {
			LOG.error("DateUtil::DateToString():" + e.getMessage());

		}
		return strDate;
	}

	public static java.sql.Date DateToSqlDate(Date date) {
		java.sql.Date sqlDate = null;
		try {
			if (date != null) {
				sqlDate = new java.sql.Date(date.getTime());
			}
		} catch (Exception e) {
			LOG.error("DateUtil::DateToSqlDate():" + e.getMessage());

		}
		return sqlDate;
	}

	public static java.sql.Date StringToSqlDate(String strDate) {
		Date date = null;
		java.sql.Date sqlDate = null;
		try {
			if (strDate != null) {
				SimpleDateFormat formatter = new SimpleDateFormat(SQL_DATE_FORMAT);
				date =  formatter.parse(strDate);
				sqlDate = new java.sql.Date(date.getTime());
			}
		} catch (Exception e) {
			LOG.error("DateUtil::StringToSqlDate():" + e.getMessage());

		}
		return sqlDate;
	}

	public static java.sql.Date StringToSqlDate1(String strDate) {
		Date date = null;
		java.sql.Date sqlDate = null;
		try {
			if (strDate != null) {
				SimpleDateFormat formatter = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMYYYY);
				date = formatter.parse(strDate);
				sqlDate = new java.sql.Date(date.getTime());
			}
		} catch (Exception e) {
			LOG.error("DateUtil::StringToSqlDate1():" + e.getMessage());

		}
		return sqlDate;
	}

	public static java.sql.Date StringToSqlDate2(String strDate) {
		Date date = null;
		java.sql.Date sqlDate = null;
		try {
			if (strDate != null) {
				SimpleDateFormat formatter = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMMYYYY);
				date =  formatter.parse(strDate);
				sqlDate = new java.sql.Date(date.getTime());
			}
		} catch (Exception e) {
			LOG.error("DateUtil::StringToSqlDate2():" + e.getMessage());

		}
		return sqlDate;
	}

	public static boolean isDateGraterThenCurrentDate(Date date) {
		boolean result = false;
		try {
			if (date != null) {
				Calendar givenDate = Calendar.getInstance();
				givenDate.setTime(date);
				Calendar currentDate = Calendar.getInstance();
				result = givenDate.after(currentDate);
			}

		} catch (Exception e) {
			LOG.error("DateUtil:: isDateGraterThenCurrentDate():" + e.getMessage());
		}
		return result;

	}

	public static boolean isDateEqualsToCurrentDate(Date date) {
		boolean result = false;
		try {
			if (date != null) {
				Calendar givenDate = Calendar.getInstance();
				givenDate.setTime(date);
				Calendar currentDate = Calendar.getInstance();
				result = givenDate.equals(currentDate);
			}

		} catch (Exception e) {
			LOG.error("DateUtil:: isDateEqualsToCurrentDate():" + e.getMessage());
		}
		return result;
	}

	public static boolean isDateLessThenCurrentDate(Date date) {
		boolean result = false;
		try {
			if (date != null) {
				Calendar givenDate = Calendar.getInstance();
				givenDate.setTime(date);
				Calendar currentDate = Calendar.getInstance();
				result = givenDate.before(currentDate);
			}

		} catch (Exception e) {
			LOG.error("DateUtil:: isDateLessThenCurrentDate():" + e.getMessage());
		}
		return result;
	}

	public static int getAge(Date dob) {
		int age = 0;
		try {
			if (dob != null) {
				Calendar calDob = Calendar.getInstance();
				calDob.setTime(dob);
				Calendar now = Calendar.getInstance();

				int bday = calDob.get(Calendar.DATE);
				int bmonth = calDob.get(Calendar.MONTH) + 1;
				int byear = calDob.get(Calendar.YEAR);

				int tday = now.get(Calendar.DATE);
				int tmonth = now.get(Calendar.MONTH) + 1;
				int tyear = now.get(Calendar.YEAR);

				if (!((tmonth > bmonth) || (tmonth == bmonth & tday >= bday))) {
					byear++;
				}
				age = tyear - byear;
			}

		} catch (Exception e) {
			LOG.error("DateUtil:: getAge():" + e.getMessage());
		}
		return age;
	}

	public static boolean getNoOfHours(Date optgeneratedDate) {
		Calendar calendar = Calendar.getInstance();
		long otpDate = optgeneratedDate.getTime();
		long currentDate = calendar.getTimeInMillis();
		long diff = currentDate - otpDate;
		long diffhours = diff / (60 * 60 * 1000);
		if (diffhours > 48) {
			return true;
		} else {
			return false;
		}
	}

	public static int getOtpGenerator() {
		int n = 1;
		int otp = 0;
		while (n != 0) {
			otp = (int) (Math.random() * (999999 - 000001) + 000001);
			String otpgenerator = Integer.toString(otp);
			if ((otpgenerator.length() == 6)) {
				n = 0;
				break;
			}
			n = 1;
		}
		return otp;
	}

	public static String reportDateConversion(long inputValue) {
		inputValue = inputValue / 1000;
		String format = String.format("%%0%dd", 2);
		String sec = String.format(format, inputValue % 60);
		String min = String.format(format, (inputValue % 3600) / 60);
		String hrs = String.format(format, inputValue / 3600);
		return hrs + ":" + min + ":" + sec;
	}

	public static Date getFirstDateOfCurrentMonth() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_MONTH, Calendar.getInstance().getActualMinimum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();

	}

	public static String DateToStringMMMFormat(Date date) {
		String strDate = null;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(SQL_DATE_FORMAT);
			if (date != null) {
				strDate = formatter.format(date);
			}

		} catch (Exception e) {
			LOG.error("DateUtil:: DateToStringMMMFormat():" + e.getMessage());

		}
		return strDate;
	}

	public static String dateformatchange(String dateString1) {
		Date date;
		String dateString2 = "";
		try {
			date = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMYYYY).parse(dateString1);
			dateString2 = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD).format(date);
		} catch (ParseException e) {
			
			LOG.error("DateUtil:: dateformatchange():" + e.getMessage());
		}

		return dateString2;
	}

	public static String dateformatchange4(String dateString1) {
		Date date;
		String dateString2 = "";
		try {
			date = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMYYYY).parse(dateString1);
			dateString2 = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMMYYYY).format(date);
		} catch (ParseException e) {
			
			LOG.error("DateUtil:: dateformatchange4():" + e.getMessage());
		}

		return dateString2;
	}
	public static Date convertStringToDate(String dateString) {
		Date date = null;
		DateFormat df = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMMYYYY);
		try {
			date = df.parse(dateString);
		} catch (Exception ex) {
			LOG.error("DateUtil::convertStringToDate():" + ex);
		}
		return date;
	}

	public static String dateformatchange2(String dateString1) {
		Date date;
		String dateString2 = "";
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString1);
			dateString2 = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMYYYY).format(date);
		} catch (ParseException e) {
			
			LOG.error("DateUtil:: dateformatchange2():" + e.getMessage());
		}

		return dateString2;
	}

	public static String dateformatchange3(String dateString1) {
		Date date;
		String dateString2 = "";
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString1);
			dateString2 = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_DDMMMYYYY).format(date);
		} catch (ParseException e) {
			
			LOG.error("DateUtil:: dateformatchange3():" + e.getMessage());
		}

		return dateString2;
	}

	public static String getMonthFromDate(Date date) {
		String formatted = "";
		try {
			if (date != null) {

				Calendar calDate = Calendar.getInstance();
				calDate.setTime(date);

				
				int month = calDate.get(Calendar.MONTH) + 1;
				

				formatted = String.format("%02d", month);

			}
		} catch (Exception e) {
			
			LOG.error("DateUtil:: getMonthFromDate():" + e.getMessage());
		}
		return formatted;
	}

	public static int getYearFromDate(Date date) {
		int year = 0;
		try {
			if (date != null) {

				Calendar calDate = Calendar.getInstance();
				calDate.setTime(date);

				// int bday = calDate.get(Calendar.DATE);
				// int month = calDate.get(Calendar.YEAR)+1;
				year = calDate.get(Calendar.YEAR);

				// formatted = String.format("%02d", month);

			}
		} catch (Exception e) {
			
			LOG.error("DateUtil:: getYearFromDate():" + e.getMessage());
		}
		return year;
	}

	

	public static String getDateTimeDifference(String startDate, String endDate) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse(startDate);
			d2 = format.parse(endDate);
			long diff = d2.getTime() - d1.getTime();
		
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffDays = diff / (24 * 60 * 60 * 1000);

			if (diffDays != 0) {
				return Long.toString(diffDays) + " Days Ago";
			} else if (diffHours != 0 && diffDays == 0) {
				return Long.toString(diffHours) + " Hours Ago";
			} else if (diffHours == 0 && diffDays == 0 && diffMinutes != 0) {
				return Long.toString(diffMinutes) + " Minutes Ago";
			} else {
				return " 1 Minute Ago";
			}
		} catch (Exception e) {
			LOG.error("DateUtil:: getDateTimeDifference():" + e.getMessage());
		}
		return null;
	}

	public static String countDaysRemaining(String startDate, String endDate) {
		SimpleDateFormat format = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD);
		Date startDateFormat = null;
		Date endDateFormat = null;
		Date currentDateFormat = null;
		String currentdate = "";
		DateFormat dateFormat = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD);
		Date date = new Date();
		currentdate = dateFormat.format(date);
		String status = "";
		String val = "";
		try {
			startDateFormat = format.parse(startDate);
			endDateFormat = format.parse(endDate);
			currentDateFormat = format.parse(currentdate);

			if (DateUtil.isDateGraterThenCurrentDate(startDateFormat)) {

				long diff = endDateFormat.getTime() - startDateFormat.getTime();
				return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS) + " Days Remaining";

			}
			if (DateUtil.isDateLessThenCurrentDate(startDateFormat)) {

				long diff = endDateFormat.getTime() - currentDateFormat.getTime();

				status = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS) + "";/* +" Days Remaining" */
				if (status.contains("-")) {
					val = status + " Days OverDue";
				} else {
					val = status + " Days Remaining";
				}

				return val;
			}

			if (DateUtil.isDateEqualsToCurrentDate(endDateFormat)) {

				long diff = currentDateFormat.getTime() - endDateFormat.getTime();
				return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS) + " Days Remaining";

			}

			
		} catch (Exception e) {
			LOG.error("DateUtil:: countDaysRemaining():" + e.getMessage());
		}
		return null;
	}

	public static int colorChange(String startDate, String endDate) {
		SimpleDateFormat format = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD);
		Date startDateFormat = null;
		Date endDateFormat = null;
		Date currentDateFormat = null;
		String currentdate = "";
		DateFormat dateFormat = new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD);
		Date date = new Date();
		currentdate = dateFormat.format(date);
		int status = 0;
		
		try {
			startDateFormat = format.parse(startDate);
			endDateFormat = format.parse(endDate);
			currentDateFormat = format.parse(currentdate);

			if (DateUtil.isDateGraterThenCurrentDate(startDateFormat)) {
				long diff = endDateFormat.getTime() - startDateFormat.getTime();
				return (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);

			}
			if (DateUtil.isDateLessThenCurrentDate(startDateFormat)) {

				long diff = endDateFormat.getTime() - currentDateFormat.getTime();
				status = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
				return status;
			}

			if (DateUtil.isDateEqualsToCurrentDate(endDateFormat)) {

				long diff = currentDateFormat.getTime() - endDateFormat.getTime();

				return (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);

			}

		} catch (Exception e) {
			LOG.error("DateUtil:: colorChange():" + e.getMessage());
		}
		return 0;
	}

	public static Date getNextYearDate() {
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.YEAR, 1); // to get previous year add -1
		
		return cal.getTime();
	}

	public static boolean isDateEqualsToCurrentDateUsingFormat(Date date, String format) {
		boolean result = false;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			if (date != null) {
				Calendar givenDate = Calendar.getInstance();
				givenDate.setTime(date);

				Date today = sdf.parse(DateToString(new Date(), format));
				Calendar currentDate = Calendar.getInstance();
				currentDate.setTime(today);

				result = givenDate.equals(currentDate);
			}

		} catch (Exception e) {
			LOG.error("DateUtil:: isDateEqualsToCurrentDateUsingFormat():" + e.getMessage());
		}
		return result;
	}

	public static boolean isDateLessThenCurrentDateusingFormat(Date date, String format) {
		boolean result = false;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			if (date != null) {
				Calendar givenDate = Calendar.getInstance();
				givenDate.setTime(date);

				Date today = sdf.parse(DateToString(new Date(), format));
				Calendar currentDate = Calendar.getInstance();
				currentDate.setTime(today);

				
				result = givenDate.before(currentDate);
			}

		} catch (Exception e) {
			LOG.error("DateUtil:: isDateLessThenCurrentDateusingFormat():" + e.getMessage());
		}
		return result;
	}

	// Fetching Year List

	public static JSONArray getYearList() {
		Integer surveyYear = Integer.valueOf(OrsacPortalConstant.wrsisPropertiesFileConstants.WR_DEFAULT_START_YEAR);
		JSONArray jsa = new JSONArray();
		int cyear = Calendar.getInstance().get(Calendar.YEAR);
		for (int i = cyear; i >= surveyYear; i--) {
			jsa.put(i);
		}
		return jsa;
	}
	
	
	  //Fetch Month List
	public static List<String> getMonthList() {
		 List<String> monthsList = new ArrayList<>();
		    String[] months = new DateFormatSymbols().getShortMonths();
		    for (int i = 0; i < months.length-1; i++) {
		    
		      
		      monthsList.add(months[i]);
		    }
		    return monthsList;
	}
	 

	public static List<String> fetchYearList() {
		List<String> obj = new ArrayList<>();
		String year = "";
		try {
			Integer startYear = Integer.valueOf(OrsacPortalConstant.wrsisPropertiesFileConstants.WR_DEFAULT_START_YEAR);
			Integer endyear = Calendar.getInstance().get(Calendar.YEAR);
			for (int i = startYear; i <= endyear; i++) {
				year = "";
				year = String.valueOf(i);
				obj.add(year);
			}
			Collections.sort(obj, Collections.reverseOrder());
		} catch (Exception e) {
			LOG.error("DateUtil:: fetchYearList():" + e.getMessage());
		}
		return obj;
	}

	public static List<Integer> fetchYearListInteger() {
		List<Integer> obj = new ArrayList<>();
		Integer year = 0;
		try {
			Integer startYear = Integer.valueOf(OrsacPortalConstant.wrsisPropertiesFileConstants.WR_DEFAULT_START_YEAR);
			Integer endyear = Calendar.getInstance().get(Calendar.YEAR);
			for (int i = startYear; i <= endyear; i++) {
				year = 0;
				year = i;
				obj.add(year);
			}
			Collections.sort(obj, Collections.reverseOrder());
		} catch (Exception e) {
			LOG.error("DateUtil:: fetchYearListInteger():" + e.getMessage());
		}
		return obj;
	}
	
	
	
	 
	//Author : Raman Shrestha
	//Date : 03-09-2020
	//pass int noOfGapInDays in negative to get before date
	//pass int noOfGapInDays in positive to get after date
	public static Date getBeforeDate(Date date,int noOfGapInDays) {
		Date beforeDate=null;
		try {
			String sdate= new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD).format(date);
			Date dateWithoutTime=new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD).parse(sdate);
			Calendar cal = Calendar.getInstance();
			cal.setTime(dateWithoutTime);
			cal.add(Calendar.DAY_OF_YEAR,noOfGapInDays);
			beforeDate= cal.getTime();
		} catch (Exception e) {
			LOG.error("DateUtil:: getBeforeDate():" + e);
		}
		return beforeDate;
	}
	
	public static Date getFromatedDate(Date date) {
		Date beforeDate=null;
		try {
			String sdate= new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD).format(date);
			Date dateWithoutTime=new SimpleDateFormat(OrsacPortalConstant.DATE_FORMAT_YYYYMMDD).parse(sdate);
			Calendar cal = Calendar.getInstance();
			cal.setTime(dateWithoutTime);
			cal.add(Calendar.DAY_OF_YEAR,0);
			beforeDate= cal.getTime();
		} catch (Exception e) {
			LOG.error("DateUtil:: getFromatedDate():" + e);
		}
		return beforeDate;
	}
	
	
}
