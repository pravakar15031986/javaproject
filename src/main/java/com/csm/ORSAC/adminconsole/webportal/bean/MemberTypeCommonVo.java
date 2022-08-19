package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.util.List;

public class MemberTypeCommonVo implements Serializable{

	 
	private static final long serialVersionUID = 1L;

	    private String resultCode;
		
		private String status;
		
		private String message;
		
		private List<MemberType> data;
		
		private String currentPage;
		
		private String total;
		
		
		

		public String getTotal() {
			return total;
		}

		public void setTotal(String total) {
			this.total = total;
		}

		public String getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(String currentPage) {
			this.currentPage = currentPage;
		}

		public String getResultCode() {
			return resultCode;
		}

		public void setResultCode(String resultCode) {
			this.resultCode = resultCode;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		public List<MemberType> getData() {
			return data;
		}

		public void setData(List<MemberType> data) {
			this.data = data;
		}
		
		
}
