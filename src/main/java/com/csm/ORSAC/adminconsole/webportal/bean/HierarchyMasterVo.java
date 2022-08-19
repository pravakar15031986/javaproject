package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.util.List;


public class HierarchyMasterVo implements Serializable{

	private static final long serialVersionUID = 2593652475868279730L;

	private int hierarchyId;
	
	private String hierarchyName;
	
	private int levelNumber;
	
	private String hierarchyAlias;
	
	private int deletedStatus;
	
	
	private String txtNode;
	
	private String txtAlias;
	
	private List <SubHierarchyVo> subNodeList ;
    
	
	
	public int getHierarchyId() {
		return hierarchyId;
	}

	public void setHierarchyId(int hierarchyId) {
		this.hierarchyId = hierarchyId;
	}

	public String getHierarchyName() {
		return hierarchyName;
	}

	public void setHierarchyName(String hierarchyName) {
		this.hierarchyName = hierarchyName;
	}

	public int getLevelNumber() {
		return levelNumber;
	}

	public void setLevelNumber(int levelNumber) {
		this.levelNumber = levelNumber;
	}

	public String getHierarchyAlias() {
		return hierarchyAlias;
	}

	public void setHierarchyAlias(String hierarchyAlias) {
		this.hierarchyAlias = hierarchyAlias;
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

	
	public List <SubHierarchyVo> getSubNodeList() {
		return subNodeList;
	}

	public void setSubNodeList(List <SubHierarchyVo> subNodeList) {
		this.subNodeList = subNodeList;
	}

	
	
	
	
	

}
