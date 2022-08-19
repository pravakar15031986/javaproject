<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>

<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>
<script>
/* function findUserbyName(userName)
{
	 var dataString = 'userName='+ userName;
	 $.ajax({
		 	type: "POST",
           url : "/getListByUserName",
           data: dataString,
			cache: false,
           success : function(data) {  
      alert(JSON.stringify(data.data));
          var d = data.data;
				    var i=0;
				   var j=1;
				   var slno=1;

			    $(d).each(function (idx,li){
					   $('#userDetails tr:last').after('<tr><td><input type="hidden" id="usernameId'+slno+'" value="" name="usernameId">'+slno+'</td><td>'+li.userName+'</td><td> <input type="hidden" id="emial'+slno+'" value="'+d[i+1][j+1]+'">'+li.email+'</td><td> <input type="hidden" id="mobile'+slno+'" value="'+d[i+2][j+2]+'">'+li.mobile+'</td><td>'+li.bitStatus+'</td><td><a title="Unblock" ><button class="btn btn-primary btn-xs" id="edit"><span class="glyphicon glyphicon-pencil"></span></button></a></td></tr>');
					   parseInt(count)+1;
					   i++;
					   slno++;
					   $select.html(''); 
				   });  
			  
           	 console.log(data);
           },
			  error : function(e) {
				console.log("ERROR: ", e);
			},
			done : function(e) {
				console.log("DONE");
			}
       });
}
 */
function findUserbyName(userName){
	 $("#hdnuserName").val(userName);
	   $("form[name='form']").submit();
	    
 }
 
 function unblockUser(userId,loginCode){
	 if(loginCode=='N'){
		swal("Record Already Unblock."); 
		return false;
	 }else{
		 if (confirm("Do You Want To Unblock The User!")) {
		        txt = "You pressed OK!";
		        $("#hdnuserId").val(userId);
				$("form[name='form1']").submit();
				
		    } else {
		        txt = "You pressed Cancel!";
		        return false;  
		    }
	 }
	
	
 }
		
</script>

<div id="mainTable">

<form:form action="getListByUserName"  name="form" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


<input type="hidden" name="userName" id="hdnuserName"/>
</form:form>

<form:form action="unblockUserByName" name="form1" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


<input type="hidden" name="userId" id="hdnuserId"/>
</form:form>

 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
          
            <div class="tab-content">
                  <div class="row">
                  
                    <div class="col-md-12">
									<c:if test="${not empty errMsg}">
										<div
											class="alert alert-custom-danger fade in alert-dismissible"
											style="margin-top: 18px;">
											<a href="#" class="close" data-dismiss="alert"
												aria-label="close" title="close">x</a> <strong>Error!</strong>${errMsg}
										</div>
									</c:if>
									<c:if test="${not empty msg}">
										<div
											class="alert alert-custom-success fade in alert-dismissible"
											style="margin-top: 18px;">
											<a href="#" class="close" data-dismiss="alert"
												aria-label="close" title="close">x</a> <strong>Success!</strong>${msg}
										</div>
									</c:if>
								</div> 	
								
								
		                <div class="form-group">
		                  <label for="inputEmail3" class="col-sm-2 control-label">Enter Name<span class="mandatory">*</span></label>
		
		                  <div class="col-sm-4">
		                    <input type="text" class="form-control"  maxlength="30" id="userNameId" placeholder="Enter User Name"  onkeypress="findUserbyName($(this).val());">
		                  </div>
		                  </div>
		              
                         </div>
               
               
						
			<div class="table-responsive">

                
               <table class="mytable">
                  <thead>
										<tr>
											<th >Sl no.</th>
											<th >User Name</th>
											<th >Email</th>
											<th >Contact</th>
											<th >Status</th>
											<th ></th>
											<th >Action</th>
										</tr>
									</thead>
              <tbody>
              
              
     <c:if test="${not empty data}"> 
    <c:forEach items="${data}" var="vo" varStatus="counter">
    <c:set var="i" value="${i+1}" />
    
 <tr>
 
    <td><c:out value="${counter.count}"/></td>
    <td>${vo.userName}</td>
    <td>${vo.email}</td>
    <td>${vo.mobile}</td>
    <td class="test"><c:choose>
          <c:when test="${vo.bitStatus==false}"><font color="green">Active</font></c:when>
<c:otherwise><font color="red">Inactive</font></c:otherwise>
</c:choose></td>

<td class="test"><c:choose>
          <c:when test="${vo.firstLogin == 89}"><font color="green">Block</font></c:when>
<c:otherwise><font color="red">Unblock</font></c:otherwise>
</c:choose></td>

    <td style="text-align:center;" ><a data-placement="top" data-toggle="tooltip" title="Edit"  onclick="unblockUser('${vo.userId}','${vo.firstLogin}');"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></a></td>
    
    </tr>
    </c:forEach></c:if>
    </tbody>
    </table>
      </div>
					
      </div>
   </div>
                  <hr>
				
              </div>
             
             

            </div>
          </div>
        </div>
    