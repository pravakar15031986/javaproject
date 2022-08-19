package com.csm.ORSAC.adminconsole.webportal.api;

import com.csm.ORSAC.adminconsole.webportal.util.OrsacPortalConstant;

public class ApiUrl {
	
	private ApiUrl() {
	    throw new IllegalStateException(OrsacPortalConstant.API_CLASS);
	  }
	
	public static class Group{
		private Group() {
		    throw new IllegalStateException(OrsacPortalConstant.API_CLASS);
		  }
		public static final String ADD_ROLE="/addRole";
		public static final String GET_ROLES="/getRoles";
		public static final String EDIT_ROLE="/editRoleMaster/{id}";
		
		public static final String UPDATE_ROLE="/updateRole";
		public static final String GET_ROLE="/getRole/{role_id}";
		public static final String DEACTIVE_ROLE="/deactiveRole/{role_id}/{status}";
		public static final String DELETE_ROLE="/deleteRole/{role_id}";
	}

	public static class PrimaryLink{
		private PrimaryLink() {
		    throw new IllegalStateException(OrsacPortalConstant.API_CLASS);
		  }
		public static final String GET_PRIM_LINKS ="/getPrimaryLinks";
	}
	
	
	public static class AdminUser{
		
		private AdminUser() {
		    throw new IllegalStateException(OrsacPortalConstant.API_CLASS);
		  }
		
		public static final String ADD_PERMISSION ="/addUserPermission";
		public static final String SET_PERMISSION_TO_USER ="/setUserPermission";
		public static final String GET_PERMISSION_ASSIGNED_USERS = "/getPermissionAsignedUsers";
		public static final String GET_GROUPS="/getGroups";
		public static final String GET_USERS="/getUsers";
		public static final String SEARCH_USER = "/searchUser";
		public static final String EDIT_USER_PERMISSION = "/editUserPermission";
		public static final String UPDATE_USER_PERMISSION = "/updateUserPermission";
		public static final String EDIT_GROUP_PERMISSION ="/editGroupPermission";
		public static final String UPDATE_GROUP_PERMISSION = "/updateGroupPermission";
		
	}

	
	public static class User{
		
		private User() {
		    throw new IllegalStateException(OrsacPortalConstant.API_CLASS);
		  }

		public static final String GET_PRIMARY_LNK_ACTION = "/getPrimaryLinkAction";
		
	}
	
	public static class MobileAPI{
		
		private MobileAPI() {
			throw new IllegalStateException(OrsacPortalConstant.API_CLASS);
		}
		
		public static final String SEND_OTP="/sendOtp";
		public static final String VERIFY_OTP="/verifyOtp";
		public static final String MASTER_DATA="/masterData";
		public static final String UPLOAD_PROFILE_IMAGE="/uploadProfileImage";
		public static final String TAKE_ACTION="/takeAction";
		public static final String VILLAGE_LIST="/getVillageList";
		public static final String PENDING_PLOTS="/getPendingPlots";
		
	}
	
	public static class GisAPI{
		
		private GisAPI() {
			throw new IllegalStateException(OrsacPortalConstant.API_CLASS);
		}
		
		public static final String DISTRICT_MASTER="/getDistrictsMaster";
		public static final String TAHASIL_MASTER="/getTahasilMaster";
		public static final String VILLAGE_MASTER="/getVillageMaster";

		
	}

}
