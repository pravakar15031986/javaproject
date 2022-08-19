
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<style>
	@media and screen (max-width: 992px){
			/* .side_bar{width:100%} */
	header .navbar .navbar-nav .dropdown-menu{position:relative;right:0rem}
	}
</style>
<header>
         <nav class="navbar main_nav">
            <!-- Navbar brand -->
            <a class="navbar-brand" href="Home" title="Odisha Paddy Land Monitor">
               <h1><img src="wrsis/images/logo_white_orsac.png" alt="Logo" class="lg-logo">
               <span class="title  d-md-block d-none">Odisha Paddy Land Monitor<span class="d-block">Food Supplies & Consumer Welfare Department</span></span>
               <span class="title mobile d-md-none d-block">OPLM</span>
               </h1>
            </a>
           <!--  <a class="nav-toggle-btn">
            <span></span>
            </a> -->
           <!--  <div class="navbar-collapse d-flex justify-content-center collapse">
            	<ul class="navbar-nav">
            		<li class="nav-item">
            			 <a class="menu_item active" href="Javascript:void(0);">Dashboard</a>
            		</li>
            		<li class="nav-item">
            			 <a class="menu_item" href="Javascript:void(0);">Survey Report</a>
            		</li>
            			<li class="nav-item">
            			 <a class="menu_item" href="Javascript:void(0);">Inspector Registration</a>
            		</li>
            		<li class="nav-item ">
            			 <a class="menu_item drop_down" href="Javascript:void(0);">Mis Report</a>
            			 <div class="sub-menu" style="display:none">
            			 	<p>Report One </p>
            			 	<p>Report Two </p>
            			 	<p>Report Three</p>
            			 	<p>Report Four</p>
            			 </div>
            		</li>
            	
            		<li class="nav-item">
            			 <a class="menu_item" href="Javascript:void(0);">Map Viewer</a>
            		</li>
            		
            	</ul>
            </div> -->
            <nav class="navbar navbar-expand-lg ml-auto">
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"><i class="fa fa-bars" aria-hidden="true"></i></span>
				  </button>
				  <div class="collapse navbar-collapse dropdown_menu" id="navbarNavDropdown">
				    <ul class="navbar-nav dropdown_menu_list nav">
				   
				      <li class="nav-item active side_bar">
				        <a class="nav-link" href="Home">Dashboard</a>
				      </li>
				      
				      
				      <!-- <li class="nav-item">
				        <a class="nav-link" href="viewSurveyReport">Survey Report</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link" href="viewRegisterPacsInspector">Inspector Registration</a>
				      </li> -->
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
				     	
				      <li class="nav-item dropdown ${fglnkName} side_bar">
				        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				         	<span>${glnkName}</span> <i class="fa fa-caret-down ml-2" aria-hidden="true"></i>
				        </a>
				        <div class="dropdown-menu" style="display:none;" aria-labelledby="navbarDropdownMenuLink">
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
				   <%--    <li class="profile_details">
                  	<a class="nav-link dropdown-toggle nav-user setting-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <div class="d-sm-block d-none">
                        <img src="wrsis/images/avatar.png" alt="Profile image" class="avatar-rounded">                       
                        <span class="profile-name"><c:out value="${sessionScope.FULLNAME}" /><br><small><c:out value="${sessionScope.DESIGNATION}" /></small></span>
                    	</div>
                    	<div class="d-sm-none d-block"><span class="icon-lock1"></span></div>
                    </a>
                  </li>	   --%>    
				      <!--  <li class="nav-item">
				        <a class="nav-link" href="#">Map Viewer</a>
				      </li> -->
				    </ul>
				  </div>
				</nav>
            
            <!-- Collapse button -->
           
            <!-- Collapsible content -->
            <div class="navbar-collapse d-flex justify-content-end collapse" id="basicExampleNav">
				<!-- <div class="nav-logo d-none d-lg-block">
				<a href="http://www.moa.gov.et/" title="Ministry of Agriculture" target="_blank"><img src="wrsis/images/logo.png" alt="Logo" class="float-left mr-2"></a>
					<a href="http://www.ata.gov.et/" title="ATA" target="_blank"><img src="wrsis/images/atl_logo.jpg" alt="Logo" class="float-left"></a>
					<a href="http://www.eiar.gov.et/" title="eiar" target="_blank"><img src="wrsis/images/eiar_logo.jpg" alt="Logo" class="float-left"></a>
					<a href="https://www.cimmyt.org/" title="cimmyt" target="_blank"><img src="wrsis/images/cimmyt_logo.jpg" alt="Logo" class="float-left"></a>
				</div> -->
				
				
               <!-- Links -->
               <ul class="navbar-nav float-right">
                  <!-- <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"><i class="icon-bell1"></i> <span class="nobadge" id="totalUnreadNtf"></span></a>
                     <div class="dropdown-menu notifications scroll-bar-wrap" aria-labelledby="navbarDropdownMenuLink" >
						<div class="scroll-box">
							<ul id="notifications">
								
								<span id="emptyMsg"></span>
							</ul>
						</div>
                     </div>
                  </li> -->
                <li class="nav-item profile_details mr-sm-3">
                  	<a class="nav-link dropdown-toggle nav-user setting-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <div class="d-sm-block d-none">
                        <img src="wrsis/images/avatar.png" alt="Profile image" class="avatar-rounded">                       
                        <span class="profile-name"><c:out value="${sessionScope.FULLNAME}" /><br><small><c:out value="${sessionScope.DESIGNATION}" /></small></span>
                    	</div>
                    	<div class="d-sm-none d-block lock_parent"><span class="icon-lock1 text-white"></span></div>
                    </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link logout" href="Javascript:void(0);"  data-toggle="tooltip" data-placement="bottom" data-original-title="Logout"><i class="icon-log-out1"></i></a>
                  </li>
                  <!-- Dropdown -->
               </ul>
               <!-- Links -->
            </div>
            <!-- Collapsible content -->
         </nav>
         <!--/.Navbar-->
      </header>
      <!-- Modal -->
  <div class="modal fade bd-example-modal-lg" id="notifyModal" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         
          <h4 class="modal-title">Notification Details</h4>
        </div>
        
        <div class="modal-body">
        		
         		<table data-toggle="table" class="table table-hover table-bordered">
                                 <thead id="tblHd">
                                    
                                 </thead>
                                 <tbody id="tblBdy">
                                   
                                 </tbody>
                              </table>
                              <p id="modalMsg"></p>
                          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
      
       <div class="logout-modal">
         <div class="logou-container text-center">
            <div class="container">
               <h3>Do you really want to log out?</h3>
               <a href="logout" class="btn btn-primary">Yes</a>
               <a class="btn btn-danger nologout">No</a>
            </div>
         </div>
      </div>
      <span id="totalNot" style="display:none;"></span>
     <script>
     $(document).ready(function(){
    	 $('ul.nav li.dropdown').hover(function() {
    		 /* alert("hello"); */
       	  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
       	}, function() {
       	  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(50);
       	});
    	  debugger;
    	 $(".dropdown_menu_list").children('li').last().removeClass("side_bar") 
     })
    
     </script>
     <!--  <script>
      $(document).ready(function()
      {
    	  
    	  $.ajax({
      		type : "POST",
      		url : "getUnreadNtfsByUserId",
      		
      		success : function(response) {
      			 
      		
      			var html ='';
      			var val=JSON.parse(response);
      			var html ="";
  					html += val.unreadNtfCount;
  				$("#totalNot").html(val.TotalNot);
  				$('#totalUnreadNtf').append(html);
  				
      		},error : function(error) {
      			 
      		}
      	});
    	  
        	$.ajax({
        		type : "POST",
        		url : "getDesktopNotificationsByUserId", 
        	 
        		
        		success : function(response) {
        			 
        		
        			var html ='';
        			var val=JSON.parse(response);
        			 
        			 /* <li><a>Message for you <span>25-Jun-2019</span></a></li> */ 
        			var html ="";
        			 var fullMsg="";
        			 var shortMsg="";
        			 var ntfId="";
        			 var ntfDate="";
        			 var ntfFrom="";
    				$.each(val,function(i, item) {
    					ntfId=item.ntfId;
    					fullMsg=item.ntfMsg;
    					ntfDate=item.ntfDate;
    					ntfFrom=item.fullname + "("+item.username+")";
    					if(fullMsg.length>15)
    						{
    						shortMsg=fullMsg.substr(0,18).concat("...");
    						}
    					else
    						{
    						shortMsg=fullMsg;
    						}
    					if(item.ntfReadStatus=="false"){
    						html += "<li style='color: #83a750;'><a data-placement='top' data-toggle='modal' data-target='#notifyModal' class='ntf' id='notification"+ntfId+"' onclick='return ntfInfo( \"" + ntfId + "\"  , \"" + fullMsg + "\" , \"" + ntfDate + "\" , \""+ ntfFrom +"\" );'>" + shortMsg + "<span>" + item.ntfDate + "</span></a></l>"; 
    					}
    					else
    						{
    						html += "<li><a data-placement='top' data-toggle='modal' data-target='#notifyModal' class='ntf' id='notification"+ntfId+"' onclick='return ntfInfo( \"" + ntfId + "\"  , \"" + fullMsg + "\" , \"" + ntfDate + "\" , \""+ ntfFrom +"\" );'>" + shortMsg + "<span>" + item.ntfDate + "</span></a></l>"; 
    						}
    				});/* data-placement="top" data-toggle="modal" title="User Info" data-target="#notifyModal" */
    				var totalNot = $("#totalNot").html();
    				totalNot = parseInt(totalNot);
    				if((1*10) < totalNot)
    				{
    				html += "<li class='pt-2 text-center'><input  type='button' value='Load More' class='btn btn-primary' id='loadMore' offset='1' ></li>";
    				}
    				$('#notifications').append(html);
        			
        		},error : function(error) {
        			 
        		}
        	});
        	
        	
        	
        	
        });
      </script>
      <script>
      function ntfInfo(ntfId,fullMsg,ntfDate,ntfFrom)
      {
      	$('#tblHd').empty();
      	$('#tblBdy').empty();
      	$('#modalMsg').empty(); 
      	
      	var htmlBody ="";
		    var htmlHead ='<tr><th>Notification Sent From</th><th>Notification Message</th><th>Date</th></tr>';
			
			htmlBody += '<tr><td>' + ntfFrom+ '</td><td>' + fullMsg + '</td><td>' + ntfDate  + '</td></tr>';
			
			$('#tblHd').append(htmlHead);
			$('#tblBdy').append(htmlBody);
      	
      	
      	 $.ajax({
      		type : "POST",
      		url : "updateNtfReadStatus", 
      	 
      		data : {
      			"notifyId":ntfId
      		},
      		success : function(response) {
      			var val=JSON.parse(response);
    			var html ="";
					html += val.unreadNtfCount;
				
				$('#totalUnreadNtf').html(html);
				$("#notification"+ntfId).css("color","black");
      		},error : function(error) {
      			 
      		}
      	});  
      }
      </script> -->
     <!--  <script>

$(document).on('click','#loadMore',function()
		{
	var offset = $(this).attr('offset');
	$.ajax({
		type : "POST",
		url : "getDesktopNotificationsByUserIdLoadMore", 
	 	data:"offset="+offset,
		
		success : function(response) {
			var offset1 = $(this).attr('offset');
			offset1 = parseInt(offset) +1;
		
			 var html ='';
			var val=JSON.parse(response);
			if(val.length == 0 ){
				/* $('#emptyMsg').html('No Notifications available'); */
			} 
			 /* <li><a>Message for you <span>25-Jun-2019</span></a></li> */ 
			var html ="";
			 var fullMsg="";
			 var shortMsg="";
			 var ntfId="";
			 var ntfDate="";
			 var ntfFrom="";
			$.each(val,function(i, item) {
				ntfId=item.ntfId;
				fullMsg=item.ntfMsg;
				ntfDate=item.ntfDate;
				ntfFrom=item.fullname + "("+item.username+")";
				if(fullMsg.length>15)
					{
					shortMsg=fullMsg.substr(0,18).concat("...");
					}
				else
					{
					shortMsg=fullMsg;
					}
				if(item.ntfReadStatus=="false"){
					html += "<li style='color: #83a750;'><a data-placement='top' data-toggle='modal' data-target='#notifyModal' class='ntf' id='notification"+ntfId+"' onclick='return ntfInfo( \"" + ntfId + "\"  , \"" + fullMsg + "\" , \"" + ntfDate + "\" , \""+ ntfFrom +"\" );'>" + shortMsg + "<span>" + item.ntfDate + "</span></a></l>"; 
				}
				else
					{
					html += "<li><a data-placement='top' data-toggle='modal' data-target='#notifyModal' class='ntf' id='notification"+ntfId+"' onclick='return ntfInfo( \"" + ntfId + "\"  , \"" + fullMsg + "\" , \"" + ntfDate + "\" , \""+ ntfFrom +"\" );'>" + shortMsg + "<span>" + item.ntfDate + "</span></a></l>"; 
					}
				
				
			});/* data-placement="top" data-toggle="modal" title="User Info" data-target="#notifyModal" */
			$('#notifications li:last-child').remove();
			var totalNot = $("#totalNot").html();
			totalNot = parseInt(totalNot);
			if((offset1*10) < totalNot)
				{
			html += "<li><br><center><input  type='button' value='Load More' class='btn btn-primary' id='loadMore' style='width:100px;height:30px;' offset='"+offset1+"' ></center><br></li>";
				}
			
			$('#notifications').append(html);
			
		},error : function(error) {
			 
		}
	});
		});
</script> -->
<script>
	$(document).ready(function(){
	
		$(".drop_down").click(function(){
	        $( ".sub-menu" ).slideToggle("slow");
	   });
	})
</script>
<script>


</script>