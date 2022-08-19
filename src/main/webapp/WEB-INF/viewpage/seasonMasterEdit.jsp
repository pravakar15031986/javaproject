<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form" %> 
     <c:if test="${msg ne Empty}">
	<script>
	$(document).ready(function(){  
	 });
	swal("Success", "<c:out value='${msg}'/> ", "success"); 
</script>
</c:if>
      <c:if test="${msg_1 ne Empty}">
	<script>
	$(document).ready(function(){  
	swal("${msg_1}"," ", "error"); 
	 });
</script>
</c:if>  
<div class="mainpanel">
<form action="seasonMasterView" method="get" id="cancelForm"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

</form>
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Edit Season</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                           <li class="breadcrumb-item">Manage Master</li>
                           <li class="breadcrumb-item active" aria-current="page">Season Master</li>
                          
                        </ol>
                     </nav>
                  </div>
               
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link active"  href="#">Edit</a>
                              <a class="nav-item nav-link "  href="seasonMasterView" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              <a  title="" href="javascript:void(0)" id="backIcon" data-toggle="tooltip" data-placement="top" data-original-title="Back" onclick="cancel()"><i class="icon-arrow-left1"></i></a>
                              <p class="ml-2" style="color: red">(*) Indicates mandatory </p>
                           </div>
                        </div>
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                        <div class="card-body">
                           <!--Static-->
                           
                            <div class="width50">
                           
                           <form action="save-season-master" id="seasonFormId" onsubmit="return false" method="post"><input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           
                           <input type="hidden" name="seasonIdBean" value="${season.seasonIdBean}">
                          
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Season Name<span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <input type="text" name="seasonName" id="season-text-input" maxlength="50" value="${season.seasonName}" class="form-control" placeholder="" tabindex="1"  />
                              </div>
                           </div>
                          
                         <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Month <span class="text-danger">*</span></label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                          <div class="dropdown-container" tabindex="2" id="monthDivId">
						    <div class="dropdown-button noselect">
						        <div class="dropdown-label"></div>
						        <div class="dropdown-quantity"><span class="quantity"></span></div>
						        <i class="fa fa-caret-down pull-right"></i>
						    </div>
						    <div class="dropdown-list" style="display: none;">
						        <input type="search" placeholder="Search Month" class="dropdown-search"/>
												<ul>
													
													<c:forEach items="${monthList}" var="month">
														<c:set var="chval">0</c:set>
														<c:forEach items="${seasonMonthId}" var="sMonth"> 
													 	 <c:if test="${sMonth eq month.monthId}">
														    	<c:set var="chval">1</c:set>
														    </c:if> 
														 </c:forEach>
														
														 <li>
							        <div class="checkbox">
	                                    <input type="checkbox" id="check_month_${month.monthId}" <c:if test="${chval eq 1 }" >checked</c:if> value="${month.monthId}"  class="magic-checkbox" name="monthId" />
	                                    <label for="check_month_${month.monthId}"></label> 
	                                 </div>
	                                  <label for="check_month_${month.monthId}" id="check_month_val_${month.monthId}"> ${month.monthName}</label>
	                              </li>
	                              </c:forEach>
	                              

												</ul>
											</div>
						</div>
						</div>
						</div>
                        <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-textarea-input">Description</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                 <textarea  name="desc"  id="descriptionID" rows="4" class="form-control"  maxlength="200" onkeyup="countChar(this)" tabindex="3">${season.desc}</textarea><div id="charNum">Maximum 200 characters</div>
                              </div>
                        </div>
                      <div class="form-group row pad-ver">
                              <label class="col-12 col-md-4 col-xl-4 control-label">Status</label>
                              <div class="col-12 col-md-8 col-xl-8">
                              <span class="colon">:</span>
                                 <div class="radio">
                                    <input type="radio" name="status" id="demo-form-radio" value="0" <c:if test="${(empty season.status) or (season.status=='false')}">checked="checked"</c:if> class="magic-radio sampleyes"  name="form-radio-button" />
                                    <label for="demo-form-radio" tabindex="4">Active</label>
                             
                                    <input type="radio" name="status" id="demo-form-radio-2" value="1" <c:if test="${season.status=='true'}">checked="checked"</c:if> class="magic-radio sampleno"  name="form-radio-button" />
                                    <label for="demo-form-radio-2" tabindex="5">Inactive</label>
                                 </div>
                              </div>
                           </div>
     				  <div class="form-group row">
							  <label class="col-12 col-md-4 col-xl-4 control-label"></label>
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-primary mb-1" id="btnUpdateId" onclick="return saveSeason();" tabindex="6">Update</button>
								 <button class="btn btn-danger mb-1" id="btnCancelId" onclick="cancel()" tabindex="7">Cancel</button>
							  </div>
					      </div>
                         </form>
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
    	  $("#monthId").chosen({ allow_single_deselect: true });
          $(".chzn-select-deselect").chosen({ allow_single_deselect: true });  
    	  /* 	$('#monthId').multiselect({
  	      columns: 1,
  	      placeholder: 'Select Month ',
  	      search: true
  	      }); */
      });
      
      </script>        
<script>
function saveSeason()
{
	 event.preventDefault();
	 var form = event.target.form;
	 var seasonName=$("#season-text-input").val();
	 var name_regex = /^[a-zA-Z ]{1,60}$/;
		var desc_regex = /^([a-zA-Z0-9 (:)#;/,.-]){0,200}$/;
		/* var shortName=$('#Short-text-input').val();
		var name=$("#Name-text-input1").val(); */
		var desc=$("#descriptionID").val();
		var descLen=desc.length;
		var nameLen=seasonName.length;
		/* var aliasLen=shortName.length; */
		  
 	 if(seasonName=='')
	{
 		swal(
				'Error',
				'Please enter the Season Name',
				'error'
				).then(function() 
		   		   		{
					$("#season-text-input").focus();
				});
		
		return false;
	}
 	if(seasonName.charAt(0)== ' ' || seasonName.charAt(nameLen-1)== ' '){
 		swal("Error", "White space is not allowed at initial and last place in Season Name", "error").then(function() 
   		   		{
			$("#season-text-input").focus();
		});
         return false;
	   }
	   if(seasonName!=null)
    	{
	   		var count= 0;
	   		var i;
	   		for(i=0;i<nameLen && i+1 < nameLen;i++)
	   		{
	   			if ((seasonName.charAt(i) == ' ') && (seasonName.charAt(i + 1) == ' ')) 
	   			{
					count++;
				}
	   		}
	   		if (count > 0) {
	   			swal("Error", "Season Name should not contain consecutive blank spaces", "error").then(function() 
		   		   		{
					$("#season-text-input").focus();
				});
				return false;
			}
    	}
	 	if(!seasonName.match(name_regex))
	 	{
	 		swal("Error", "Season Name accept only alphabets  ", "error").then(function() 
	   		   		{
				$("#season-text-input").focus();
			});
			return false;
	 	}
 	
 	var checked = $("input[type=checkbox]:checked").length;
	if(checked== '0')
	{
		swal(
				'Error',
				'Please select at least one Month ',
				'error'
				).then(function() 
		   		   		{
					$("#monthDivId").focus();
				});
   		return false;
	}
	if(desc.charAt(0)== ' ' || desc.charAt(descLen-1)== ' '){
		 swal("Error", "White space is not allowed at initial and last place in Description", "error").then(function() 
	   		   		{
				$("#descriptionID").focus();
			});
         return false;
	   }if(!desc.match(desc_regex))
    	{
		   swal("Error", "Description accept only alphabets,numbers and (:)#;/,.-\\ characters", "error").then(function() 
	   		   		{
				$("#descriptionID").focus();
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
					$("#descriptionID").focus();
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
				$("#descriptionID").focus();
			});
			return false;
		}
 	 
	swal({
 		title: 'Do you want to update?',
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
function cancel()
{
	$("#cancelForm").submit();	
}
</script>   
    <script>
$(document).ready(function(){
	 //$('#alertId').hide();
	 var text_max = 200;
	 $('#charNum').html('Maximum characters :' + text_max);

	 $('#descriptionID').keyup(function() {
	     var text_length = $('#descriptionID').val().length;
	     var text_remaining = text_max - text_length;

	     $('#charNum').html('Maximum characters :' + text_remaining);
	 });
	   
	/* $('[data-toggle="tooltip"]').tooltip(); 
	setTimeout(function() {$("#messageId").hide(); }, 3000); */
	
});
</script>        
  <script>
	   $(document).ready(function(){
	   	if('${errMsg}' != '')
	   	{
			//alert('${ErrorMessage}');
			swal("Error", "${errMsg}", "error");
			document.getElementById('${FieldId}').value="";
			document.getElementById('${FieldId}').focus();
	   	}	
	   });
</script>     
  <script>
$(document).ready(function(){



/*
	Dropdown with Multiple checkbox select with jQuery - May 27, 2013
	(c) 2013 @ElmahdiMahmoud
	license: https://www.opensource.org/licenses/mit-license.php
*/

$(".dropdown dt a").on('click', function() {
  $(".dropdown dd ul").slideToggle('fast');
});

$(".dropdown dd ul li a").on('click', function() {
  $(".dropdown dd ul").hide();
});

function getSelectedValue(id) {
  return $("#" + id).find("dt a span.value").html();
}

$(document).bind('click', function(e) {
  var $clicked = $(e.target);
  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
});

$('.mutliSelect input[type="checkbox"]').on('click', function() {

  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
    title = $(this).val() + ",";

  if ($(this).is(':checked')) {
    var html = '<span title="' + title + '">' + title + '</span>';
    $('.multiSel').append(html);
    $(".hida").hide();
  } else {
    $('span[title="' + title + '"]').remove();
    var ret = $(".hida");
    $('.dropdown dt a').append(ret);
  }
});
});
</script>
<script>
$(document).ready(function(){

	
	// Events
	$('.dropdown-container')
		.on('click', '.dropdown-button', function() {
	        $(this).siblings('.dropdown-list').toggle();
		})
		.on('input', '.dropdown-search', function() {
	    	var target = $(this);
	        var dropdownList = target.closest('.dropdown-list');
	    	var search = target.val().toLowerCase();
	    
	    	if (!search) {
	            dropdownList.find('li').show();
	            return false;
	        }
	    
	    	dropdownList.find('li').each(function() {
	        	var text = $(this).text().toLowerCase();
	            var match = text.indexOf(search) > -1;
	            $(this).toggle(match);
	        });
		})
		.on('change', '[type="checkbox"]', function() {
	       /*  var container = $(this).closest('.dropdown-container');
	        var numChecked = container. find('[type="checkbox"]:checked').length;
	    	container.find('.quantity').text(numChecked || 'Any'); */

			 var attrId = $(this).attr("id");
		        var container = $(this).closest('.dropdown-container');
				 
		        var numChecked = container. find('[type="checkbox"]:checked').not(".nocheck").length;
			        if(numChecked > 4)
		        	{
		    			container.find('.quantity').text(numChecked || 'Any');
		        	}
		        else
		        	{
		        	var obj = container. find('[type="checkbox"]:checked').not(".nocheck");
		        	 
		        	var obj1 = obj[0];
		        	var text1 = $(obj1).attr("id");
		        	var val1 = (obj1 != null && obj1 != undefined && text1.split('_')[2] != null && text1.split('_')[2] != undefined) ? text1.split('_')[2]:"";
		        	
		        	var obj2 = obj[1];
		        	var text2 = $(obj2).attr("id");
		        	var val2 = ( obj2 != null && obj2 != undefined && text2.split('_')[2] != null && text2.split('_')[2] != undefined ) ? text2.split('_')[2] : "";
		        	
		        	var obj3 = obj[2];
		        	var text3 = $(obj3).attr("id");
		        	var val3 = ( obj3 != null && obj3 != undefined && text3.split('_')[2] != null && text3.split('_')[2] != undefined  ) ? text3.split('_')[2] :"" ;
		        	
		        	var obj4 = obj[3];
		        	var text4 = $(obj4).attr("id");
		        	var val4 = (obj4 != null && obj4 != undefined &&  text4.split('_')[2] != null &&  text4.split('_')[2] != undefined ) ?  text4.split('_')[2] : "";
		        	
		        	if(attrId.includes("month") && numChecked == 0 )
			        {
		        		container.find('.quantity').text('');
			        }
		        	if(attrId.includes("month"))
		        		{
		        		var valu = "";
		        		if(val1 != undefined && val1 != null  && val1.trim() != '')
	        			{
		        		valu += " , "+$("#check_month_val_"+val1).html();
		        		
	        			}
		        		if(val2 != undefined && val2 != null  && val2.trim() != '')
	        			{
		        		valu +=  " , "+$("#check_month_val_"+val2).html();
	        			}
		        		if(val3 != undefined && val3 != null  && val3.trim() != '')
	        			{
		        		valu +=  " , "+$("#check_month_val_"+val3).html();
	        			}
		        		if(val4 != undefined && val4 != null  && val4.trim() != '')
	        			{
		        		valu +=  " , "+$("#check_month_val_"+val4).html();
	        			}
		        		container.find('.quantity').text("");
		        		container.find('.quantity').text(valu.substring(2,valu.length));
		        		}

		        	}



	    	
		});

	// JSON of States for demo purposes
	var usStates = [
	    { name: 'ALABAMA', abbreviation: 'AL'},
	    { name: 'ALASKA', abbreviation: 'AK'},
	    { name: 'AMERICAN SAMOA', abbreviation: 'AS'},
	    { name: 'ARIZONA', abbreviation: 'AZ'},
	    { name: 'ARKANSAS', abbreviation: 'AR'},
	    { name: 'CALIFORNIA', abbreviation: 'CA'},
	    { name: 'COLORADO', abbreviation: 'CO'},
	    { name: 'CONNECTICUT', abbreviation: 'CT'}
	];

	// <li> template
	<%-- var stateTemplate = _.template(
	    '<li>' +
	    	'<input name="<%= abbreviation %>" type="checkbox">' +
	    	'<label for="<%= abbreviation %>"><%= capName %></label>' +
	    '</li>'
	); --%>

	// Populate list with states
	_.each(usStates, function(s) {
	    s.capName = _.startCase(s.name.toLowerCase());
	    $('ul').append(stateTemplate(s));
	});
	

});


</script>    
   </body>
</html>



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
	 
	/*  $("#btnUpdateId").click(function(){
		 
		 if(confirm("Do you want to Update?")){
			window.location.href="confirmSurveyData.html";
		 }else{
		   return false;
		}
	});
	  */
 
  
});
</script>


<script>
var rustDetails = [];
function addRow(tableID) {
	
	var v1=$('#rustTypeId').val();
	var vt1=$("#rustTypeId :selected").text();
	if(v1=='Select'){
		alert("Rust type should be selected");
		$("#rustTypeId").focus();
		return false;	
	}
	var v2=$('#incidentId').val();
    if(v2==''){
    	alert("Incident Percentage should not left blank");
		$("#incidentId").focus();
		return false;	
    }
    var v3=$('#severityId').val();
    if(v3==''){
    	//swal("Variety Should be Selected");
    	alert("Severity Percentage should not left blank");
		$("#severityId").focus();
		return false;	
    }
    
    var v4=$('#reactionId').val();
	var vt4=$("#reactionId :selected").text();
	if(v4=='Select'){
		alert("Reaction should be selected");
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
         