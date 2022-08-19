package com.csm.ORSAC.adminconsole.responsedto;

public class PrimaryLinkResponseDto implements Comparable<PrimaryLinkResponseDto> {
	
	private int pLinkId;
	
	private int intSlNo;
	
	private String primaryLinkName;
	
	private  String action;

	public PrimaryLinkResponseDto() {}
	
	public PrimaryLinkResponseDto(int pLinkId, String primaryLinkName) {
		super();
		this.pLinkId = pLinkId;
		this.primaryLinkName = primaryLinkName;
	}

	public PrimaryLinkResponseDto(int primaryLinkId, String primaryLinkName, boolean bitStatus) {
		super();
		this.pLinkId = primaryLinkId;
		this.primaryLinkName = primaryLinkName;
		if(!bitStatus)
			this.action = Integer.toString(0);
		else if(bitStatus)
			this.action = Integer.toString(1);
	}

	@Override
	public int compareTo(PrimaryLinkResponseDto obj) {
		return this.intSlNo - obj.getIntSlNo();
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null)
		    return false;
		  if (this.getClass() != obj.getClass())
		    return false;
	
		PrimaryLinkResponseDto obj1 = 	(PrimaryLinkResponseDto) obj;
		if(obj1.getpLinkId() == this.pLinkId)
			return true;
		return false;
	}
	 
	@Override
	public int hashCode() {
		return this.pLinkId;
	}
	
	
	
	
	public int getpLinkId() {
		return pLinkId;
	}

	public void setpLinkId(int pLinkId) {
		this.pLinkId = pLinkId;
	}

	public String getPrimaryLinkName() {
		return primaryLinkName;
	}

	public void setPrimaryLinkName(String primaryLinkName) {
		this.primaryLinkName = primaryLinkName;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getIntSlNo() {
		return intSlNo;
	}

	public void setIntSlNo(int intSlNo) {
		this.intSlNo = intSlNo;
	}
	
	
}
