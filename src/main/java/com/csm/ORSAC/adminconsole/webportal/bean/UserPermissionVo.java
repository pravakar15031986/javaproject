package com.csm.ORSAC.adminconsole.webportal.bean;

import java.io.Serializable;
import java.util.List;


public class UserPermissionVo implements Serializable{
	private static final long serialVersionUID = 3698964944990967677L;
	
	private int accessId;
	
	private int userId;
	
	private String linkType;
	
	private int functionId;
	
	private String fileName;
	
	private String externalUrl;
	
	private int primaryId;
	
	private String primaryName;
	
	private int GlobalId;
	
	private String globalName;
	
	private String action;
	
	private int access;

	private List<PrimaryLinkVo> primaryLinks;
	
	private String radType;
	
	private String selGroup;
	
	private String txtUserName;
	
	private String RAselLocation;
	
	private int levelId;
	
	private String selUser;
	
	private String txtCopyUser;
	
	private String selAllUser;
	
	private int chkPLinkName;
	public int getChkPLinkName() {
		return chkPLinkName;
	}

	public void setChkPLinkName(int chkPLinkName) {
		this.chkPLinkName = chkPLinkName;
	}

	public String getSelAllUser() {
		return selAllUser;
	}

	public void setSelAllUser(String selAllUser) {
		this.selAllUser = selAllUser;
	}

	public String getTxtCopyUser() {
		return txtCopyUser;
	}

	public void setTxtCopyUser(String txtCopyUser) {
		this.txtCopyUser = txtCopyUser;
	}

	public String getSelUser() {
		return selUser;
	}

	public void setSelUser(String selUser) {
		this.selUser = selUser;
	}

	public int getLevelId() {
		return levelId;
	}

	public void setLevelId(int levelId) {
		this.levelId = levelId;
	}

	public String getRAselLocation() {
		return RAselLocation;
	}

	public void setRAselLocation(String rAselLocation) {
		RAselLocation = rAselLocation;
	}

	public String getTxtUserName() {
		return txtUserName;
	}

	public void setTxtUserName(String txtUserName) {
		this.txtUserName = txtUserName;
	}

	public String getSelGroup() {
		return selGroup;
	}

	public void setSelGroup(String selGroup) {
		this.selGroup = selGroup;
	}

	public String getRadType() {
		return radType;
	}

	public void setRadType(String radType) {
		this.radType = radType;
	}

	public List<PrimaryLinkVo> getPrimaryLinks() {
		return primaryLinks;
	}

	public void setPrimaryLinks(List<PrimaryLinkVo> primaryLinks) {
		this.primaryLinks = primaryLinks;
	}

	public int getAccessId() {
		return accessId;
	}

	public void setAccessId(int accessId) {
		this.accessId = accessId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getLinkType() {
		return linkType;
	}

	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}

	public int getFunctionId() {
		return functionId;
	}

	public void setFunctionId(int functionId) {
		this.functionId = functionId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getExternalUrl() {
		return externalUrl;
	}

	public void setExternalUrl(String externalUrl) {
		this.externalUrl = externalUrl;
	}

	public int getPrimaryId() {
		return primaryId;
	}

	public void setPrimaryId(int primaryId) {
		this.primaryId = primaryId;
	}

	public String getPrimaryName() {
		return primaryName;
	}

	public void setPrimaryName(String primaryName) {
		this.primaryName = primaryName;
	}

	public int getGlobalId() {
		return GlobalId;
	}

	public void setGlobalId(int globalId) {
		GlobalId = globalId;
	}


	public String getGlobalName() {
		return globalName;
	}

	public void setGlobalName(String globalName) {
		this.globalName = globalName;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getAccess() {
		return access;
	}

	public void setAccess(int access) {
		this.access = access;
	}
	
	
	
}
