<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<style>
.fa-file-pdf-o {
	color: red;
}
</style>
<div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>Recommendation Survey Details</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="Home"><span class="icon-home1"></span></a></li>
                            <li class="breadcrumb-item">Monitor Implementation</li>
                           <li class="breadcrumb-item" aria-current="page">Publish Implementation Details</li>
                        </ol>
                     </nav>
                  </div>
                 
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                             <a class="nav-item nav-link active"  href="#" >View</a>
                           </ul>
                           <div class="indicatorslist">
                              <a  title="" href="javascript:void(0)" id="backIcon" onclick="history.back()" data-toggle="tooltip" data-placement="top" data-original-title="Back"><i class="icon-arrow-left1"></i></a>
                             
                           </div>
                        </div>
                       
                        
                        <!-- BASIC FORM ELEMENTS -->
                        <!--===================================================-->
                      
                        <div class="card-body">
                       
                           <!--Static-->
                           
                            
                            <div class="">
                          <h3>Monitor Implementation of Recommendations Details</h3>
                          <div class="width50">
                          
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Region</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="regionId"></span>
                                  <%-- <c:out value="${implementationdata.region }" /> --%>
                              </div>
                           </div>
                           
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Woreda</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                  <span id="woredaId"></span>
                              </div>
                           </div>
                          
                           <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">No of PAs affected </label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <span id="kebelId"></span>
                              </div>
                           </div>
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Type of Rust</label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <span id="rust"></span>
                              </div>
                           </div>
                        
                           
                              <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Incidences (%)</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                               <span id="incedences">:</span>
                              </div>
                           </div>
                           
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-readonly-input">Crop Growth Stage</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                <span id="gstage">:</span>
                              </div>
                           </div>
                         
                            
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Total Area Infected (ha) </label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                                <span id="infectedland">:</span>
                              </div>
                           </div> 
                           
                           
                           </div>
                           <div class="width50 mrgnl40">
                           
                           
                            <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Zone</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="zoneId">:</span>
                              </div>
                           </div>
                           
                          
                           
                              
                           
                              <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Variety of Crop Affected </label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <span id="variety">:</span>
                              </div>
                           </div> 
                           
                             <div class="form-group row" >
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Severity (%)</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                               <span id="severity">:</span>
                              </div>
                           </div>
                              <div class="form-group row" >
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-email-input">Sowing Land(ha)</label>
                              <div class="col-12 col-md-8 col-xl-8">
                                 <span class="colon">:</span>
                                 <span id="sowingland">:</span>
                              </div>
                           </div>
                           
                             <div class="form-group row">
                              <label class="col-12 col-md-4 col-xl-4 control-label" for="demo-text-input">Total Area Controlled(ha) </label>
                              <div class="col-12 col-md-8 col-xl-8"><span class="colon">:</span>
                               <span id="controlland">:</span>
                              </div>
                           </div> 
                           
                           </div>
                           </div>
                           
                           
                          
                         
                           <table class="table  table-bordered" id="fungicidetable">
                           <thead>
                           <tr>
                           <th>Sl#</th>
                           <th>Type of Fungicide</th>
                           <th>Fungicide Used (kg(lit))</th>
                           </tr>
                           </thead>
                           <tbody>
                           <%-- <c:forEach items="${mfungicideDetails}" var="list" varStatus="counter">
                           <tr>
                           <td>${counter.count}</td>
                           <td>${list.funginame}</td>
                            <td>${list.fungiused}</td>
                           </tr>
                           </c:forEach>
                            <tr>
                           <td></td>
                           <td style="font-weight:bold">Total</td>
                           <td style="font-weight:bold" id="totalfungicide"></td>
                           </tr> --%>
                           </tbody>
                           </table>
				
                           
			           <div id="subMainDiv">													
					   <div class="tablesec">
						<div class="table-responsive">
					    <table id="dataTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
							<tr>
								<th>Sl#</th>
								<th>Type of Fungicide</th>
								<th>Fungicide Used (kg(lit))</th>
								<th>Action</th>
							</tr>														
			                 
							</table>
						</div>
					</div>
					</div>
					
					   
                          <h3>Numbers of farmers participated on spraying</h3>
                         
					
					   <table class="table  table-bordered">
					      <thead>
					      <tr>
						      <td>Male Farmers</td>
						      <td>Female Farmers</td>
						      <td>Total Farmers</td>
					      </tr>
					      </thead>
					      <tbody>
					      <tr>
						      <td id="maleId"></td>
						      <td id="femaleId"></td>
						      <td id="total"></td>
					       </tr>
					     </tbody>
					    </table> 
                          
                          
                        <div id="subMainDiv">													
					   <div class="tablesec">
						<div class="table-responsive">
					    <table id="dataTable1" width="100%" border="0" cellspacing="0" cellpadding="0" class="table table-bordered">
							<tr>
								<th>Sl#</th>
								 <th>Male</th>
						         <th>Female</th>
								<th>Action</th>
							</tr>														
			                 
							</table>
						</div>
					</div>
					</div>   
                       
					                          
                          
                              <div class="form-group row" >
							  <div class="col-12 col-md-8 col-xl-8">
								 <button class="btn btn-danger mb-1" onclick="history.back()" >Back</button>
							  </div>
							  
					     </div>
                          
                        </div>
                        
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
$(document).ready(function(){
  $(".sampleno").click(function(){
    $(".sampletext1").hide();
  });
  $(".sampleyes").click(function(){
    $(".sampletext1").show();
  });
  
  
  
	 $("#btnSubmitId").click(function(){
		 
		 if(confirm("Do you want to Submit?")){
			 window.location.href="viewmonitorrecommendationsdetails.html";
		 }else{
		   return false;
		}
		 //$("#subMainDiv").show();
		  	  
	});
	 
	 
/* 	 $("#btnCancelId").click(function(){
		 
		 if(confirm("Do you want to Back?")){
			 window.location.href="viewmonitorrecommendationsdetails.html";
		 }else{
		   return false;
		}
		 //$("#subMainDiv").show();
		  	  
	}); */
	 
	 
	  $(document).on('click', '#btnCancelId', function(e) {
			 
		    swal({
				title: "Are you sure?",
				//text: " http://inoculatedsample.html", 
				type: "warning",
				confirmButtonText: "Ok",
				showCancelButton: true
		    })
		    	.then((result) => {
					if (result.value) {
						window.location.href="viewmonitorrecommendationsdetails.html";
					} else if (result.dismiss === 'cancel') {
					    swal(
					      'Cancelled',
					      'Your stay here :)',
					      'error'
					    )
					}
				})
		});
	 

	});
	
   function calculationtotalFarmers(a,b) {
	var tmale =  $("#maleId").val();
	var tfmale =  $("#femaleId").val();
	 if(tmale=='' || tfmale=='' ){
			return false;
	  }
	var tmalefemale = parseInt( tmale ) + parseInt( tfmale ) ;
	$("#total").val(tmalefemale);
	  
	  
   }
</script>
<script>
$(document).ready(function(){
	
	$("#dataTable").hide();
	$("#dataTable1").hide();

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
	    	<%-- '<input name="<%= abbreviation %>" type="checkbox">' +
	    	'<label for="<%= abbreviation %>"><%= capName %></label>' + --%>
	    '</li>'
	);

	// Populate list with states
	_.each(usStates, function(s) {
	    s.capName = _.startCase(s.name.toLowerCase());
	    $('ul').append(stateTemplate(s));
	});
	

});


var fungicideDetails = [];
function addRow(tableID) {
	
	var v1=$('#fungicideTypeId').val();
	var vt1=$("#fungicideTypeId :selected").text();
	if(v1=='Select'){
		alert("Type of fungicide should be selected");
		$("#fungicideTypeId").focus();
		return false;	
	}
	var v2=$('#fungicideused').val();
    if(v2==''){
    	alert("Fungicide used (kg(lit)) should not left blank");
		$("#fungicideused").focus();
		return false;	
    }

    //
    
    for(var i = 0; i < fungicideDetails.length; i++) {
        var cur = fungicideDetails[i];
        if(cur.fungicideTypeId == v1 ) {
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

    /* var cell4 = row.insertCell(3);
    cell4.innerHTML = v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = v4; */
	
    var cell4 = row.insertCell(3);
    cell4.innerHTML = v5; 
	
    fungicideDetails.push({ 
        "fungicideTypeId" : v1,
        "fungicideused" : v2/* ,
        "severityId" : v3,
        "reaction"   : v4 */
}); 
    
    //total count show in table
    
    var rowCount = $('#dataTable tr').length;
    var count = 0;
    for(i=1;i<rowCount;i++)
    	{
    	if(document.getElementById("dataTable").rows[i].cells[0].innerHTML != '')
    		{
    		count += parseInt(document.getElementById("dataTable").rows[i].cells[2].innerHTML)
    		}
    	}
    var tblHtml = "<tr><td></td><td><b>Total</b></td><td>"+count+"</td><td></td></tr>";
    if(rowCount > 2)
    	{
    	document.getElementById("dataTable").deleteRow(rowCount-2);
    	}
    
    $("#dataTable").append(tblHtml);
    // end
    clearData();
	       
	       
}

function clearData(){
	$('#fungicideTypeId').val('Select');
	$('#fungicideused').val('');
	//$('#severityId').val('');
	//$('#reactionId').val('Select');
	
	
	
}

function clearRow(currElement,rustTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < fungicideDetails.length; i++) {
	        var cur = fungicideDetails[i];
	        if(cur.fungicideTypeId == fungicideTypeId ) {
	        	fungicideDetails.splice(i, 1);
	          break;
	        }
	 }
	 
	 document.getElementById("dataTable").deleteRow(parentRowIndex);
		// updateIndex();
	 count=$('table#dataTable tr').length;
	 if(count==2){
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





</script>
<script>
var farmerDetails = [];
function addRow1(tableID) {
	
	var m1=$('#maleId').val();
	//var vt1=$("#fungicideTypeId :selected").text();
	if(m1==''){
		alert("Male should not left blank");
		$("#maleId").focus();
		return false;	
	}
	var m2=$('#femaleId').val();
    if(m2==''){
    	alert("Female should not left blank");
		$("#femaleId").focus();
		return false;	
    }

    //
    
	 /*    for(var i = 0; i < farmerDetails.length; i++) {
	        var cur = farmerDetails[i];
	        if(cur.fungicideTypeId == v1 ) {
	        	alert('Already added '+vt1+' type !!');
	    		return false;
	        }
	 	} */ 
    
    var m5='<a href="javascript:void(0);" onclick="clearRow1(this,\'' + m1 + '\');" class="btn btn-danger">Delete</a>';
    $("#dataTable1").show();
   
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.innerHTML = rowCount;

    var cell2 = row.insertCell(1);
    cell2.innerHTML = m1;

    var cell3 = row.insertCell(2);
    cell3.innerHTML = m2;

    /* var cell4 = row.insertCell(3);
    cell4.innerHTML = v3;
	
    var cell5 = row.insertCell(4);
    cell5.innerHTML = v4; */
	
    var cell4 = row.insertCell(3);
    cell4.innerHTML = m5; 
	
    farmerDetails.push({ 
	        "maleId" : m1,
	        "femaleId" : m2/* ,
	        "severityId" : v3,
	        "reaction"   : v4 */
    }); 
    
    var rowCount = $('#dataTable1 tr').length;
    var count = 0;
    for(i=1;i<rowCount;i++)
    	{
    	if(document.getElementById("dataTable1").rows[i].cells[0].innerHTML != '')
    		{
    		count += parseInt(document.getElementById("dataTable1").rows[i].cells[1].innerHTML) + parseInt(document.getElementById("dataTable1").rows[i].cells[2].innerHTML);
    		}
    	}
    var tblHtml = "<tr><td></td><td><b>Total</b></td><td>"+count+"</td><td></td></tr>";
    if(rowCount > 2)
    	{
    	document.getElementById("dataTable1").deleteRow(rowCount-2);
    	}
    
    $("#dataTable1").append(tblHtml);
    
    clearData1();
	       
	       
}

function clearData1(){
	$('#maleId').val('');
	$('#femaleId').val('');
	//$('#severityId').val('');
	//$('#reactionId').val('Select');
	
	
	
}

function clearRow1(currElement,rustTypeId){
	 var parentRowIndex = currElement.parentNode.parentNode.rowIndex;
	 
	 for(var i = 0; i < farmerDetails.length; i++) {
	        var cur = farmerDetails[i];
	        if(cur.fungicideTypeId == fungicideTypeId ) {
	        	farmerDetails.splice(i, 1);
	          break;
	        }
	 }
	 
	 document.getElementById("dataTable1").deleteRow(parentRowIndex);
		// updateIndex();
	 count=$('table#dataTable1 tr').length;
	 if(count==2){
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

</script>




<%-- </c:if> --%>

<script>
// view

var encodeJson = '${implementationdata}';
var json = JSON.parse(atob(encodeJson));
$("#regionId").html(json[0].region);
$("#woredaId").html(json[0].woreda);
$("#zoneId").html(json[0].zone);
$("#kebelId").html(json[0].kebele);
$("#controlland").html(json[0].controlland);
$("#severity").html(json[0].severity);
$("#pasaffeted").html(json[0].pasaffeted);
$("#sowingland").html(json[0].sowingland);
$("#infectedland").html(json[0].infectedland);
$("#variety").html(json[0].variety);
$("#gstage").html(json[0].gstage);
$("#incedences").html(json[0].incedences);
$("#rust").html(json[0].rust);
$("#maleId").append(json[0].malefar);
$("#femaleId").html(json[0].femalefar);
$("#total").html(json[0].totalfar);
$("#totalfungicide").html(json[0].fungitotal);
console.log(json);

// fungicide details 
var fungicideDetails = json[0].mfungicideDetails;
var html_ = "";
var count = 0;
for(i=0;i<fungicideDetails.length;i++)
	{
		var jsonObj = fungicideDetails[i];
		var used = jsonObj.fungiused;
		var name = jsonObj.funginame;
		count += parseInt(used);
		html_ += "<tr><td>"+(i+1)+"</td><td>"+name+"</td><td>"+used+"</td></tr>";
	}

$("#fungicidetable").append(html_+"<tr><td></td><td><b>Total</b></td><td>"+count+"</td></tr>");



</script>