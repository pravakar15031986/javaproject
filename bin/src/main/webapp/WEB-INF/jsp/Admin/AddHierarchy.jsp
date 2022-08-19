<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<script >
	/* pageHeader="Add Hierarchy";
	strFirstLink="";
	strLastLink="Hierarchy Master";
	indicate="yes"; */
	$(document).ready(function(){
	//	defaultfocus("txtNodeNo");
		$('#frmAdmin').attr('autocomplete', 'off');
		
		$('#tblRecord input[type=text]').blur(function(){
			var currentId	= this.id;
			var currentVal	= this.value;
			if(currentId.indexOf('txtNode') != -1){
				var rowId		= currentId.replace('txtNode','');
				var flag		= 'N';
			}
			else if(currentId.indexOf('txtAlias') != -1){
				var rowId		= currentId.replace('txtAlias','');
				var flag		= 'A';
			}	
			//checkDuplicate(rowId,currentVal,flag);
		});

		 $("#txtNodeNo").blur(function() {
			var x= $("#txtNodeNo").val(); 
			var y= $("#hdnNodeNo").val();	
			if(x==''){
				alert('Node number can not be blank');
				$("#txtNodeNo").val(y);
				return false;
			}	
			if(x=='0'){
				alert('Node number can not be 0');
				$("#txtNodeNo").val(y);
				return false;
			}
			if(Number(x)<Number(y)){
				alert('Node number can not less than previous node value');
				$("#txtNodeNo").val(y);
				return false;
			}
		});  



		  /* $("#txtNodeNo").blur(function() {
			var x= $("#txtNodeNo").val(); 
			var y= $("#hdnNodeNo").val();
			var z	= Number(y)-1;
			$("#tblRecord tr:gt("+z+")").detach();			
  			var tempHTML = "";						
			for(var i=Number(y)+1; i<=x; i++)
			{				
				 tempHTML = "";
				 tempHTML += '<tr id="nodeTr'+i+'">';
         		 tempHTML += '<td> Hierarchy '+ i + '</td>';
				 tempHTML +=  '<td align="center" valign="middle">:</td>';
				 tempHTML += '<td> <input type="hidden" name="hierarchyMasterList{i}.hierarchyId"  value="0"/><input type="text"  id="txtNode'+i+'" name="hierarchyMasterList{i}.hierarchyName" style="width:200px;"  value="" maxlength="50" onKeyUp="return blockspecialchar_first(this);" class="txtNode" onBlur="checkDuplicate('+i+',this.value,\'N\');" /> <span class="mandatory">*</span></td>';
				 tempHTML += '<td>Alias</td>';
				 tempHTML +=  '<td align="center" valign="middle">:</td>';
				 tempHTML += '<td> <input type="text"  id="txtAlias'+i+'"  name="hierarchyMasterList{i}.hierarchyAlias" style="width:200px;"  value="" maxlength="50" onKeyUp="return blockspecialchar_first(this);" class="txtAlias" onBlur="checkDuplicate('+i+',this.value,\'A\');" /> </td>';
				 tempHTML += '</tr>';				
				$("#tblRecord").append(tempHTML);
			};
		});
		
		
		
		 */
	});
		

	function validator()
	{
		if (!blankFieldValidation('txtNodeNo', 'Hierarchy Node Number')) 
			return false;
		
		if (!IsSpecialCharacter('txtNodeNo', 'Special Character Not Allowed !')) 
			return false;
		
		var nodeNo= $("#txtNodeNo").val();
		for(var i=0; i<nodeNo; i++)
		{
			
			if (!blankFieldValidation('txtNode_'+i, 'Hierarchy Node '+i+' Name')) 
				return false;
			
			if (!IsSpecialCharacter('txtNode_'+i, 'Special Character Not Allowed !')) 
				return false;
			
			if (!IsSpecialCharacter('txtAlias_'+i, 'Special Character Not Allowed !')) 
				return false;
			
		}
		
				
	}
	
	function checkDuplicate(rowId,curVal,flag)
	{    	  	
			/* $('#tblRecord input[type=text]').not('#txtNode'+rowId+', #txtAlias'+rowId).each(function() {
				if(this.value.toLowerCase()==curVal.toLowerCase() && this.value!='')
				{	
					alert(this.value.toLowerCase() +"<------>"+ curVal.toLowerCase())
					if(flag=='N'){
						alert("Duplicate Hierarchy name can't be possible !");
						$('#txtNode_'+rowId).val('');
						$('#txtNode_'+rowId).focus();
						return false;
					}else{
						alert("Duplicate Alias name can't be possible !");
						$('#txtAlias_'+rowId).val('');
						$('#txtAlias_'+rowId).focus();
						return false;
					}
						
					
				}
			});  */ 
	}
</script>

   <script type="text/javascript">
 $(document).ready( function() {
   
	     	 $("#txtNodeNo").keyup(function() {
		     	
			var x= $("#txtNodeNo").val(); 
			var y= $("#hdnNodeNo").val();
			var z	= Number(y)-1;
			$("#tblRecord .form-group:gt("+z+")").detach();			
  			var tempHTML = "";	
  			var t1=0;					
			for(var i=Number(y)+1; i<=x; i++)
			{	 t1=i-1;		
				 tempHTML = "";
				 tempHTML += '<div class="form-group" id="nodeTr'+i+'">';
         		 tempHTML += '<label class="col-sm-2"> Hierarchy '+ i + ' <span class="mandatory1">*</span></label>';
				
				 tempHTML += '<div class="col-sm-4"><span class="colon">:</span> <input type="hidden" name="hierarchyMasterList['+t1+'].hierarchyId" class="form-control" value="0"/><input type="text" class="form-control"  id="txtNode_'+i+'" name="hierarchyMasterList['+t1+'].hierarchyName" value="" maxlength="50" onKeyUp="return blockspecialchar_first(this);" class="txtNode" onBlur="checkDuplicate('+i+',this.value,\'N\');" /></div>';
				 tempHTML += '<label class="col-sm-1"> Alias</label>';
				 tempHTML += '<div class="col-sm-4"><span class="colon">:</span><input type="text" class="form-control"  id="txtAlias_'+i+'"  name="hierarchyMasterList['+t1+'].hierarchyAlias" value="" maxlength="50" onKeyUp="return blockspecialchar_first(this);" class="txtAlias" onBlur="checkDuplicate('+i+',this.value,\'A\');" /> </div>';
				 tempHTML += '</div>';				
				$("#tblRecord").append(tempHTML);
			};
		});	 
	     	
	  	});
	</script> 
<script>

	
	  function removeData(hierarchyMasterID) { 	  
			//var dataString = 'hierarchyMasterID='+hierarchyMasterID;

			 $("#hierarchyMasterID").val(hierarchyMasterID);
		     $("form[name='modifyFrm']").submit();
		     
			/*  $.ajax({
			 	type: "POST",
	            url : 'modifyHireachy',
	            data: dataString,
				cache: false,
	            success : function(data) {  
		            if(data){$
					}else{
					}
		        },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        }); */
	   }
	  



</script>

<form action="modifyHireachy" name="modifyFrm" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>


	<input type="hidden" name="hierarchyMasterID" id="hierarchyMasterID" />
</form> 
<div id="mainTable">

 <div class="row">
        <div class="col-xs-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">

              <li class="active"><a href="addHierarchyMaster">Add</a></li>
              
            </ul>
            <div class="tab-content">
             
              <div class="tab-pane active" id="fa-icons">
                <section id="new">
                  
                  	<div class="col-md-12">
	                  	<c:if test="${not empty errMsg}">
	                  			<div class="alert alert-custom-danger fade in alert-dismissible" style="margin-top:18px;">
							    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
							    	<strong>Error!</strong>${errMsg}
								</div>
	                  	 </c:if>
	                	 <c:if test="${not empty msg}">
	                			<div class="alert alert-custom-success fade in alert-dismissible" style="margin-top:18px;">
							    	<a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">x</a>
							    	<strong>Success!</strong>${msg}
								</div>
	                	</c:if>
                	 </div>
                		
                  <div id="addTable" class="form-horizontal">
					
                  <form:form id="frmAdmin" name="frmAdmin" modelAttribute="modelObj" method="post" action="registerHierarchyMaster" >
				  <div class="col-sm-6">
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2">Total Node No.<span class="mandatory1">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									
									<form:input path="levelNumber" class="form-control" id ="txtNodeNo"  maxlength="2" />						
									<input type="hidden" class="form-control" name="hdnNodeNo" id="hdnNodeNo" value="${modelObj.levelNumber}" /> 
									
								</div>
								
							</div>
						</div>
						<div class="row" id="tblRecord">
						<c:if test="${not empty modelObj.hierarchyMasterList}">
						  <c:forEach items="${modelObj.hierarchyMasterList}" var="vo" varStatus="status" >
						 <c:set var="i" value="${i+1}"/>
							<div class="form-group">
								<label class="control-label col-sm-2">Hierarchy <c:out value="${status.index+1}"></c:out><span class="mandatory1">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									<form:hidden path="hierarchyMasterList[${status.index}].hierarchyId"  id="txtID_${status.index}" value="${vo.hierarchyId}"/>
									<form:input path="hierarchyMasterList[${status.index}].hierarchyName"  id="txtNode_${status.index}" value="${vo.hierarchyName}"  class="txtNode form-control" maxlength="50" onKeyUp="return blockspecialchar_first(this);" />
									
									
								</div>
								<label class="control-label col-sm-1">Alias</label>
								<div class="col-sm-4">
								<span class="colon">:</span>
									<form:input  path="hierarchyMasterList[${status.index}].hierarchyAlias" id="txtAlias_${status.index}"   value="${vo.hierarchyAlias}" class="txtAlias form-control" maxlength="50" onKeyUp="return blockspecialchar_first(this);" />
								</div>
								
								<div>
								<a href="javascript:void(0);" onclick="removeData('${vo.hierarchyId}');" ><span class="glyphicon glyphicon-remove" style="color: red;"></span></a>
								
								</div>
								 
								
							</div>
							</c:forEach> 
							</c:if>
						</div>
						<div class="row">
							<input name="btnSubmit" type="submit" class="btn btn-success" id="btnSubmit" value="Update" onclick="return validator();"/>
						</div>
						
					</div>
					
					</form:form>
					
					
                    
                    
                    
                    </div>
                  
                  
                  
                  
                 
                  </section></div>
                  <div class="clearfix"></div>
              </div>
             </div>
             

            </div>
          </div>
        </div>
