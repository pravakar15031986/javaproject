<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>

<style>
.breadcrumb>li+li:before
{
display:none;
}
</style>


<div id="mainTable">

 <div class="box box-info">
            
            <!-- /.box-header -->
            <div class="box-body">
				<h3>Existing User</h3>
              
              <div class="table-responsive">
							 <table class="table table-bordered mytable">
                <tbody><tr>
                  	 <th >Sl No.</th>
                    <th>Membership no.</th>
                   <th>Business Code(EATTA)</th>
                     <th>Company</th>
                     <th>Entry Date</th>
                     <th>Member Type</th>
                     <th>Mobile No</th>
                     <th>Email Id</th>
                     <th>Contact Person Mobile no</th>
                     <th>Status</th>
                     <th style="text-align:center">Action</th>
                
                  
                  
                </tr>
                
				
				<tr>
                  <tr><td>1</td>
					   <td>01010001101</td>
					   <td>CTCL</td>
					   <td>001-Chebango EPZ Tea Company Ltd</td>
					   <td>07-2015</td>
					   <td>05-Producer</td>
					   <td>0715881338</td>
					   <td>chebango@chebango.co.ke</td>
				       <td>+254 41 2491713</td>
				  <td><span class="label label-danger">Document Requested</span></td>
                  <td style="text-align:center"><a href="viewPreExistingUserApplication" class="btn bg-orange btn-flat" data-toggle="tooltip" title="" data-placement="bottom" data-original-title="View"><i class="fa fa-expand"></i> </a></td>
                </tr>
                
                
              </tbody></table>
					</div>
            <!-- /.box-body -->
          </div>

<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2();
    
  //Date range picker
    $('#reservation, #reservation1').daterangepicker()
    
  

    //Date picker
    $('#datepicker, #datepicker1').datepicker({
      autoclose: true
      
    })
    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })
  });
  
  $(document).ready(function(){
	  $(".okBtn").hide();
	  $(".editBtn").click(function(){
		  
		  $(".well .form-control").removeAttr('disabled');
		  $(this).hide();
			$(".okBtn").show();
	  });
	  
	  $(".okBtn").click(function(){
		  
		 $(".well .form-control").prop("disabled", true);
		  $(this).hide();
			$(".editBtn").show();
	  });
	  
	  
  });
    </script>
    