package com.csm.ORSAC.adminconsole.webportal.response;

public enum BasicResponse {
	SUCCESS("SUCCESS", "OK"), ERROR("ERROR", "FAILED");

	private String code;
	private String message;

	BasicResponse(String code, String message) {
		this.code = code;
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}
}