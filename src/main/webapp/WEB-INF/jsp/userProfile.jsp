<script language="javascript">
	pageHeader="";
	strFirstLink="Welcome";
	strLastLink="";

</script>


<style type="text/css">
#image-preview {
    width: auto;
    height: 235px;
    position: relative;
    overflow: hidden;
    background-image:url(images/userPic.jpg);
    background-size: cover;
    background-position: center center;
    color: #ecf0f1;
	
    border: 3px solid #ffffff;
    cursor: pointer;
    box-shadow: 0 0 2px rgba(51, 51, 51, 0.5);
}

#image-preview input {
  line-height: 200px;
  font-size: 200px;
  position: absolute;
  opacity: 0;
  z-index: 10;
  cursor:pointer
}
#image-preview label {
  position: absolute;
  z-index: 5;
  opacity: 0.8;
  cursor: pointer;
  background-color: #3c8dbc;
  width: 200px;
  height: 50px;
  font-size: 20px;
  line-height: 50px;
  text-transform: uppercase;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
  text-align: center;
  transition:.2s;
  cursor:pointer
}

#image-preview:hover label {
	background-color: #0f5177;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
  $.uploadPreview({
    input_field: "#image-upload",
    preview_box: "#image-preview",
    label_field: "#image-label"
  });
});
</script>
<script type="text/javascript">
$(document).ready(function() {
  $.uploadPreview({
    input_field: "#image-upload",   // Default: .image-upload
    preview_box: "#image-preview",  // Default: .image-preview
    label_field: "#image-label",    // Default: .image-label
    label_default: "Choose File",   // Default: Choose File
    label_selected: "Change File",  // Default: Change File
    no_label: false                 // Default: false
  });
});
</script>

<div class="row">
<div class="col-md-6">
	
          <!-- Horizontal Form -->
          <div class="box box-info">
			<div class="box-header">
				<h3 class="heading3">Change Account Details</h3>
			</div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal">
				
              <div class="box-body">
              <div class="row">
				<div class="col-sm-9">
				<div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Current Mobile No.<span class="mandatory">*</span></label>

                  <div class="col-sm-8">
					<span class="colon">:</span>
                    <input type="email" class="form-control" id="inputEmail3" placeholder="Enter New Mobile No.">
                  </div>
                </div>
				<div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">New Mobile No.</label>

                  <div class="col-sm-8">
					<span class="colon">:</span>
                    <input type="email" class="form-control" id="inputEmail3" placeholder="Enter New Mobile No.">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Change Email Id</label>

                  <div class="col-sm-8">
				  <span class="colon">:</span>
                    <input type="email" class="form-control" id="inputEmail3" placeholder="Enter New Email">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-4 control-label">Change Password</label>

                  <div class="col-sm-8">
				  <span class="colon">:</span>
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Enter New Password">
                  </div>
                </div>
				<div class="form-group">
                  <label for="inputPassword3" class="col-sm-4 control-label">Confirm Password</label>

                  <div class="col-sm-8">
				  <span class="colon">:</span>
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Confirm Password">
                  </div>
                </div>
			
				
             
              </div>
			  <div class="col-sm-3">
				<div class="form-group">
                  <div class="col-sm-12">
                    <div id="image-preview">
					  <label for="image-upload" id="image-label">Choose File</label>
					  <input type="file" name="image" id="image-upload" />
					</div>
                  </div>
                </div>
                 <div class="file-upload">
                                <div class="image-upload-wrap">
                                  <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />
                                  <div class="drag-text"> <img src="/cdms/static/images/noimage.png" alt="noImage" width="100%"> </div>
                                </div>
                                <div class="file-upload-content"> <img class="file-upload-image" src="#" alt="your image" />
                                   
                                </div>
                                <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Upload Photo</button>
                              </div>
			  </div>
              </div>
              </div>
			  
              <!-- /.box-body -->
              <div class="box-footer">
                <a data-toggle="modal" data-target="#passModal" class="btn btn-info pull-right">Change</a>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
          <!-- /.box -->
          
        </div>

</div>
<style>
#passModal .modal-header{padding:7px;}
</style>

<div class="modal modal-success fade" id="passModal" style="display: none;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <a  class="close" data-dismiss="modal" aria-label="Close">
                  <i class="fa fa-close"></i></a>
                
              </div>
              <div class="modal-body text-center">
                <h2>Updated Successfully</h2>
				<br>
					<img src="images/tick.png" alt="tick">
              </div>
              
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>