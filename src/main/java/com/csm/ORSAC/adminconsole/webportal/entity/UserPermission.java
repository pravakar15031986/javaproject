package com.csm.ORSAC.adminconsole.webportal.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="m_por_linkaccess")
public class UserPermission implements Serializable{
	private static final long serialVersionUID = 3698964944990967677L;
	
	@Id	
	@Column(name = "intAccessId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int accessId;
	
	@Column(name="intUserID")
	private int userId;
	
	@Column(name="bitLinkType")
	private String linkType;
	
	@Column(name="intFunctionId")
	private int functionId;
	
	@Column(name="vchFileName")
	private String fileName;
	
	@Column(name="vchExternalURL")
	private String externalUrl;
	
	@Column(name="intPlinkId")
	private int primaryId;
	
	@Column(name="nvchPlinkName")
	private String primaryName;
	
	@Column(name="intGlinkId")
	private int GlobalId;
	
	@Column(name="nvchGLinkName")
	private String globalName;
	
	@Column(name="vchAction1")
	private String action;
	
	@Column(name="tinAccess")
	private int access;

	@Transient
	private List<PrimaryLink> primaryLinks;
	
	@Transient
	private String radType;
	
	@Transient
	private String selGroup;
	
	@Transient
	private String txtUserName;
	
	@Transient
	private String RAselLocation;
	
	@Transient
	private int levelId;
	
	@Transient
	private String selUser;
	
	@Transient
	private String txtCopyUser;
	
	@Transient
	private String selAllUser;
	
	@Transient
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

	public List<PrimaryLink> getPrimaryLinks() {
		return primaryLinks;
	}

	public void setPrimaryLinks(List<PrimaryLink> primaryLinks) {
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
