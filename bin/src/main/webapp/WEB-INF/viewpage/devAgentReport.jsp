<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>


<div class="mainpanel">
	<div class="section">
		<div class="page-title">
			<div class="title-details">
				<h4>View Development Agents Details</h4>
				<nav aria-label="breadcrumb"> 
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home"><span
								class="icon-home1"></span></a></li>
						<li class="breadcrumb-item">Dashboard</li>
						<li class="breadcrumb-item active" aria-current="page">Development Agents</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs nav-fill" role="tablist">
							<a class="nav-item nav-link active" href="devAgentReport">View</a>
						</ul>
						<div class="indicatorslist">
							 <a
								title="" href="Home" id="backIcon"
								 data-toggle="tooltip"
								data-placement="top" data-original-title="Back"><i
								class="icon-arrow-left1"></i></a>
						 
						</div>
						<div class="indicatorslist excel">
                                <form action="downloadDevAgentReportExcel" method="post" id="excelDownloadForm">
 						<input type="text" style="display:none;" name="desigId" id="desigIdExcel">
 						<input type="text" style="display:none;" name="mobileNo" id="mobileNoExcel">
                        <input type="text" style="display:none;" name="email" id="emailExcel">
                        <input type="text" style="display:none;" name="name" id="nameExcel">
                        		 <button title="excel" id="excelDownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-excel-file" ></i></button>
                        </form>
                        </div>
                        <div class="indicatorslist pdf">
                            <form action="downloadDevAgentReportPdf" method="post" id="pdfDownloadForm" target="_blank">         
 						<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
 						<input type="text" style="display:none;" name="desigId" id="desigIdPdf">
 						<input type="text" style="display:none;" name="mobileNo" id="mobileNoPdf">
                        <input type="text" style="display:none;" name="email" id="emailPdf">
                        <input type="text" style="display:none;" name="name" id="namePdf">
                        		 <button title="Print" id="pdfDownload" class="btn btn-outline-success btn-sm shadow-none"><i class="icon-printer1" ></i></button>
                        </form>
                        </div>
					</div>
					<!-- Search Panel -->
					<form:form class="col-sm-12 form-horizontal customform" action="devAgentReport"  method="post" modelAttribute="searchVo" autocomplete="off">
					<input type="hidden" name="csrf_token_" value="<c:out value='${csrf_token_}'/>"/>
					<div class="search-container">
                           <div class="search-sec">
                              <div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Designation</label>
									<div class="col-lg-3">
										<form:select class="form-control" id="intdesigid" path="desn">
											<option value="" selected="selected">--Select--</option>
											<c:forEach items="${desingnationList}" var="des">
											<form:option value="${des.id}">${des.designation}</form:option>
											</c:forEach>
										</form:select>
									</div>
									<label class="col-lg-2 ">Mobile no.</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="mobileno"
											placeholder="" data-bv-field="fullName" id="mobile" autocomplete="off" maxlength="15"/>
									</div>
								</div>
							</div>
                              <div class="form-group">
								<div class="row">
									<label class="col-lg-2 ">Email</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="email"
											placeholder="" data-bv-field="fullName" id="email" autocomplete="off" maxlength="50"/>
									</div>
									<label class="col-lg-2 ">Name</label>
									<div class="col-lg-3">
										<form:input class="form-control" path="fullname"
											placeholder="" data-bv-field="fullName" id="fullName" autocomplete="off" maxlength="50"/>
									</div>
									<div class="col-lg-2">
										<button class="btn btn-primary" type="submit" onclick="validate()">
											<i class="fa fa-search"></i> Search
										</button>
									</div>
								</div>
							</div>
                           </div>
                           <div class="text-center"> <a class="searchopen" title="Search" data-toggle="tooltip" data-placement="bottom" > <i class="icon-angle-arrow-down"></i> </a></div>
                        </div>
                        </form:form>
					<!-- Search Panel -->
					<!--===================================================-->
					<div class="card-body">
						<div class="table-responsive">
						
						
							<table data-toggle="table" class="table table-hover table-bordered" id="viewTable">
								<thead>
									<tr>
										<th width="40px">Sl#</th>
										<th>Development Agent Name</th>
										<th>Gender</th>
										<th>Designation</th>
										<th>Role</th>
										<th>Mobile</th>
										<th>Email</th>
										<th>Location</th>
									</tr>
								</thead>
								     <tbody ><!-- userdetails -->
								     
								       <c:forEach items="${devAgentDetails}" var="dtls" varStatus="counter">
                                    <tr >
                                  
                                       <td>${counter.count}</td>
                                       <td>${dtls.fullName }</td>
                                       <td>
                                       <c:if test="${dtls.gender eq 1 }">
                                       Male
                                       </c:if>
                                       <c:if test="${dtls.gender eq 2 }">
                                       Female
                                       </c:if>
                                       <c:if test="${dtls.gender eq 0 }">
                                       NA
                                       </c:if>
                                       </td>
                                       <td>${dtls.designation }</td>
                                       <td>${dtls.roleName }</td>
                                       <td>${dtls.mobile }</td>
                                       <td>${dtls.email }</td>
                                       <td>${dtls.demoName }</td>
                                    </tr>
                                    </c:forEach>
                                 </tbody>
							</table>
	
						</div>
						<div id="showPageNId">
						</div>
						<div style="float: right;">
							<ul class="pagination">
  							</ul>
						</div>						
					</div>
					<div>
						
						<span id="p4"></span> 
					</div>
					<!--===================================================-->
				</div>
			</div>
		</div>
	</div>
</div>

<script>
function validate() {
	var name=$("#fullName").val();
	var email=$("#email").val();
	var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{0,4}$/;
	var mobile=$("#mobile").val();
	event.preventDefault();
	var form = event.target.form;
	
	if(name.charAt(0)== ' ' || name.charAt(name.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Name", "error").then(function() {
			   $("#fullName").focus();
		   });
      return false;
	   }
	if(name!=null)
	{
			var count= 0;
			var i;
			for(i=0;i<name.length && i+1 < name.length;i++)
			{
				if ((name.charAt(i) == ' ') && (name.charAt(i + 1) == ' ')) 
				{
					count++;
				}
			}
			if (count > 0) {
				swal("Error", "Name should not contain consecutive blank spaces", "error").then(function() {
				   $("#fullName").focus();
				});
				return false;
			}
	}
	if(/^[a-zA-Z ]{0,50}$/.test(name) == false) {
	  	swal("Error","Name accept only alphabets", "error").then(function() {
					   $("#fullName").focus();
				   });
	  	return false;
	  }
	if(mobile.charAt(0)== ' ' || mobile.charAt(mobile.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Mobile No.", "error").then(function() {
			   $("#mobile").focus();
		   });
         return false;
	   }
	if(mobile!=null)
	{
			var count= 0;
			var i;
			for(i=0;i<mobile.length && i+1 < mobile.length;i++)
			{
				if ((mobile.charAt(i) == ' ') && (mobile.charAt(i + 1) == ' ')) 
				{
					count++;
				}
			}
			if (count > 0) {
				swal("Error", "Mobile No. should not contain consecutive blank spaces", "error").then(function() {
				   $("#mobile").focus();
				});
				return false;
			}
	}
	if(/^[0-9]*$/.test(mobile) == false) {
	  	swal("Error","Mobile No. accept only alphabets", "error").then(function() {
					   $("#mobile").focus();
				   });
	  	return false;
	  }
	if(mobile.length>0 && mobile.length <6)
   	{
   		swal(
					'Error',
					'Mobile No. should not be less than 6 digits',
					'error'
					)
					$("#mobile").focus();
					return false;
   	}
	if(email.charAt(0)== ' ' || email.charAt(email.length - 1)== ' '){
		   swal("Error", "White space is not allowed at initial and last place in Email", "error").then(function() {
			   $("#email").focus();
		   });
      return false;
	   }
	if(email!=null)
	{
			var count= 0;
			var i;
			for(i=0;i<email.length && i+1 < email.length;i++)
			{
				if ((email.charAt(i) == ' ') && (email.charAt(i + 1) == ' ')) 
				{
					count++;
				}
			}
			if (count > 0) {
				swal("Error", "Email should not contain consecutive blank spaces", "error").then(function() {
				   $("#email").focus();
				});
				return false;
			}
	}
	if(email.length>0 && !email.match(email_regex))
	{
		swal(
				'Error',
				'Invalid Email',
				'error'
				)
				$("#email").focus();
				return false;
	}
	form.submit();
}

</script>



<script>
$(document).ready(function(){
		
		$('#viewTable').DataTable({
         "paging":   true,
         "ordering": true,
         'searching':false,
         "info":     true,
      //initialization params as usual
        fnInitComplete : function() {
           if ($(this).find('td').length<=1) {
              $('.dataTables_wrapper').hide();
              swal("No record found")
              }
           }
     })
});
</script>

<script>
	$(document).ready(function(){
		$("#excelDownload").click(function(){
			$("#desigIdExcel").val($("#intdesigid").val())
			$("#mobileNoExcel").val($("#mobile").val())
			$("#emailExcel").val($("#email").val())
			$("#nameExcel").val($("#fullName").val())
			$("#excelDownloadForm").submit() 
		})
		$("#pdfDownload").click(function(){
			$("#desigIdPdf").val($("#intdesigid").val())
			$("#mobileNoPdf").val($("#mobile").val())
			$("#emailPdf").val($("#email").val())
			$("#namePdf").val($("#fullName").val())
			$("pdfDownloadForm").submit() 
		})
	});
	</script>
	<script>
	if(${fn:length(devAgentDetails)}==0)
	{
		$(".excel,.pdf").hide()
		} 
	</script>