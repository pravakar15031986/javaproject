<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<!-- daterangepicker -->
<script src="scripts/moment.min.js"></script>
<script type="text/javascript" language="javascript">
    var dayarray = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
    var montharray = new Array("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12");

    function getthedate() {
        var mydate = new Date();
        var year = mydate.getYear();
        if (year < 1000)
            year += 1900;
        var month = mydate.getMonth();
        var day = mydate.getDay();
        var daym = mydate.getDate();
        if (daym < 10)
            daym = "0" + daym;
        var hours = mydate.getHours();
        var minutes = mydate.getMinutes();
        var seconds = mydate.getSeconds();
        var dn = "AM";
        if (hours >= 12)
            dn = "PM";
        if (hours > 12) {
            hours = hours - 12;
        }
        if (hours == 0)
            hours = 12;
        if (minutes <= 9)
            minutes = "0" + minutes;
        if (seconds <= 9)
            seconds = "0" + seconds;
        //change font size here
        var cdate = "<small><font  face='Arial' font size='2pt'>" + hours + ":" + minutes + ":" + seconds + " " + dn
+ " " + dayarray[day] + ", " + montharray[month] + "/ " + daym + "/ " + year + " </font></small>";
        if (document.all)
            document.all.clock.innerHTML = cdate;
        else if (document.getElementById)
            document.getElementById("clock").innerHTML = cdate;
        else
            document.write(cdate);
    }
    if (!document.all && !document.getElementById)
        getthedate();
    function goforit() {
        if (document.all || document.getElementById)
            setInterval("getthedate()", 1000);
    }

</script>
<script type="text/javascript" language="JavaScript">
<!--

    function startclock() {

        var thetime = new Date();

        var nhours = thetime.getHours();
        var nmins = thetime.getMinutes();
        var nsecn = thetime.getSeconds();
        var nday = thetime.getDay();
        var nmonth = thetime.getMonth();
        var ntoday = thetime.getDate();
        var nyear = thetime.getYear();
        var AorP = " ";

        if (nhours >= 12)
            AorP = "PM";
        else
            AorP = "AM";

        if (nhours >= 13)
            nhours -= 12;

        if (nhours == 0)
            nhours = 12;

        if (nsecn < 10)
            nsecn = "0" + nsecn;

        if (nmins < 10)
            nmins = "0" + nmins;

        if (nday == 0)
            nday = "Sunday";
        if (nday == 1)
            nday = "Monday";
        if (nday == 2)
            nday = "Tuesday";
        if (nday == 3)
            nday = "Wednesday";
        if (nday == 4)
            nday = "Thursday";
        if (nday == 5)
            nday = "Friday";
        if (nday == 6)
            nday = "Saturday";

        nmonth += 1;

        if (nyear <= 99)
            nyear = "19" + nyear;

        if ((nyear > 99) && (nyear < 2000))
            nyear += 1900;
        var monthnameShort = new Array("", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
        var monthnameFull = new Array("", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");

        document.getElementById('clock').innerHTML = "" + nday + ", " + monthnameFull[nmonth] + " " + ntoday + ", " + nyear + "  &nbsp;" + nhours + ": " + nmins + " " + AorP + "";

        setTimeout('startclock()', 1000);

    }

    function resetPhotoHome(iHeightMax, iWidthMax, imgId) {

        var iHeight;
        var iWidth;

        iHeight = document.getElementById(imgId).height;
        iWidth = document.getElementById(imgId).width;
        if (iHeight > iHeightMax) {
            document.getElementById(imgId).height = iHeightMax;
        }
    }
    //-->

</script>




<header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      
      <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><img src="images/userSoumya.png" alt="image">
		<h2>Admin Console<small>Spring Boot Framework</small></h2>
		</span>
		
		
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
           
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="images/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="images/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        AdminLTE Design Team
                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="images/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Developers
                        <small><i class="fa fa-clock-o"></i> Today</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="images/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Sales Department
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="images/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Reviewers
                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                      page and may cause design problems
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-red"></i> 5 new members joined
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> You changed your username
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
           
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Create a nice theme
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Some task I need to do
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Make beautiful transitions
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
              <i class="fa fa-cog"></i>
             
            </a>
             <ul class="dropdown-menu dropdown-user" role="menu" aria-labelledby="dLabel">
              <li><a href="#" data-toggle="modal" data-target="#proModal"><i class="fa fa-user-o"></i>Profile</a></li> <!-- userProfile -->
              <li><a href="logout"><i class="fa fa-sign-out"></i>Log Out</a></li>
              
            </ul>
          </li>
          
        </ul>
      </div>
    <div class="usrinfo pull-right">
		<h3>Welcome! <b>John</b></h3>
		<p><b>Last Logged On</b> 09-May-2018 10:19 AM</p>
		</div>
	</nav>
  </header>

<!-- Modal -->
<div id="proModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
     
      <div class="modal-body">
        

          <!-- Horizontal Form -->
          
			<div class="box-header">
			<button type="button" class="btn btn-sm btn-danger pull-right" data-dismiss="modal"><i class="fa fa-close"></i></button>
				<h3 class="heading3 pull-left">Change Account Details</h3>
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
			  </div>
			  <div class="col-sm-12">
				 <a id="sa-success" data-toggle="modal" data-target="#passModal" class="btn btn-info pull-right" data-dismiss="modal">Change</a>
			  </div>
              </div>
              </div>
			  
  
            </form>
       
          <!-- /.box -->
          


      </div>
      
    </div>

  </div>
</div>


<style type="text/css">
.usrinfo {
    padding: 6px 20px;
    background: rgba(51, 128, 173, 0.8);
	position:relative;
}

.usrinfo h3{color:#fff;font-family: Dosis; z-index:2}
.usrinfo p{color:#FFEB3B; margin:0;  letter-spacing:1px; z-index:2}
.usrinfo p b{font-weight:normal;color:#FFEB3B; margin:0; letter-spacing:0px;}
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
 $('#sa-success').click(function(){
	 
        swal("Profile Updated Successfully", "", "success")
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
