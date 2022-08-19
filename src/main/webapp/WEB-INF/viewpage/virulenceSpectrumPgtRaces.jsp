<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.ldot {
  height: 15px;
  width: 15px;
  background-color:  #F20056;
  border-radius: 50%;
  display: inline-block;
}
.hdot {a
  height: 15px;
  width: 15px;
  background-color: green;
  border-radius: 50%;
  display: inline-block;
}
.xdot {
  height: 15px;
  width: 15px;
  background-color: blue;
  border-radius: 50%;
  display: inline-block;
  
}
.idot {
  height: 15px;
  width: 15px;
  background-color: blue;
  border-radius: 50%;
  display: inline-block;
  
}
</style>
  <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  
                  <div class="title-details">
                     <h4>Virulence Spectrum Identified</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">MIS Report</li>
                           <li class="breadcrumb-item active" aria-current="page">Race by Virulence</li>
                        </ol>
                     </nav>
                  </div>
       
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              
                              <a class="nav-item nav-link active"  href="virulence-SpectrumPgtRaces" >View</a>
                           </ul>
                           <div class="indicatorslist">
                           
                               <a  id="printicon" onclick="printDiv()" class="btn btn-outline-success btn-sm shadow-none" href="javascript:void(0)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Print"><i class="icon-printer1"></i></a> 
                         
                           
                           </div> 
                        </div>
                        <!-- Search Panel -->
                        <div class="search-container">
                        
                           <div class="search-sec" style="display:block;">
                        
                        
                           <form action="rustWiseVirulenceSpectrum" method="POST">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>

                           
                           <div class="form-group">
                            <div class="row">
                              <label class="col-lg-2">Rust Type</label>
                                   <span class="text-danger">*</span>
                              <div class="col-lg-2">
                                 <span class="colon">:</span>
                                 
                                 <div class="input-group">
                                  <select name="RustType" id="RustType" class="form-control" >
                                   <c:forEach items="${Rusttypes}" var="dtls" varStatus="theCount">
                                   <option value="${dtls.intRustTypeId }">${dtls.vchRustType }</option>
                                   </c:forEach>
                                  </select>
                                 </div>
                              </div>
                              
                              <div class="col-lg-3">
                                       <button class="btn btn-primary" type="submit"> <i class="fa fa-search"></i> Search</button>
                                    </div> 
                           </div>
                           </div>
                             </form>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div> 
                        </div> 
                        <!-- Search Panel -->
                        <!--===================================================-->
                        <div class="card-body mrgn25" id="printdiv">
                        
                        
                     
                      
                      
                      
                     
                      
                       <div class="clearfix"></div>
                      
                           <div class="table-responsive">


							<table  class="table table-bordered"
								id="viewtable">
								
							</table>



						</div>
                           
                           
                        </div>
                        <!--===================================================-->
                     </div>
                  </div>
               </div>
            </div>
         </div>
      
      <script>
      function searchDate(){
  		
  		
  	}
      </script>
         
<script>
	$(function(){

		   $(".selectall").click(function(){
			$(".individual").prop("checked",$(this).prop("checked"));
			});
		
		
	});
</script>


<script>
$(document).ready(function(){
	

	// Alert Modal Type
	$(document).on('click', '#success', function(e) {
		swal(
			'Success',
			'You clicked the <b style="color:green;">Success</b> button!',
			'success'
		)
	});

	$(document).on('click', '#error', function(e) {
		swal(
			'Error!',
			'You clicked the <b style="color:red;">error</b> button!',
			'error'
		)
	});

	$(document).on('click', '#warning', function(e) {
		swal(
			'Warning!',
			'You clicked the <b style="color:coral;">warning</b> button!',
			'warning'
		)
	});

	$(document).on('click', '#info', function(e) {
		swal(
			'Info!',
			'You clicked the <b style="color:cornflowerblue;">info</b> button!',
			'info'
		)
	});

	$(document).on('click', '#question', function(e) {
		swal(
			'Question!',
			'You clicked the <b style="color:grey;">question</b> button!',
			'question'
		)
	});

// Alert With Custom Icon and Background Image
	$(document).on('click', '#icon', function(event) {
		swal({
			title: 'Custom icon!',
			text: 'Alert with a custom image.',
			imageUrl: 'https://image.shutterstock.com/z/stock-vector--exclamation-mark-exclamation-mark-hazard-warning-symbol-flat-design-style-vector-eps-444778462.jpg',
			imageWidth: 200,
			imageHeight: 200,
			imageAlt: 'Custom image',
			animation: false
		})
	});

	$(document).on('click', '#image', function(event) {
		swal({
			title: 'Custom background image, width and padding.',
			width: 700,
			padding: 150,
			background: '#fff url(https://image.shutterstock.com/z/stock-vector--exclamation-mark-exclamation-mark-hazard-warning-symbol-flat-design-style-vector-eps-444778462.jpg)'
		})
	});

// Alert With Input Type
	$(document).on('click', '#subscribe', function(e) {
		swal({
		  title: 'Submit email to subscribe',
		  input: 'email',
		  inputPlaceholder: 'Example@email.xxx',
		  showCancelButton: true,
		  confirmButtonText: 'Submit',
		  showLoaderOnConfirm: true,
		  preConfirm: (email) => {
		    return new Promise((resolve) => {
		      setTimeout(() => {
		        if (email === 'example@email.com') {
		          swal.showValidationError(
		            'This email is already taken.'
		          )
		        }
		        resolve()
		      }, 2000)
		    })
		  },
		  allowOutsideClick: false
		}).then((result) => {
		  if (result.value) {
		    swal({
		      type: 'success',
		      title: 'Thank you for subscribe!',
		      html: 'Submitted email: ' + result.value
		    })
		  }
		})
	});

	// Alert Redirect to Another Link
	$(document).on('click', '#btnSubmitId', function(e) {
	    swal({
			title: "Do you want to Submit ?", 
			//text: "You will be redirected to https://utopian.io", 
			type: "warning",
			confirmButtonText: "Yes",
			showCancelButton: true,
			cancelButtonText: "No",
	    })
	    	.then((result) => {
				if (result.value) {
					swal(
						      'Success',
						      'Data submited successfully',
						      'success'
						    )
					window.location = 'confirmSurveyData';
				} /* else if (result.dismiss === 'cancel') {
				    swal(
				      'Cancelled',
				      'Your stay here :)',
				      'error'
				    )
				} */
			})
	});
	
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
	        var container = $(this).closest('.dropdown-container');
	        var numChecked = container. find('[type="checkbox"]:checked').length;
	    	container.find('.quantity').text(numChecked || 'Any');
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
	var stateTemplate = _.template(
	    '<li>' +
	    	<%-- '<input name="<%= abbreviation %>" type="checkbox">' + --%>
	    	<%-- '<label for="<%= abbreviation %>"><%= capName %></label>' + --%>
	    '</li>'
	);

	// Populate list with states
	_.each(usStates, function(s) {
	    s.capName = _.startCase(s.name.toLowerCase());
	    $('ul').append(stateTemplate(s));
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
	 $("#dataTable4").hide();
	 
	 
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
	 
	/*  $("#btnSubmitId").click(function(){
		 
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




//##############################################################


var otherDisease = [];
function addRow4(tableID) {
	
	var v1=$('#diseaseTypeId').val();
	var vt1=$("#diseaseTypeId :selected").text();
	if(v1=='Select'){
		alert("Disease should be selected");
		$("#diseaseTypeId").focus();
		return false;	
	}
	
    
    
    
    var v2=$('#othIncidentId').val();
	if(v2==''){
		/* alert("Remarks should not left blank");
		$("#sampleRemarks").focus();
		return false; */	
	}
	
	var v3=$('#othSeverityId').val();
	if(v3==''){
		/* alert("Remarks should not left blank");
		$("#sampleRemarks").focus();
		return false; */	
	}
   
	
    
    for(var i = 0; i < otherDisease.length; i++) {
        var cur = otherDisease[i];
        if(cur.diseaseTypeId == v1 ) {
        	alert('Already added '+vt1+' disease type !!');
    		return false;
        }
 	}
    
    var v4='<a href="javascript:void(0);" onclick="clearRow4(this,\'' + v1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable4").show();
   
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
	
   
    otherDisease.push({ 
	        "diseaseTypeId" : v1,
	        "othIncidentVal" : v2,
	        "othSeverityVal" : v3
    }); 
    
    clearData4();
	       
	       
}

function clearData4(){
	$('#diseaseTypeId').val('Select');
	$('#othIncidentId').val('');
	$('#othSeverityId').val('');
	
	
	
	
}

function clearRow4(currElement,diseaseTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < otherDisease.length; i++) {
	        var cur = otherDisease[i];
	        if(cur.diseaseTypeId == diseaseTypeId ) {
	        	otherDisease.splice(i, 1);
	          break;
	        }
	 }
	 
	 document.getElementById("dataTable4").deleteRow(parentRowIndex);
		// updateIndex1();
	 count=$('table#dataTable4 tr').length;
	 if(count==1){
	   	$("#dataTable4").hide();
	 }
	 
}

function updateIndex4() 
{	//
    $("#dataTable4 tr").each(function(){
    //	alert('hii'+$(this).index() + 1);
      $( this ).find( "td" ).first().html($(this).index() + 1 );
    });
}


</script>

<script>

/* <tr>
<th rowspan="2">Sl. No</th>
<th rowspan="2">Race Name</th>
<th colspan="9" class="text-center">Wheat Lines</th>
</tr>
<tr>

</tr>
 */
  
var json = '${ViewDetails}';
json = atob(json);
json = JSON.parse(json);

 var htm_ = '<tr>'+
	'<th rowspan="2">Sl#</th>'+
	'<th rowspan="2">Race Name</th>';
	
	if(json.length > 0)
		{
		var fWheatlines = json[0].wheatlines;
		fWheatlines = JSON.parse(fWheatlines);
		console.log(fWheatlines);
		htm_ += '<th colspan="'+fWheatlines.length+'" class="text-center"  >Wheat Lines</th></tr><tr>';
		for(i=0;i<fWheatlines.length;i++)
			{
			htm_ += '<th nowrap>&nbsp;&nbsp;&nbsp;'+fWheatlines[i].diffline+'&nbsp;&nbsp;&nbsp;</th>';
			}
		htm_ += '</tr>';
		}
 
 // plot the details in the next respective row
 
for(i=0;i<json.length;i++)
	{
	
	var jsonO = json[i];
	var raceName = jsonO.raceresult;
	htm_ += '<tr>';
	htm_ += '<td>'+(i+1)+'</td>';
	htm_ += '<td>'+raceName+'</td>';
	var fWheatlines = json[i].wheatlines;
	fWheatlines = JSON.parse(fWheatlines);
	for(j=0;j<fWheatlines.length;j++)
	{
 
	if(fWheatlines[j].hlval.trim().toLowerCase() == 'l')
	{		
		htm_ += '<td><span  align="center" style="height: 15px;width: 15px;background-color: #ff0000;border-radius: 50%;display: inline-block;"></span> </td>';
	}		
	if(fWheatlines[j].hlval.trim().toLowerCase() == 'h')
	{		
		htm_ += '<td><span  align="center" style="height: 15px;width: 15px;background-color:  green;border-radius: 50%;display: inline-block;"></span> </td>';
	}		
	if(fWheatlines[j].hlval.trim().toLowerCase() == 'x')
	{		
		htm_ += '<td><span  align="center" style="height: 15px;width: 15px;background-color:  #ffad34;border-radius: 50%;display: inline-block;"></span> </td>';
		
	}		
	if(fWheatlines[j].hlval.trim().toLowerCase() == 'i')
	{		
		htm_ += '<td><span  align="center" style="height: 15px;width: 15px;background-color:  #ffad34;border-radius: 50%;display: inline-block;"></span> </td>';
		$("#other_").html(" = Intermediate");
	}		
	 	
//	htm_ += '<td><span  align="center" class="'+fWheatlines[j].hlval.trim().toLowerCase()+'dot"></span> </td>';
		
	}
	
	htm_ += '</tr>';
	
	}
 
  
 $("#viewtable").html(htm_);
 
 var SelectedRust = '${SelectedRust}';
 $("#RustType").val(SelectedRust);
</script>
<script>
 function printDiv() { 
            var divContents = document.getElementById("printdiv").innerHTML; 
            var a = window.open('', '', 'height=500, width=500'); 
            a.document.write('<html>'); 
            a.document.write('<body > <h1>Virulence Spectrum Of The Pgt Races Identified <img align="right" src="wrsis/images/logo.png"> <br>'); // path should change 
            a.document.write(divContents); 
            a.document.write('</body></html>'); 
            a.document.close(); 
            a.print(); 
        } 
        
</script>