<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<div class="sidemenu">
            <div class="user-profile">
            	
            	<p class="logotext sm"><strong>OPLM</strong></p>
                <a class="dropdown-toggle" data-toggle="dropdown">
                
                <img src="wrsis/images/avatar.png" alt="user" >
                <span><c:out value="${sessionScope.FULLNAME}" /><small><c:out value="${sessionScope.DESIGNATION}" /></small></span>
                </a>
            </div>
            <div class="clearfix">
            </div>
            <nav class="navbar">
               <div class="navbar-collapse justify-content-end" id="basicExampleNav">
               <div class="nano-content scroll-bar-wrap">
                  <div class="scroll-box">
                  <ul class="navbar-nav">
                     <li class="nav-item dashboard">
                        <a class="nav-link" href="Home"><i class="icon-airplay"></i><span>Dashboard</span></a>
                     </li>
                     <c:set var="plink"></c:set>
	                  <c:set var="purl"></c:set>
	                  <c:set var="glnkName"></c:set>
                     <c:forEach items="${sessionScope.LEFT_MENU_PERMISSION}" var="entry">
				   			<c:set var="globalLnk">${entry.key}</c:set> 
				   			 <%
						        String  obj  = (String)pageContext.getAttribute("globalLnk");
						        String [] strArr = obj.split(",");
						        pageContext.setAttribute("glnkName", strArr[1].split("=")[1]);
						        pageContext.setAttribute("icon", strArr[9].split("]")[0].split("=")[1]);
      						  %>
      						  <c:set var="lglnkName">${fn:toLowerCase(glnkName)}</c:set>
      						  <c:set var="lglnkName1">${lglnkName}gl</c:set>
				     		  <c:set var="fglnkName">${fn:replace(lglnkName1, ' ', '-')}</c:set>
				     		  
				        <li class="nav-item dropdown ${fglnkName}">
				         <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false"><i class="${icon}"></i><span>${glnkName}</span></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	                            <c:forEach items="${entry.value}" var="prmlnk" varStatus="counter" >
	                            	  <c:set var="lplink">${fn:toLowerCase(prmlnk.primaryLinkName)}</c:set>
				     		  		  <c:set var="fplink">${fn:replace(lplink, ' ', '-')}</c:set>
				     		  		  <c:set var="purl">${prmlnk.fileName}</c:set>
		                             	 <c:if test="${purl eq surl }">
		                             	 <%
		                             	     String  glnkName  = (String)pageContext.getAttribute("fglnkName");
		                             		 String  plink  = (String)pageContext.getAttribute("fplink");
		                             	 	 String  purl  = (String)pageContext.getAttribute("purl");
		                             	 
									        // pageContext.setAttribute("plink", plink,pageContext.PAGE_SCOPE);
									        // pageContext.setAttribute("purl", purl,pageContext.PAGE_SCOPE);
									        // pageContext.setAttribute("glnkName", glnkName,pageContext.PAGE_SCOPE);
									         
									         pageContext.setAttribute("config_plink", plink,pageContext.PAGE_SCOPE);
									         pageContext.setAttribute("config_purl", purl,pageContext.PAGE_SCOPE);
									         pageContext.setAttribute("config_glnkName", glnkName,pageContext.PAGE_SCOPE);
	      						         %>
      						         </c:if>
	                                 <a class="dropdown-item  ${fplink}" href="${prmlnk.fileName}">${prmlnk.primaryLinkName}</a>
					     	    </c:forEach>
                            </div>
                         </li>
				       </c:forEach>  
				       
                     
                  </ul>
                   </div>
                  
                  <div class="cover-bar"></div>
                  
                </div>  
               </div>
            </nav>
         </div>
         
         
          <script>
$(document).ready(function(){
	var url='${viewUrl}';
	if(url == 'Home'){
		$('.dashboard').addClass('active');
	}
loadNavigation('${viewUrl}', '${config_glnkName}', '${config_plink}', '${config_plink}', '${config_plink}', '${config_plink}');
});
</script>
    