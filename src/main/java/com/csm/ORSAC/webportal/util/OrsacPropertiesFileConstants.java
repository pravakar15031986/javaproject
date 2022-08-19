package com.csm.ORSAC.webportal.util;

import java.util.ResourceBundle;

import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

public final class OrsacPropertiesFileConstants {

	public static OrsacPropertiesFileConstants theObject;

	public synchronized static OrsacPropertiesFileConstants createWrsisPropertiesFileConstants() {
		if (theObject == null)
			theObject = new OrsacPropertiesFileConstants();
		return theObject;
	}

	public final String USER_PROFILE_IMG_UPLOAD_PATH;

	public final String IVR_EXCEL_UPLOAD_PATH;
	public final String WR_SURVEY_IMAGES_PATH;
	public final String WR_SURVEY_EXCEL_PATH;

	public final String WR_NO_OF_QUESTIONS;
	public final String WR_NO_OF_OPTIONS;
	public final String APPROVAL_PROCESS_ID;
	public final String DIFFERENTIAL_SET_MAX;

	public final String ADVISORY_FILE_UPLOAD_PATH;

	public final String RECOMMENDATION_FILE_UPLOAD_PATH;

	private final ResourceBundle wrsisResourcesBundel;

	public final String WR_RECOMMENDATION_AND_ADVISORY_EXCEL_PATH;
	public final String WR_RACE_ANALYSIS_PUBLISH;
	public final String WR_DEFAULT_START_YEAR;

	public final String GIS_FILE_UPLOAD_ZIP_PATH;
	public final String GIS_FILE_UPLOAD_YEAR_MONTH_PATH;
	public final String GIS_FILE_UPLOAD_UNZIP_PATH;
	
	public final String APK_FILE_UPLOAD_ZIP_PATH;
	public final String APK_FILE_UPLOAD_YEAR_MONTH_PATH;
	public final String APK_FILE_UPLOAD_OLD_PATH;

	public final String TAGSAMPLE_PROCESS_ID;
	public final String RECOMMENDATION_PROCESS_ID;
	public final String ADVISORY_PROCESS_ID;
	public final String IMPLEMENTATION_PROCESS_ID;

	private OrsacPropertiesFileConstants() {

		wrsisResourcesBundel = ResourceBundle.getBundle("wrsisResources");

		USER_PROFILE_IMG_UPLOAD_PATH = wrsisResourcesBundel.getString(OrsacPortalConstant.USER_PROFILE_IMG_UPLOAD_PATH)
				.trim();
		IVR_EXCEL_UPLOAD_PATH = wrsisResourcesBundel.getString(OrsacPortalConstant.IVR_EXCEL_UPLOAD_PATH).trim();
		WR_SURVEY_IMAGES_PATH = wrsisResourcesBundel.getString(OrsacPortalConstant.WR_SURVEY_IMAGES_PATH.trim());
		WR_SURVEY_EXCEL_PATH = wrsisResourcesBundel.getString(OrsacPortalConstant.WR_SURVEY_EXCEL_PATH.trim());

		WR_NO_OF_QUESTIONS = wrsisResourcesBundel.getString(OrsacPortalConstant.WR_NO_OF_QUESTIONS.trim());
		WR_NO_OF_OPTIONS = wrsisResourcesBundel.getString(OrsacPortalConstant.WR_NO_OF_OPTIONS.trim());
		APPROVAL_PROCESS_ID = wrsisResourcesBundel.getString(OrsacPortalConstant.APPROVAL_PROCESS_ID.trim());
		DIFFERENTIAL_SET_MAX = wrsisResourcesBundel.getString(OrsacPortalConstant.DIFFERENTIAL_SET_MAX.trim());

		ADVISORY_FILE_UPLOAD_PATH = wrsisResourcesBundel
				.getString(OrsacPortalConstant.ADVISORY_FILE_UPLOAD_PATH.trim());

		RECOMMENDATION_FILE_UPLOAD_PATH = wrsisResourcesBundel
				.getString(OrsacPortalConstant.RECOMMENDATION_FILE_UPLOAD_PATH.trim());
		WR_RECOMMENDATION_AND_ADVISORY_EXCEL_PATH = wrsisResourcesBundel
				.getString(OrsacPortalConstant.WR_RECOMMENDATION_AND_ADVISORY_EXCEL_PATH.trim());
		WR_RACE_ANALYSIS_PUBLISH = wrsisResourcesBundel.getString(OrsacPortalConstant.WR_RACE_ANALYSIS_PUBLISH.trim());
		WR_DEFAULT_START_YEAR = wrsisResourcesBundel.getString(OrsacPortalConstant.WR_DEFAULT_START_YEAR.trim());

		GIS_FILE_UPLOAD_ZIP_PATH = wrsisResourcesBundel.getString(OrsacPortalConstant.GIS_FILE_UPLOAD_ZIP_PATH.trim());
		APK_FILE_UPLOAD_ZIP_PATH = wrsisResourcesBundel.getString(OrsacPortalConstant.APK_FILE_UPLOAD_ZIP_PATH.trim());

		GIS_FILE_UPLOAD_YEAR_MONTH_PATH = wrsisResourcesBundel
				.getString(OrsacPortalConstant.GIS_FILE_UPLOAD_YEAR_MONTH_PATH.trim());
		APK_FILE_UPLOAD_YEAR_MONTH_PATH = wrsisResourcesBundel
				.getString(OrsacPortalConstant.APK_FILE_UPLOAD_YEAR_MONTH_PATH.trim());
		GIS_FILE_UPLOAD_UNZIP_PATH = wrsisResourcesBundel
				.getString(OrsacPortalConstant.GIS_FILE_UPLOAD_UNZIP_PATH.trim());
		
		APK_FILE_UPLOAD_OLD_PATH = wrsisResourcesBundel
				.getString(OrsacPortalConstant.APK_FILE_UPLOAD_OLD_PATH.trim());

		TAGSAMPLE_PROCESS_ID = wrsisResourcesBundel.getString(OrsacPortalConstant.TAGSAMPLE_PROCESS_ID.trim());
		RECOMMENDATION_PROCESS_ID = wrsisResourcesBundel
				.getString(OrsacPortalConstant.RECOMMENDATION_PROCESS_ID.trim());
		ADVISORY_PROCESS_ID = wrsisResourcesBundel.getString(OrsacPortalConstant.ADVISORY_PROCESS_ID.trim());
		IMPLEMENTATION_PROCESS_ID = wrsisResourcesBundel
				.getString(OrsacPortalConstant.IMPLEMENTATION_PROCESS_ID.trim());
	}
}
