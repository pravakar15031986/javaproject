package com.csm.ORSAC.adminconsole.responsedto;

import java.util.Set;

public class UpdatePermissionResponseDto implements Comparable<UpdatePermissionResponseDto>{

    private int globalLinkId;
	
	private String globalLinkName;
	
	Set<PrimaryLinkResponseDto> primarylinks;
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null)
		    return false;

		  if (this.getClass() != obj.getClass())
		    return false;
	
		UpdatePermissionResponseDto ob =	(UpdatePermissionResponseDto)obj;
		if(ob.getGlobalLinkId() == this.globalLinkId)
			return true;
		return false;
	}
	
	@Override
	public int hashCode() {
		
		return this.globalLinkId;
	}

	

	@Override
	public int compareTo(UpdatePermissionResponseDto obj) {
		return this.getGlobalLinkId() - obj.getGlobalLinkId();
	}
	
	

	public int getGlobalLinkId() {
		return globalLinkId;
	}

	public void setGlobalLinkId(int globalLinkId) {
		this.globalLinkId = globalLinkId;
	}

	public String getGlobalLinkName() {
		return globalLinkName;
	}

	public void setGlobalLinkName(String globalLinkName) {
		this.globalLinkName = globalLinkName;
	}

	public Set<PrimaryLinkResponseDto> getPrimarylinks() {
		return primarylinks;
	}

	public void setPrimarylinks(Set<PrimaryLinkResponseDto> primarylinks) {
		this.primarylinks = primarylinks;
	}

	@Override
	public String toString() {
		return "UpdatePermissionResponseDto [globalLinkId=" + globalLinkId + ", globalLinkName=" + globalLinkName
				+ ", primarylinks=" + primarylinks + "]";
	}
	
	
	
}
