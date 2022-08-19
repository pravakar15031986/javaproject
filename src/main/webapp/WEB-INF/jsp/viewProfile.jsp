

<script>
$(function() {
	
	    $('.directDetails').hide(); 
	    $('.otherDetails').hide();
	    $('.docdetails').hide();
    $('#memberDetails').click(function(){
    $('.basicinfo').show();
    $('.directDetails').hide(); 
    $('.otherDetails').hide();
    $('.docdetails').hide();
    });
    
    $('#directorDetails').click(function(){
    	$('.directDetails').show();
        $('.basicinfo').hide();
    	$('.otherDetails').hide();
    	$('.docdetails').hide();
    });
    $('#otherDetails').click(function(){
    	  $('.otherDetails').show();
    	  $('.directDetails').hide();
    	  $('.basicinfo').hide();
    	  $('.docdetails').hide();
    });
    $('#upldDocs').click(function(){
    	$('.docdetails').show();
    	$('.otherDetails').hide();
  	    $('.directDetails').hide();
  	    $('.basicinfo').hide();
  	  
  });
    
});
$(document).ready(function(){
	  $(".okBtn").hide();
	  $(".editBtn").click(function(){
		  
		  $(".well .control1").removeAttr('disabled');
		  $(this).hide();
			$(".okBtn").show();
	  });
	  
	  $(".okBtn").click(function(){
		  
		 $(".well .control1").prop("disabled", true);
		  $(this).hide();
			$(".editBtn").show();
	  });
	  
	  
	  
		$(".proprint").click(function(){
			
			  $(".nav-tabs-custom").print();
			
		});
	  
});
</script>
<style>
.forprint{display:none;}

@media print {
#form1, #form2, #form3, #form4{display:block} 
.nav-tabs, .proprint{display:none;}
.col-sm-4{ float:none; display:block; }
.col-sm-2{float:left;display:inline-block;width:250px;}
.col-sm-2, .col-sm-4{padding:3px 15px}
.forprint{display:block;margin:10px 0;}

}
</style>
	
          <div class="nav-tabs-custom">
          	
          	<div class="pull-right">
          		<a class="btn btn-sm btn-danger proprint">View Profile</a>
          	</div>
          	
          	
          	
            <ul class="nav nav-tabs">
             <li class="active"><a href="#form1" data-toggle="tab">Membership Details</a></li>
			  <li><a  href="#form2" data-toggle="tab">Director Details</a></li>
              <li><a  href="#form3" data-toggle="tab">Other Details</a></li>
              <li><a  href="#form4" data-toggle="tab"> Documents</a></li>
            </ul>
            <div class="clearfix"></div>
            <div class="tab-content">
             
              <div class="tab-pane active" id="form1">
              	<h2 class="forprint">Membership Details</h2>
				 <div class="form-horizontal">
				 <div class="form-group">
								<label class="control-label col-sm-2" for="email">Member Type</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>05-Producer</label>
								<label class="control-label col-sm-2">Applicant's Name</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>Martin Dunford</label>
							  </div>
							  
							  <div class="form-group">
								<label class="control-label col-sm-2" for="email">Applicant's Mobile No.</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>+254 798947723</label>
								<label class="control-label col-sm-2">Applicant's Email Id.</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>jmartin31@gmail.com</label>
							  </div>
							  
							  
							  
							  <div class="form-group">
								<label class="control-label col-sm-2" for="email">Country</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>01-Kenya</label>
								<label class="control-label col-sm-2">County/City/Province</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>03-Mombasa</label>
							  </div>
							  
							
							  <div class="form-group">
								<label class="control-label col-sm-2">Address</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>5th Floor, Right Wing</label>		
								<label class="control-label col-sm-2">Building</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>Trance Towers</label>	
										
							  </div>
							  
							   <div class="form-group">
								<label class="control-label col-sm-2">Street</label>
									<label class="control-label nobold col-sm-4"><span class="colon">:</span>Tsavo Road, Off Mombasa Road</label>
								<label class="control-label col-sm-2">Town</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>Mombasa</label>	
									
							  </div>							  
							
							  <div class="form-group">
								<label class="control-label col-sm-2">Pin Code</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>50427</label>	
								<label class="control-label col-sm-2">Telephone No.</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>+254 20 2425031</label>
								
																
							  </div>
							
							
							  <div class="form-group">
								<label class="control-label col-sm-2">Mobile No.</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>0720884441</label>
								<label class="control-label col-sm-2">Fax No.</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span> 20 2425031</label>
								
															
							  </div>
							  <div class="form-group">
								<label class="control-label col-sm-2">Email Id</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>martin31@gmail.com</label>	
								
								<label class="control-label col-sm-2">Website</label>
								<label class="control-label nobold col-sm-4"><span class="colon">:</span>www.ktdateas.com</label>
								
							  </div>
				 </div>			 
            </div>
            <!-- /.tab-content -->
            
            <div class="tab-pane" id="form2">
            <h2 class="forprint">Director Details</h2>
            	<div class="table-responsive">
            		<table class="table table-bordered" id="partner_details">
                                <thead>
                                    <tr>
                                        <th >Sl No.</th>
                                        <th> Name</th>
                                        <th> Nationality</th>
										<th> Contact No</th>
                                        <th>Identification No </th>
										<th>ID Proof</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1 </td>
                                        <td>Ottoyo Serling</td>
                                        <td>Kenyan</td>
                                        <td>251 252575600</td>
                                        <td>12345</td>
									    <td> <a href="#" style="color:red;"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
                                        
                                    </tr>
                                      <tr>
                                        <td>2 </td>
                                        <td>Akilah Kurwa</td>
                                        <td>Ethiopian</td>
                                        <td> 020312993</td>
                                        <td>65783</td>
									    <td> <a href="#" style="color:red;"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
                                        
                                    </tr>
                                      <tr>
                                        <td>3 </td>
                                        <td>Liwaza Magoma</td>
                                        <td>Kenyan</td>
                                        <td>+254 701844902</td>
                                        <td>43214</td>
									    <td> <a href="#" style="color:red;"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
                                        
                                    </tr>
							</tbody></table>
            	</div>
            </div>
          
          	 <div class="tab-pane" id="form3">
          	 <h2 class="forprint">Other Details</h2>
          	 	<div class="form-horizontal">
          	 	<div class="form-group">
					<label class="control-label col-sm-2"> Description of Business<span class="mandatory" >*</span></label>
					<div class="col-sm-3">
						<span class="colon">:</span>
						<textarea id="desc_busn" class="form-control" readonly rows="5">Kenya Tea Development Agency Holdings is a provider of comprehensive services to more than 565,000 small tea farmers such as agri-extension, transportation, processing, and marketing
						</textarea><i id="dsc_span" hidden = "hidden" class='red'>* Please give business description.</i>
					</div>
					<div class="clearfix"></div>
				 </div>
              
               <div class="form-group">
					<label class="control-label col-sm-2"> Name of the Banker<span class="mandatory" >*</span></label>
					<div class="col-sm-3">
						<span class="colon">:</span>
						<input id="bank_id" type="text" class="form-control" value="African Banking Corporation Ltd."><i id="bank_span" hidden = "hidden" class='red'>* Please give bank name.</i>
					</div>
					<div class="clearfix"></div>
				 </div>
          	 </div>
          	 </div>
          	 
          	  <div class="tab-pane" id="form4">
          	  <h2 class="forprint">Document Details</h2>
          	  	<div class="table-responsive">
                            <table class="table table-bordered" id="doc_details">
                                <thead>
                                    <tr>
                                        <th>Sl No.</th>
                                        <th> Documents</th>
										<th >ID Proof</th>
                                        <th>Valid From</th>
                                        <th >Valid To</th>
                                        <th>Validity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1 </td>
                                        <td>TEA MANUFATURING LICENSE</td>
									    <td> <a href="#" style="color:red;"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
                                         <td>01-Jun-2018</td>
                                         <td>31-May-2019</td>
                                          <td><a href="#" style="color:green;"><i class="fa fa-check" aria-hidden="true"></i></a></td>
                                    </tr>
                                      <tr>
                                        <td>2 </td>
                                        <td>PIN Certificate</td>
									    <td> <a href="#" style="color:red;"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
                                          <td>15-May-2018</td>
                                         <td>14-May-2019</td>
                                         <td><a href="#" style="color:green;"><i class="fa fa-check" aria-hidden="true"></i></a></td>
                                    </tr>
                                      <tr>
                                        <td>3 </td>
                                        <td>VAT Certificate</td>
									    <td> <a href="#" style="color:red;"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></td>
                                            <td>01-Jun-2017</td>
                                         <td>31-May-2018</td>
                                           <td><a href="#" style="color:red;"><i class="fa fa-close" aria-hidden="true"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
							
							
						</div>
				
          	  </div>
          
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
  
	

<script type="text/javascript">
$(document).ready(function(){
 
$("#select1").change(function() {
	$("#select2").attr('disabled',false);
  if ($(this).data('options') === undefined) {
    /*Taking an array of all options-2 and kind of embedding it on the select1*/
    $(this).data('options', $('#select2 option').clone());
  }
  var id = $(this).val();
  var options = $(this).data('options').filter('[value=' + id + ']');
  $('#select2').html(options);
});
});
</script>