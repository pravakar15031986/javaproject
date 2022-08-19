package com.csm.ORSAC.adminconsole.webportal.bean;
import java.io.Serializable;


public class SubHierarchyVo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int subNodeId;
	
	private int hierarchyId;
	
	private String subNodeName;
	
	private int subLevelNumber;	
	
	private String hierarchyName;
		
	private String subNodeAlias;
	
	private int deletedStatus;
	
	
	private String txtNode;
	
	private String txtAlias;
	
	private String subNodeURL;
	
	

	
	public int getSubNodeId() {
		return subNodeId;
	}

	public String getSubNodeURL() {
		return subNodeURL;
	}

	public void setSubNodeURL(String subNodeURL) {
		this.subNodeURL = subNodeURL;
	}

	public void setSubNodeId(int subNodeId) {
		this.subNodeId = subNodeId;
	}

	public int getHierarchyId() {
		return hierarchyId;
	}

	public void setHierarchyId(int hierarchyId) {
		this.hierarchyId = hierarchyId;
	}

	public String getSubNodeName() {
		return subNodeName;
	}

	public void setSubNodeName(String subNodeName) {
		this.subNodeName = subNodeName;
	}

	public int getSubLevelNumber() {
		return subLevelNumber;
	}

	public void setSubLevelNumber(int subLevelNumber) {
		this.subLevelNumber = subLevelNumber;
	}

	public String getHierarchyName() {
		return hierarchyName;
	}

	public void setHierarchyName(String hierarchyName) {
		this.hierarchyName = hierarchyName;
	}

	public String getSubNodeAlias() {
		return subNodeAlias;
	}

	public void setSubNodeAlias(String subNodeAlias) {
		this.subNodeAlias = subNodeAlias;
	}

	public int getDeletedStatus() {
		return deletedStatus;
	}

	public void setDeletedStatus(int deletedStatus) {
		this.deletedStatus = deletedStatus;
	}

	public String getTxtNode() {
		return txtNode;
	}

	public void setTxtNode(String txtNode) {
		this.txtNode = txtNode;
	}

	public String getTxtAlias() {
		return txtAlias;
	}

	public void setTxtAlias(String txtAlias) {
		this.txtAlias = txtAlias;
	}
	
	

	
	
	
	
	

}
