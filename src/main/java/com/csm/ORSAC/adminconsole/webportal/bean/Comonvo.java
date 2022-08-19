package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.util.List;

public class Comonvo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int dataId;
	
	private int primaryLinkId;
	
	private String primaryLinkName;
	
	private String dataName;
	
	private String departmentId;
	
	private String lineOfficeId;

	private String officeId;
	
	private String officeName;
	
     private String groupId;
	
	private String groupName;
	
	private String action1;
	
	private String action2;
	
	private String action3;
	 
	private byte linkAccess;
	
	private int sectionId;	

	private String sectionName;	

	private String lineDepartmentName;
	
	private String linedepartmentId;
	
	private int parentId;

	private String departmentName;
	
	private String departmentParentId;
	
	private int officeNameWithId;
	
	private String categoryId;	
	
	private String officeAddress;
	
	private int totalFileCount;
	
	private int totalMovmentFile;
	
	private int totalIdealFile;
	
	private int designationId;
	
	private int userId;
	
	private String userName;
	
	private String desigName;
	
	private int intOfficeId;
	
	private String levelNumber;
	
	private String hdnID;
	
	private String hdnHierarchyName;
	
	private String hdnAliasName;
	
	private String hdn_ids;
	
	private String hdn_qs;
	
	private int hierarchyId;	

	private int subNodeId;
	
	private String subNodeName;	
	
	private String subNodeAlias;
	
	
	private String selstatus;
	
	private int buttonId;
	
	private String buttonName;
	
	private int functionId;

	private String functionName;
	
	private int globalLinkId;
	
	private String globalLinkName;
	
	private List <LoginVo> getHierarchySubNodeList ;
	
	private List <HierarchyMasterVo> hierarchyMasterList ;
	
	private List <SubHierarchyVo> subHierarchyMasterList ;
	
	private List <SubHierarchyVo> subNodeList ;
	
	private int globalLnkIdForClearData;
	
	public int getGlobalLnkIdForClearData() {
		return globalLnkIdForClearData;
	}
	public void setGlobalLnkIdForClearData(int globalLnkIdForClearData) {
		this.globalLnkIdForClearData = globalLnkIdForClearData;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	public String getUsername() {
		return userName;
	}
	public void setUsername(String username) {
		this.userName = username;
	}


	private String fullName;
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	

	public String getSelstatus() {
		return selstatus;
	}
	public void setSelstatus(String selstatus) {
		this.selstatus = selstatus;
	}
	
	public List<SubHierarchyVo> getSubNodeList() {
		return subNodeList;
	}
	
	public List<LoginVo> getGetHierarchySubNodeList() {
		return getHierarchySubNodeList;
	}
	public void setGetHierarchySubNodeList(List<LoginVo> getHierarchySubNodeList) {
		this.getHierarchySubNodeList = getHierarchySubNodeList;
	}
	public void setSubNodeList(List<SubHierarchyVo> subNodeList) {
		this.subNodeList = subNodeList;
	}
	public int getButtonId() {
		return buttonId;
	}
	public void setButtonId(int buttonId) {
		this.buttonId = buttonId;
	}
	public String getButtonName() {
		return buttonName;
	}
	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}
	public int getFunctionId() {
		return functionId;
	}
	public void setFunctionId(int functionId) {
		this.functionId = functionId;
	}
	public String getFunctionName() {
		return functionName;
	}
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
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

	public String getLevelNumber() {
		return levelNumber;
	}
	public void setLevelNumber(String levelNumber) {
		this.levelNumber = levelNumber;
	}
	
	public List<HierarchyMasterVo> getHierarchyMasterList() {
		return hierarchyMasterList;
	}
	public void setHierarchyMasterList(List<HierarchyMasterVo> hierarchyMasterList) {
		this.hierarchyMasterList = hierarchyMasterList;
	}
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
	}
	public String getDataName() {
		return dataName;
	}
	public void setDataName(String dataName) {
		this.dataName = dataName;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getLineOfficeId() {
		return lineOfficeId;
	}
	public void setLineOfficeId(String lineOfficeId) {
		this.lineOfficeId = lineOfficeId;
	}
	public String getOfficeId() {
		return officeId;
	}
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	public String getOfficeName() {
		return officeName;
	}
	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}
	public int getSectionId() {
		return sectionId;
	}
	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public String getLineDepartmentName() {
		return lineDepartmentName;
	}
	public void setLineDepartmentName(String lineDepartmentName) {
		this.lineDepartmentName = lineDepartmentName;
	}
	public String getLinedepartmentId() {
		return linedepartmentId;
	}
	public void setLinedepartmentId(String linedepartmentId) {
		this.linedepartmentId = linedepartmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getDepartmentParentId() {
		return departmentParentId;
	}
	public void setDepartmentParentId(String departmentParentId) {
		this.departmentParentId = departmentParentId;
	}
	public int getOfficeNameWithId() {
		return officeNameWithId;
	}
	public void setOfficeNameWithId(int officeNameWithId) {
		this.officeNameWithId = officeNameWithId;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getOfficeAddress() {
		return officeAddress;
	}
	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
	public int getTotalFileCount() {
		return totalFileCount;
	}
	public void setTotalFileCount(int totalFileCount) {
		this.totalFileCount = totalFileCount;
	}
	public int getTotalMovmentFile() {
		return totalMovmentFile;
	}
	public void setTotalMovmentFile(int totalMovmentFile) {
		this.totalMovmentFile = totalMovmentFile;
	}
	public int getTotalIdealFile() {
		return totalIdealFile;
	}
	public void setTotalIdealFile(int totalIdealFile) {
		this.totalIdealFile = totalIdealFile;
	}
	public int getDesignationId() {
		return designationId;
	}
	public void setDesignationId(int designationId) {
		this.designationId = designationId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getPrimaryLinkId() {
		return primaryLinkId;
	}
	public void setPrimaryLinkId(int primaryLinkId) {
		this.primaryLinkId = primaryLinkId;
	}
	
	public String getPrimaryLinkName() {
		return primaryLinkName;
	}
	public void setPrimaryLinkName(String primaryLinkName) {
		this.primaryLinkName = primaryLinkName;
	}
	public String getDesigName() {
		return desigName;
	}
	public void setDesigName(String desigName) {
		this.desigName = desigName;
	}
	public int getIntOfficeId() {
		return intOfficeId;
	}
	public void setIntOfficeId(int intOfficeId) {
		this.intOfficeId = intOfficeId;
	}
	public String getHdnID() {
		return hdnID;
	}
	public void setHdnID(String hdnID) {
		this.hdnID = hdnID;
	}
	public String getHdnHierarchyName() {
		return hdnHierarchyName;
	}
	public void setHdnHierarchyName(String hdnHierarchyName) {
		this.hdnHierarchyName = hdnHierarchyName;
	}
	public String getHdnAliasName() {
		return hdnAliasName;
	}
	public void setHdnAliasName(String hdnAliasName) {
		this.hdnAliasName = hdnAliasName;
	}
	public String getHdn_ids() {
		return hdn_ids;
	}
	public void setHdn_ids(String hdn_ids) {
		this.hdn_ids = hdn_ids;
	}
	public String getHdn_qs() {
		return hdn_qs;
	}
	public void setHdn_qs(String hdn_qs) {
		this.hdn_qs = hdn_qs;
	}
	public int getHierarchyId() {
		return hierarchyId;
	}
	public void setHierarchyId(int hierarchyId) {
		this.hierarchyId = hierarchyId;
	}
	public List <SubHierarchyVo> getSubHierarchyMasterList() {
		return subHierarchyMasterList;
	}
	public void setSubHierarchyMasterList(List <SubHierarchyVo> subHierarchyMasterList) {
		this.subHierarchyMasterList = subHierarchyMasterList;
	}
	
	
	public int getSubNodeId() {
		return subNodeId;
	}
	public void setSubNodeId(int subNodeId) {
		this.subNodeId = subNodeId;
	}
	public String getSubNodeName() {
		return subNodeName;
	}
	public void setSubNodeName(String subNodeName) {
		this.subNodeName = subNodeName;
	}
	public String getSubNodeAlias() {
		return subNodeAlias;
	}
	public void setSubNodeAlias(String subNodeAlias) {
		this.subNodeAlias = subNodeAlias;
	}
	


	private List<String> checkedFunctionIds;

	public List<String> getCheckedFunctionIds() {
		return checkedFunctionIds;
	}

	public void setCheckedFunctionIds(List<String> checkedFunctionIds) {
		this.checkedFunctionIds = checkedFunctionIds;
	}
	public String getAction1() {
		return action1;
	}
	public void setAction1(String action1) {
		this.action1 = action1;
	}
	public String getAction2() {
		return action2;
	}
	public void setAction2(String action2) {
		this.action2 = action2;
	}
	public String getAction3() {
		return action3;
	}
	public void setAction3(String action3) {
		this.action3 = action3;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public byte getLinkAccess() {
		return linkAccess;
	}
	public void setLinkAccess(byte linkAccess) {
		this.linkAccess = linkAccess;
	}
	
	
	
	
}
