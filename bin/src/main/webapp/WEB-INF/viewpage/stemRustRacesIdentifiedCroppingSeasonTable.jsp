<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                 
                  <div class="title-details">
                     <h4>Rust Races Identified</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">MIS Report</li>
						<li class="breadcrumb-item active" aria-current="page">Race By Sample</li>
					</ol>
                     </nav>
                  </div>
     
               </div>
               <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card">
                        <div class="card-header">
                           <ul class="nav nav-tabs nav-fill" role="tablist">
                              <a class="nav-item nav-link 	active" href="stemRustRaces-IdentifiedCropping">View</a>
                           </ul>
                           <div class="indicatorslist">
                            <button title="excel"   class="btn btn-outline-success btn-sm shadow-none" onclick="downloadExcel()"><i class="icon-excel-file" ></i></button>
                           </div> 
                        </div>
                        <!-- Search Panel -->
                          <div class="search-container">
                        
                         <c:if test="${SearchShow eq true }">
                        
                           <div class="search-sec" style="display:block;">
                        </c:if>
                        <c:if test="${SearchShow eq false }">
                        
                           <div class="search-sec">
                        </c:if>
                        
                           <form action="stemRustRaces-IdentifiedCroppingSearch" method="POST">
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
                         
                        <div class="card-body">
                           <div class="table-responsive">
                           <table width="1042" border="1" class="table table-bordered" id="viewtable">
  
    
</table>
                          
                              
                           </div>
                           
                        </div>
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
				} 
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

var RustType = '${RustType}';
$("#RustType").val(RustType);

var json = '${TableData}';
console.log(atob(json));
json = JSON.parse(atob(json));
var columns = json.Columns;

var table_ = '<tr><th rowspan="2">Region</th><th rowspan="2">Samples analyzed</th>';
table_ += '<th colspan="'+columns.length+'" class="text-center">Races</th></tr><tr>';
for(i=0;i<columns.length;i++)
{
table_ += '<th>'+columns[i]+'</th>';
}
table_ += '</tr>';

$("#viewtable").html(table_);

var jsa = json.TableData;
for(i=0;i<jsa.length;i++)
	{
	var trrow = "<tr>";
	var innerJsa = jsa[i];
	 for(j=0;j<innerJsa.length-1;j++)
	{
		 if(j>1)
			 {// region , result
			 if(innerJsa[j]==0)
				 {
				 trrow += "<td>"+innerJsa[j]+"</td>";
				 }else{
					 trrow += "<td><a href='javascript:void(0)' onclick='viewDetails("+innerJsa[innerJsa.length-1]+",\""+columns[j-2]+"\")'>"+innerJsa[j]+"</a></td>";
				} 
			 }
		 else
			 {// region 
			 var htm = "";
			 htm = (j>0)?("<a href='javascript:void(0)' onclick='viewDetails("+innerJsa[innerJsa.length-1]+","+")'>"+innerJsa[j]+"</a>"):innerJsa[j];
		 trrow += '<td>'+htm+'</td>';
			 }
	}
	 trrow += "<tr>";
	$("#viewtable").append(trrow); 
	}
 
</script>
<script>
function viewDetails(regionId,raceScore)
{
	$("#regionId").val(regionId);
	$("#raceResult").val(raceScore);
	$("#myform").submit();
	}
</script>
<script>
//Excel Download

function downloadExcel(){
	$("#RustTypeXL").val($("#RustType").val());
	$("#exceldownload").submit(); 
}
</script>
<form action="viewReportDetails" id="myform" method="post">
<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>



<input type="hidden" name="rustId" value="${RustType}">
<input type="hidden" name="regionId" id="regionId">
<input type="hidden" name="raceResult" id="raceResult">
</form>
<form action="raceBySampleReportExcelDownload" id="exceldownload" method="post">
<input type="hidden" id="RustTypeXL" name="RustTypeXL">
</form>
   