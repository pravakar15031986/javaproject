<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script >
	//pageHeader="create subnode";
	//strFirstLink="Hierarchy Master";
	/* strLastLink="<s:property value="getHierarchy_name()"/>"; */
	//indicate="yes";
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
			checkDuplicate(rowId,currentVal,flag);
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
		$("#txtNodeNo").keyup(function() {
			var x= $("#txtNodeNo").val(); 
			var y= $("#hdnNodeNo").val();
			var z	= Number(y)-1;
			$("#tblRecord .form-group:gt("+z+")").detach();			
  			var tempHTML = "";	
  			var index = 0;					
			for(var i=Number(y)+1; i<=x; i++)
			{		index= i-1;		
				 tempHTML = "";
				 tempHTML += '<div class="form-group" id="nodeTr'+i+'">';
         		 tempHTML += '<label class="col-sm-2"> Subnode'+ i + '<span class="mandatory1">*</span></label>';
				 tempHTML += '<div class="col-sm-4"><span class="colon">:</span><input type="hidden" name="subHierarchyMasterList['+index+'].subNodeId"  value="0"/> <input type="text"  id="txtNode'+i+'" name="subHierarchyMasterList['+index+'].subNodeName" class="form-control"  value="" maxlength="50"  class="txtNode" onBlur="checkDuplicate('+i+',this.value,\'N\');" /> </div>';
				 tempHTML += '<label class="col-sm-1">Alias</label>';
				 tempHTML += '<div class="col-sm-4"><span class="colon">:</span> <input type="text"  id="txtAlias'+i+'"  name="subHierarchyMasterList['+index+'].subNodeAlias" class="form-control"  value="" maxlength="50"  class="txtAlias" onBlur="checkDuplicate('+i+',this.value,\'A\');" /> </div>'; //onKeyUp="return blockspecialchar_first(this);"
				 tempHTML += '</div>';				
				$("#tblRecord").append(tempHTML);
			};
		});
		});

	function validator()
	{
		if (!blankFieldValidation('txtNodeNo', 'Hierarchy Node Number')) 
			return false;
		
		if (!IsSpecialCharacter('txtNodeNo', 'Special Character Not Allowed !')) 
			return false;
		
		var nodeNo= $("#txtNodeNo").val();
		for(var i=1; i<=nodeNo; i++)
		{
			if (!blankFieldValidation('txtNode'+i, 'Subnode'+i+' ')) 
				return false;
			
			if (!IsSpecialCharacter('txtNode'+i, 'Special Character Not Allowed !')) 
				return false;
			
			if (!IsSpecialCharacter('txtAlias'+i, 'Special Character Not Allowed !')) 
				return false;
			
		}
		
		if (!blankFieldValidation('txtNode', 'Subnode1')) 
				return false;
	}
	
	function checkDuplicate(rowId,curVal,flag)
	{
			
			$('#tblRecord input[type=text]').not('#txtNode'+rowId+', #txtAlias'+rowId).each(function() {
				if(this.value.toLowerCase()==curVal.toLowerCase() && this.value!='')
				{
					if(flag=='N'){
						alert("Duplicate node entries can't be possible");
						$('#txtNode'+rowId).val('');
						$('#txtNode'+rowId).focus();
						return false;
					}else{
						alert("Duplicate alias entries can't be possible");
						$('#txtAlias'+rowId).val('');
						$('#txtAlias'+rowId).focus();
						return false;
					}
						
					
				}
			});
	}
	
	
	$(document).ready(function(){
	$('.lftPnl ul ul li a').click(function(){
	
	});
	
	});
</script>

<script type="text/javascript">
function setHierarchyIdAdd(hierarchyId1){
	 $("#hiddenHierarchyId").val(hierarchyId1);
     $("form[name='addSubHierarchy']").submit();
}
</script>

<script type="text/javascript">
function setHierarchyIdView(hierarchyId2){
	 $("#hiddenHierarchyId1").val(hierarchyId2);
     $("form[name='viewSubHierarchy']").submit();
}
</script>


<form name ="addSubHierarchy" id ="addSubHierarchy" action ="getSubNodeList">
<input type="hidden" name ="hierarchyMasterID" id= "hiddenHierarchyId"> <!-- hierarchyId -->
</form>

<form name ="viewSubHierarchy" id ="viewSubHierarchy" action ="viewSubHierarchy">
<input type="hidden" name ="hierarchyId" id= "hiddenHierarchyId1">
</form>

  
  <!-- Login Area-->
  
                  <!--Page Title-->
                  <div class="title" id="title">&nbsp;</div>
                  <div style="text-align: center;color: green;font-weight: bold;">${msg}</div>
    			  <div style="text-align: center;color: red;font-weight: bold;">${errMsg}</div>
                  <!--Tab Button-->
                  <div class="MyTab">
				  <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                      <li class="active"><a href="#" onclick="setHierarchyIdAdd('${subVo.hierarchyId}')">Add</a></li>
                      <%-- <li><a href="javascript:void(0);" onclick="setHierarchyIdView('${subVo.hierarchyId}')">View</a></li> --%>
                    </ul>
                    
                    <!--printbutton Area-->
                 <%--    <jsp:include page="includepage.jsp"></jsp:include> --%>
				  <div class="tab-content">
             
              <div class="tab-pane active" id="fa-icons">
					<div id="addTable" class="form-horizontal">					
                   
                   <form:form id="frmAdmin" name="frmAdmin" method="post" action="registerSubHierarchy" modelAttribute="subVo">
                   
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                   <div class="col-sm-6">
                    <form:hidden id="hierarchyId" path="hierarchyId" />
                    <c:if test="${subVo.levelNumber!= 0}">             
					
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2">Total Subnode No.<span class="mandatory1">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									 <form:input path="levelNumber" id ="txtNodeNo"  class="form-control"   maxlength="2" />						
										<input type="hidden" name="hdnNodeNo" id="hdnNodeNo" value="${subVo.levelNumber}" /> 
								</div>
								
							</div>
						</div>
						<div class="row" id="tblRecord">
						<c:if test="${not empty subVo.subHierarchyMasterList}">
						 <c:forEach items="${subVo.subHierarchyMasterList}" var="vo" varStatus="status" >
						 <c:set var="i" value="${i+1}"/>
							<div class="form-group">
								<label class="control-label col-sm-2">Subnode<c:out value="${status.index+1}"></c:out><span class="mandatory1">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									<form:hidden path="subHierarchyMasterList[${status.index}].subNodeId"  id="txtID_${status.index}" value="${vo.subNodeId}"/>
									<form:input path="subHierarchyMasterList[${status.index}].subNodeName" id="txtNode_${status.index}"  value="${vo.subNodeName}"  class="txtNode form-control" maxlength="50" onKeyUp="return blockspecialchar_first(this);" /> 
								</div>
								<label class="control-label col-sm-1">Alias</label>
								<div class="col-sm-4">
								<span class="colon">:</span>
									<form:input  path="subHierarchyMasterList[${status.index}].subNodeAlias" id="txtAlias_${status.index}"   value="${vo.subNodeAlias}" class="txtAlias form-control" maxlength="50" onKeyUp="return blockspecialchar_first(this);" />
								</div>
								<div>
								<a href="javascript:void(0);" onclick="removeData('${vo.subNodeId}');" ><span class="glyphicon glyphicon-remove" style="color: red;"></span></a>
							</div>
								
							</div>
							</c:forEach>
							
							
							</c:if>
						</div>
						
						
				
					
					
                    					
					</c:if>	
										  
					<c:if test="${subVo.levelNumber == 0 }">					
					<div class="col-sm-6">
						<div class="row">
							<div class="form-group">
								<label class="control-label col-sm-2">Total Subnode No.<span class="mandatory1">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									 <form:input path="levelNumber" id ="txtNodeNo" value="1" cssStyle="width:200px;" onkeypress="return isNumberKey(event);"  maxlength="2" />						
						<input type="hidden" name="hdnNodeNo" id="hdnNodeNo" value="1" /> 
								</div>
								
							</div>
						</div>
						<div class="row" id="tblRecord">
						<c:if test="${not empty subVo.subHierarchyMasterList}">
						 <c:forEach items="${subVo.subHierarchyMasterList}" var="vo" varStatus="status" >
						 <c:set var="i" value="${i+1}"/>
							<div class="form-group">
								<label class="control-label col-sm-2">Subnode 1<span class="mandatory1">*</span></label>
								<div class="col-sm-4">
									<span class="colon">:</span>
									<input type ="hidden" name="subHierarchyMasterList[0].subNodeId"  id="txtID" value="0"/>
									<input type="text" name="subHierarchyMasterList[0].subNodeName" id="txtNode" style="width:200px;" value=""  class="txtNode" maxlength="50" onKeyUp="return blockspecialchar_first(this);" /> <span class="mandatory">*</span>
								</div>
								<label class="control-label col-sm-1">Alias</label>
								<div class="col-sm-4">
								<span class="colon">:</span>
									<input type="text" name="subHierarchyMasterList[0].subNodeAlias" id="txtAlias" style="width:200px;"  value="" class="txtAlias" maxlength="50" onKeyUp="return blockspecialchar_first(this);" />
								</div>
							</div>
							</c:forEach>
							</c:if>
						</div>
					</div>
				</c:if>	
				<div class="row">
					<input name="btnSubmit" type="submit" class="btn btn-success" id="btnSubmit" value="Update" onclick="return validator();"/>
				</div>
				</div>
				 </form:form>
                </div>
				<div class="clearfix"></div>
                </div>
                </div>
                
               
                
                </div>
              




