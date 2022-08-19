<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 

<c:if test="${msg ne Empty}">

	<script>

	$(document).ready(function(){  
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
	 });
</script>
</c:if>
      <c:if test="${errMsg ne Empty}">
	<script>
	$(document).ready(function(){   
	swal("${errMsg}"," ", "error"); 
	});
</script>
</c:if>  
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Add Race Identification Chart</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                         <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Race Identification Chart</li>
                          
                        </ol>
                     </nav>
                  </div>
             
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="raceIdentificationChart">Add</a>
                              <a class="nav-item nav-link "  href="raceIdentificationChartView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              
                              
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           
                            <div class="width50">
                           
                           <form:form action="insert-race-chart" modelAttribute="race" id="raceIdentificationformId" method="post"  onsubmit="return false">
                         <input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
                           
                          <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Sequence -1<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" path="fisrtSeq" id="seqId_1" tabindex="1" autofocus="autofocus">
                                   <form:option value="0">--H vs L--</form:option>
                                    <form:option value="h">High</form:option>
                                    <form:option value="l">Low</form:option>
                                   
                                    </form:select>
                                    </div>
                            	
                            </div>
                            <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Sequence -2<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" path="secondSeq" id="seqId_2" tabindex="2">
                                    <form:option value="0">--H vs L--</form:option>
                                    <form:option value="h">High</form:option>
                                    <form:option value="l">Low</form:option>
                                   
                                    </form:select>
                                    </div>
                            	
                            </div>
                            <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Sequence -3<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" path="thirdSeq" id="seqId_3" tabindex="3">
                                   <form:option value="0">--H vs L--</form:option>
                                    <form:option value="h">High</form:option>
                                    <form:option value="l">Low</form:option>
                                   
                                    </form:select>
                                    </div>
                            	
                            </div>
                            <div class="form-group row">
                                 
                                    <label class="col-12 col-md-4 col-xl-4 control-label">Sequence -4<span class="text-danger">*</span></label>
                                    <div class="col-12 col-md-8 col-xl-8">
                                     <span class="colon">:</span>
                                       <form:select class="form-control" path="fourthSeq" id="seqId_4" tabindex="4">
                                   <form:option value="0">--H vs L--</form:option>
                                    <form:option value="h">High</form:option>
                                    <form:option value="l">Low</form:option>
                                   
                                    </form:select>
                                    </div>
                            	
                            </div>	
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <form:input id="nameId" path="nameResult" class="form-control" placeholder="" value="" tabindex="5" maxlength="1" />
                              </div>
                           </div>
                         
                          <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Description</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <form:textarea rows="5" cols="100" path="description" class="form-control" id="descriptionID" tabindex="6" maxlength="200" /><div id="charNum">Maximum 200 characters</div>
                              </div>
                           </div>  
                       <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                  <div class="radio">
                                    <%-- <form:radiobutton id="demo-form-radio" class="magic-radio sampleyes" value="0" path="status" name="form-radio-button" checked/> --%>
                                    <form:radiobutton id="demo-form-radio" path="status" class="magic-radio sampleyes" value="0" checked="checked" name="form-radio-button"/>
                                    <label for="demo-form-radio" tabindex="7">Active</label>
                             
                                    <form:radiobutton path="status" id="demo-form-radio-2" class="magic-radio sampleyes" value="1" name="form-radio-button"/>
                                    <label for="demo-form-radio-2" tabindex="8">Inactive</label>
                                 </div> 
                              </div>
                           </div>
                           
                           
						  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" onclick="return save();" id="btnSubmitId" tabindex="9">Submit</button>
								 <button class="btn btn-danger mb-1" type="reset" id="btnResetId" tabindex="10">Reset</button>
							  </div>
					      </div>
                         </form:form>
                        </div>  
             
                          <div class="clearfix"></div>
                           
                           <br> <br> <br> <br> <br> <br>
                          
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script type="text/javascript">
      $(document).ready(function(){
    	  $("#mandeteId").chosen({ allow_single_deselect: true });
          $(".chzn-select-deselect").chosen({ allow_single_deselect: true });  
    	  /* 	$('#monthId').multiselect({
  	      columns: 1,
  	      placeholder: 'Select Month ',
  	      search: true
  	      }); */
      });
      function save()
      {
    	  
    	  event.preventDefault(); 
    	  var form = event.target.form; 
    	  var seqId_1=$("#seqId_1").val();
    	  var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
 		  var desc=$("#descriptionID").val();
 		
	   	 if(seqId_1=='0')
    	{
	   		 swal(
	 	   				'Error', 
	 	   				'Please select sequence one',
	 	   				'error'
	 	   			).then(function() 
			   		   		{
						$("#seqId_1").focus();
					});
    		
    		return false;
    	}
	   
	   	 var seqId_2=$("#seqId_2").val();
	   	 if(seqId_2=='0')
	   	{
	   		 swal(
	 	   				'Error', 
	 	   				'Please select sequence two',
	 	   				'error'
	 	   			).then(function() 
			   		   		{
						$("#seqId_2").focus();
					});
	   	 
	   		return false;
	   	 }
	   	var seqId_3=$("#seqId_3").val();
	   	 if(seqId_3=='0')
	   	{
	   		 
	   		 swal(
	 	   				'Error', 
	 	   				'Please select sequence three',
	 	   				'error'
	 	   			).then(function() 
			   		   		{
						$("#seqId_3").focus();
					});
	   		return false;
	   	 }
	   	var seqId_4=$("#seqId_4").val();
	   	 if(seqId_4=='0')
		   	{
	   		
	   		  swal(
	 	   				'Error', 
	 	   				'Please select sequence four',
	 	   				'error'
	 	   			).then(function() 
			   		   		{
						$("#seqId_4").focus();
					});
		   		return false;
		   	 }
	   	var nameId=$("#nameId").val();
	   	//alert(nameId);
	   	var name_regex = /^[a-zA-Z ]{1,1}$/;
	   	 if(nameId=='')
	   	{
	   		 swal(
	 	   				'Error', 
	 	   				'Please enter the Name',
	 	   				'error'
	 	   			).then(function() 
			   		   		{
	 	   			$('#nameId').focus();
					});
	 	   			
	   	
	   		return false;
	   	 }
	   	 if(!nameId.match(name_regex))
	   	 {
	   		swal("Error", "Name accept only alphabets ", "error").then(function() 
	   		   		{
 	   			$('#nameId').focus();
				});
   			return false; 
	   	 }
	   	if(nameId.charAt(0)== ' ' || nameId.charAt(nameId.length -1)== ' '){
 		   swal("Error", "White space is not allowed at initial and last place in Name", "error").then(function() 
	   		   		{
	   			$('#nameId').focus();
				});
          return false;
 	   }
 	   if(nameId!=null)
     	{
 	   		var count= 0;
 	   		var i;
 	   		for(i=0;i<nameId.length && i+1 < nameId.length;i++)
 	   		{
 	   			if ((nameId.charAt(i) == ' ') && (nameId.charAt(i + 1) == ' ')) 
 	   			{
 					count++;
 				}
 	   		}
 	   		if (count > 0) {
 	   			swal("Error", "Name should not contain consecutive blank spaces", "error").then(function() 
			   		   		{
	 	   			$('#nameId').focus();
					});
 				return false;
 			}
     	}
	   	if(desc.charAt(0)== ' ' || desc.charAt(desc.length-1)== ' '){
			   swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() 
		   		   		{
	 	   			$('#descriptionID').focus();
					});
	         return false;
		   }
     	if(!desc.match(desc_regex))
	    	{
	    		swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() 
			   		   		{
	 	   			$('#descriptionID').focus();
					});
				return false;
	    	}
		   	if(desc!=null)
	    	{
		   		var count= 0;
		   		var i;
		   		for(i=0;i<desc.length && i+1 < desc.length;i++)
		   		{
		   			if ((desc.charAt(i) == ' ') && (desc.charAt(i + 1) == ' ')) 
		   			{
						count++;
					}
		   		}
		   		if (count > 0) {
		   			swal("Error", "Description should not contain consecutive blank spaces", "error").then(function() 
			   		   		{
		 	   			$('#descriptionID').focus();
						});
					return false;
				}
	    	}
		   	var descLen=desc.length;
		   	if (desc.charAt(0) == '!' || desc.charAt(0) == '@' 
				|| desc.charAt(0) == '#' || desc.charAt(0) == '$' 
				|| desc.charAt(0) == '&' || desc.charAt(0) == '*' 
				|| desc.charAt(0) == '(' || desc.charAt(0) == ')' 
				|| desc.charAt(descLen - 1) == '!' || desc.charAt(descLen - 1) == '@' 
				|| desc.charAt(descLen - 1) == '#' || desc.charAt(descLen - 1) == '$' 
				|| desc.charAt(descLen - 1) == '&' || desc.charAt(descLen - 1) == '*' 
				|| desc.charAt(descLen - 1) == '(' || desc.charAt(descLen - 1) == ')') 
		   	{
				swal("Error", "!@#$&*() characters are not allowed at initial and last place in Description", "error").then(function() 
			   		   		{
	 	   			$('#descriptionID').focus();
					});
				return false;
			}
	 	swal({
	   		title: 'Do you want to submit?',
   		  type: 'info',
   		  showCancelButton: true,
   		  confirmButtonText: 'Yes',
   		  cancelButtonText: 'No',
		    }).then((result) => {
					if (result.value) {
						
						 form.submit();
					}
				})
				return false;
	   
      }
      </script>
    <script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
	   		swal("${errMsg}"," ", "error"); 
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>
<script>
$(document).ready(function(){
	 var text_max = 200;
	 $('#btnResetId').click(function() {
		 $('#charNum').html('Maximum characters :' + '200');
	 });
	 
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#descriptionID').keyup(function() {
	     var text_length = $('#descriptionID').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
});
</script>  

<script>
$(document).ready(function(){
	
	 $("#rustDetailId").hide();
	 $("#dataTable").hide();
	 $("#sampleDetailId").hide();
	 $("#dataTable1").hide();
	 $("#hdnImgdiv").hide();
	 $("#fungicideDetailId").hide();
	 
	 
	 
	 $(".rustAffectyes").click(function(){
		  $("#rustDetailId").show();
	 });
		  
	 $(".rustAffectno").click(function(){
	    $("#rustDetailId").hide();
	 });
	
    $(".sampleno").click(function(){
  		 $("#sampleDetailId").hide();
    });
  
	  $(".sampleyes").click(function(){
	 
	  $("#sampleDetailId").show();
		  
	  });
  
  
 	  $(".fungino").click(function(){
	  	 $("#fungicideDetailId").hide();
	  });
	  
	  $(".fungiyes").click(function(){
	  	 $("#fungicideDetailId").show();
	  });
  
	  $(".imgno").click(function(){
		 $("#hdnImgdiv").hide();
	  });
		  
	 $(".imgyes").click(function(){
		 $("#hdnImgdiv").show();
	 });
	 
	 /* $("#btnSubmitId").click(function(){
		 
		 if(confirm("Do you want to Submit?")){
			window.location.href="confirmSurveyData.html";
		 }else{
		   return false;
		}
	}); */
	 
 
  
});
</script>


<script>
var rustDetails = [];
function addRow(tableID) {
	
	var v1=$('#rustTypeId').val();
	var vt1=$("#rustTypeId :selected").text();
	if(v1=='Select'){
		swal("Rust type should be selected");
		$("#rustTypeId").focus();
		return false;	
	}
	var v2=$('#incidentId').val();
    if(v2==''){
    	swal("Incident Percentage should not left blank");
		$("#incidentId").focus();
		return false;	
    }
    var v3=$('#severityId').val();
    if(v3==''){
    	//swal("Variety Should be Selected");
    	swal("Severity Percentage should not left blank");
		$("#severityId").focus();
		return false;	
    }
    
    var v4=$('#reactionId').val();
	var vt4=$("#reactionId :selected").text();
	if(v4=='Select'){
		swal("Reaction should be selected");
		$("#reactionId").focus();
		return false;	
	}
    
    //
    
    for(var i = 0; i < rustDetails.length; i++) {
        var cur = rustDetails[i];
        if(cur.rustTypeId == v1 ) {
        	alert('Already added '+vt1+' type !!');
    		return false;
        }
 	}
    
    var v5='<a href="javascript:void(0);" onclick="clearRow(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable").show();
   
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.innerHTML = rowCount;

    var cell2 = row.insertCell(1);
    cell2.innerHTML = vt1;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = v2;

    var cell4 = row.insertCell(3);
    cell4.innerHTML = v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = v4;
	
    var cell6 = row.insertCell(5);
    cell6.innerHTML = v5;
	
    rustDetails.push({ 
	        "rustTypeId" : v1,
	        "incidentId" : v2,
	        "severityId" : v3,
	        "reaction"   : v4
    }); 
    
    clearData();
	       
	       
}

function clearData(){
	$('#rustTypeId').val('Select');
	$('#incidentId').val('');
	$('#severityId').val('');
	$('#reactionId').val('Select');
	
	
	
}

function clearRow(currElement,rustTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < rustDetails.length; i++) {
	        var cur = rustDetails[i];
	        if(cur.rustTypeId == rustTypeId ) {
	        	rustDetails.splice(i, 1);
	          break;
	        }
	 }
	 
	 document.getElementById("dataTable").deleteRow(parentRowIndex);
		// updateIndex();
	 count=$('table#dataTable tr').length;
	 if(count==1){
	   	$("#dataTable").hide();
	 }
	 
}

function updateIndex() 
{	//
    $("#dataTable tr").each(function(){
    //	alert('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}



function createInputField(fieldCount){
	
	$("#hdnSampleIdEntry").html('');
	
	var html="";
	
	for(i=0;i<fieldCount;i++){
		var sampleId='sampleIdVal'+i;
		html+="<input type='text' class='form-control' id='"+sampleId+"' /><br>"
	}
	$("#hdnSampleIdEntry").html(html);
}



var sampleDetails = [];
function addRow1(tableID) {
	
	var v1=$('#sampleTypeId').val();
	var vt1=$("#sampleTypeId :selected").text();
	if(v1=='Select'){
		alert("Sample type should be selected");
		$("#sampleTypeId").focus();
		return false;	
	}
	var v2=$('#sampleCountId').val();
    if(v2==''){
    	alert("Sample count value should not left blank");
		$("#sampleCountId").focus();
		return false;	
    }
    
    var v3='';
    for(i=0;i<v2;i++){
		var idVal=$("#sampleIdVal"+i).val(); 
		//alert(idVal);
		if(idVal==''){
			alert("Sample ID value should not left blank");
			$("#sampleIdVal"+i).focus();
			return false;	
		}
		
		v3+=idVal+",";
	}
    
    var v4=$('#sampleRemarks').val();
	if(v4==''){
		alert("Remarks should not left blank");
		$("#sampleRemarks").focus();
		return false;	
	}
   
	
    
    for(var i = 0; i < sampleDetails.length; i++) {
        var cur = sampleDetails[i];
        if(cur.sampleTypeId == v1 ) {
        	alert('Already added '+vt1+' type !!');
    		return false;
        }
 	}
    
    var v5='<a href="javascript:void(0);" onclick="clearRow1(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable1").show();
   
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.innerHTML = rowCount;

    var cell2 = row.insertCell(1);
    cell2.innerHTML = vt1;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = v2;

    var cell4 = row.insertCell(3);
    cell4.innerHTML = v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = v4;
	
    var cell6 = row.insertCell(5);
    cell6.innerHTML = v5;
	
    rustDetails.push({ 
	        "sampleTypeId" : v1,
	        "sampleCountId" : v2,
	        "sampleIds" : v3,
	        "sampleRemarks"   : v4
    }); 
    
    clearData1();
	       
	       
}

function clearData1(){
	$('#sampleTypeId').val('Select');
	$('#sampleCountId').val('');
	$('#sampleRemarks').val('');
	$('#hdnSampleIdEntry').empty();
	
	
	
}

function clearRow1(currElement,sampleTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < sampleDetails.length; i++) {
	        var cur = sampleDetails[i];
	        if(cur.sampleTypeId == sampleTypeId ) {
	        	sampleDetails.splice(i, 1);
	          break;
	        }
	 }
	 
	 document.getElementById("dataTable1").deleteRow(parentRowIndex);
		// updateIndex1();
	 count=$('table#dataTable1 tr').length;
	 if(count==1){
	   	$("#dataTable1").hide();
	 }
	 
}

function updateIndex1() 
{	//
    $("#dataTable1 tr").each(function(){
    //	alert('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}


//#############################################################
function addImg(tableID){
	 var v1='<input type="file" class="form-control" />';
	 var v2='<a href="javascript:void(0);" onclick="removeImg(this);" class="btn btn-danger">Delete</a>';
	 
	 var table = document.getElementById(tableID);

     var rowCount = table.rows.length;
     var row = table.insertRow(rowCount);
 
     var cell1 = row.insertCell(0);
     cell1.innerHTML = v1;

     var cell2 = row.insertCell(1);
     cell2.innerHTML = v2;
}

function removeImg(currElement){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 document.getElementById("imgTable").deleteRow(parentRowIndex);
}
</script>
         