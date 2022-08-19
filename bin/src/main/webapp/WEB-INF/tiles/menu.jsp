<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="scripts/scriptbreaker-multiple-accordion-1.js"></script>
   
	<script>
	
	function managehireachy(){
		window.location.href="addHierarchyMaster"
		
	}
	
	</script>
  
	<style type="text/css">
		.submenu{display: none}
	</style>
	<%
	String action=request.getParameter("actn");
	String action2=request.getParameter("actn2");
	String action3=request.getParameter("actn3");
	if(action==null){ action="na";action2="na";action3="na";}
	int i=0;
%>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="image">
          <img src="wrsis/images/avatar.png" class="img-circle" alt="User Image">
        </div>
        <div class="info">
          <p>${USER_NAME}</p>
         
          <small>Last Logged On<br><i>09-May-2018 10:19 AM</i></small>
        </div>
      </div>
    
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">

<%-- <li <c:if test="${not empty modelObj.hierarchyMasterList}"> class="treeview" </c:if> ><a href="addHierarchyMaster" > <!-- onclick="managehireachy();" -->
            <i class="fa fa-files-o"></i> <span>Hierarchy Master</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
      <ul class="treeview-menu">
        <c:if test="${not empty modelObj.hierarchyMasterList}">
			<c:forEach items="${modelObj.hierarchyMasterList}" var="vo1">				
				<li  <c:if test="${not empty subVo.subHierarchyMasterList}"> class="treeview" </c:if>  <%if(action.equals(String.valueOf(i))) {%>class="active"<%} %> ><a href="getSubNodeList?hierarchyMasterID=${vo1.hierarchyId}&actn=<%=i%>"><i class="fa fa-circle-o"></i><b >${vo1.hierarchyName}</b><span class="pull-right-container">
          <i class="fa fa-angle-left pull-right"></i>
        </span></a>onclick="manageSubHierarchy('${vo1.hierarchyId}')"
			       <ul class="treeview-menu">  
			       		<c:if test="${not empty subVo.subHierarchyMasterList}">   
			       		<%int j=1; %>
			       		<%int slno=0; %>	
				       		 <c:forEach items="${subVo.subHierarchyMasterList}" var="subnode">
					       		 <c:if test="${vo1.hierarchyId eq subnode.hierarchyId }">
						       		  <c:set var="titleURL">
						       		  	 <c:url value="${subnode.subNodeURL}">  
						                   <c:param name="hierarchyID" value="${subnode.hierarchyId}"/>
						                   <c:param name="subnodeid" value="${subnode.subNodeId}"/>  
						                    <c:param name="levelId" value="${subnode.subLevelNumber}"/> 
						                </c:url>  
					           		 </c:set> 
						       		    	    	            
				   	                  <li><a href="${titleURL}&no=<%=slno%>&actn=<%=i%>&actn2=11&actn3=<%=j %>" <%if(String.valueOf(j).equals(action3)) {%>class="active"<%} %> ><i class="fa fa-dot-circle-o"></i><b>${subnode.subNodeName}</b></a></li> addSubnode.html?subnode_id=${subnode.hierarchyId}&amp;node=${subnode.hierarchyId}
				   	                  <%slno++; j++;%> 
			   	                  
			   	                  </c:if>
		                    </c:forEach>
	                    </c:if>		                                  		       
			       </ul> 		       
			     </li>
			     <%i++; %>
			</c:forEach>
			</c:if>	
      </ul>
  </li> --%>
        
        
        <c:forEach items="${sessionScope.LEFT_MENU_PERMISSION}" var="entry">
        <li class="treeview">
     	  <a href="#"> <span>${entry.key}</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
     	  <ul class="treeview-menu">
     	    <c:forEach items="${entry.value}" var="prmlnk" varStatus="counter" >
     	     <li><a href="${prmlnk.fileName}">${prmlnk.primaryLinkName}</a></li>
     	    </c:forEach>
     	   </ul>
     	   </li>
       </c:forEach>
       
     
       <%--  <li <%if(action.equals("11")||action2.equals("11")) {%>class="active"<%} %>>
			<a href="viewHirachy?hierarchyMasterID=0&actn=11&actn3=0"><i class="fa fa-server"></i><span >Hierarchy Master</span></a><!-- addHierarchyMaster.html -->
			<ul class="accNav" id="leftul" >
			<c:if test="${not empty modelObj.hierarchyMasterList}">
			<c:forEach items="${modelObj.hierarchyMasterList}" var="vo1">				
				<li <%if(action.equals(String.valueOf(i))) {%>class="active"<%} %> ><a href="getSubNodeList.html?hierarchyMasterID=${vo1.hierarchyId}&actn=<%=i%>&actn2=11&actn3=0"><b >${vo1.hierarchyName}</b></a>onclick="manageSubHierarchy('${vo1.hierarchyId}')"
			       <ul>  
			       		<c:if test="${not empty subVo.subHierarchyMasterList}">   
			       		<%int j=1; %>
			       		<%int slno=0; %>	
				       		 <c:forEach items="${subVo.subHierarchyMasterList}" var="subnode">
				       		 <c:set var="titleURL">
			               		<c:url value="${subnode.subNodeURL}">  
				                   <c:param name="hierarchyID" value="${subnode.hierarchyId}"/>
				                   <c:param name="subnodeid" value="${subnode.subNodeId}"/>  
				                </c:url>  
			           		</c:set> 
				       		    	    	            
		   	                  <li><a href="${titleURL}&no=<%=slno%>&actn=<%=i%>&actn2=11&actn3=<%=j %>" <%if(action3.equals(String.valueOf(j))) {%>class="active"<%} %> ><b>${subnode.subNodeName}</b></a></li> addSubnode.html?subnode_id=${subnode.hierarchyId}&amp;node=${subnode.hierarchyId}
		   	                  <%slno++; j++;%>
		                    </c:forEach>
	                    </c:if>		                                  		       
			       </ul> 		       
			     </li>
			     <%i++; %>
			</c:forEach>
			</c:if>			
			</ul>
		</li> --%>
        
        
        
        
        
      <%-- <li class="treeview" <%if(action.equals("21") || action.equals("22")|| action.equals("23") || action.equals("24") || action.equals("25")) {%>class="active"<%} %>> <a href="#">
            <i class="fa fa-link"></i> <span>Manage Link</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
      <ul class="treeview-menu">
        <li><a href="addFunctionMaster?no=1&actn=21&actn2=0&actn3=0" <%if(action.equals("21")) {%>class="active"<%} %>><i class="fa fa-database"></i>Function Master</a></li>
        <li><a href="addGlobalLink?no=1&actn=22&actn2=0&actn3=0" <%if(action.equals("22")) {%>class="active"<%} %> ><i class="fa fa-globe"></i>Global Link</a></li>
        <li><a href="addPrimaryLink?no=1&actn=23&actn2=0&actn3=0" <%if(action.equals("23")) {%>class="active"<%} %> ><i class="fa fa-area-chart"></i>Primary Link</a></li>
        <li><a href="addButtonMaster?no=1&actn=24&actn2=0&actn3=0" <%if(action.equals("24")) {%>class="active"<%} %> ><i class="fa fa-sliders"></i>Button Master</a></li>
        <li><a href="addTabMaster?no=1&actn=25&actn2=0&actn3=0" <%if(action.equals("25")) {%>class="active"<%} %> ><i class="fa fa-folder-open"></i>Tab Master</a></li>
       <li><a href="addUserPermission"  ><i class="fa fa-group"></i>Set Permission</a></li>
      <li><a href="comanyMasterHierarchy"  ><i class="fa fa-group"></i> Company </a></li>
      </ul>
  </li> --%>
        
        
        
      
  
  
  
  
  <%-- <li class="treeview" ><a href="#">
            <i class="fa fa-users"></i> <span>Manage Master</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
      <ul class="treeview-menu">
       <li><a href="addRoleMaster?actn=34&actn2=0&actn3=0" <%if(action.equals("34")) {%>class="active"<%} %> ><i class="fa fa-group"></i>Role Master</a></li>
        <li><a href="addSubscriptionRate" ><i class="fa fa-map-marker"></i> Subscription Rate</a></li>
        <li><a href="addDocumentMaster" ><i class="fa fa-id-card-o"></i>Manage Document</a></li>
        <li><a href="addMemberWiseDocument" ><i class="fa fa-id-card-o"></i>Member Type Document</a></li>
        <!-- <li><a href="addGardenReg"  ><i class="fa fa-sitemap"></i>Manage Garden</a></li> -->
         
        
        <li><a href="addComanyMaster"  ><i class="fa fa-group"></i>Manage Company</a></li>
        <!-- <li><a href="addBusinessUnitMaster"  ><i class="fa fa-group"></i>Manage Business</a></li> -->
        <li><a href="addCountry"  ><i class="fa fa-group"></i>Manage Country</a></li>
        <li><a href="addProvince"  ><i class="fa fa-group"></i>Manage County/City</a></li>
        <li><a href="loadTeaTransactionStatistics"  ><i class="fa fa-group"></i>Tea Transaction statistics</a></li>
        
      </ul>
  </li>
  
  <li class="treeview" ><a href="#">
            <i class="fa fa-files-o"></i> <span>Auction Settings</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
      <ul class="treeview-menu">
        <li><a href="addAuctionCreation" ><i class="fa fa-file"></i>Create Auction</a></li>
        <li><a href="addManageAuctionSetting" ><i class="fa fa-file"></i>Manage Auction</a></li>
        <li><a href="getBuyerManageMentPage"  ><i class="fa fa-group"></i>Manage Buyer</a></li>
        <li><a href="verifySettlementInstruction" ><i class="fa fa-file"></i>Verify Settlement</a></li>
      </ul>
      </li> --%>
  
  
  
   </ul> 
  
  </aside>


	
