<!-- Powered By CSM Technology -->
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="styles/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="styles/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="styles/ionicons.min.css">
   <!-- Sweet Alert -->
  <link rel="stylesheet" href="styles/sweetalert.css">
   <!-- Sweet Alert -->
  <link rel="stylesheet" href="styles/icomoon.css">
  
  <link rel="stylesheet" href="styles/skins/_all-skins.min.css">
  
  <!-- Date Picker -->
  <link rel="stylesheet" href="styles/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="styles/daterangepicker.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="styles/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="styles/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="styles/bootstrap-timepicker.min.css">
  
  <!-- Select 2 -->
  <link rel="stylesheet" href="styles/select2.min.css">
  
  <!-- Select 2 -->
  <link rel="stylesheet" href="styles/floatchat.css">

  
  <!-- Theme style -->
  <link rel="stylesheet" href="styles/AdminLTE.min.css">
  <!-- Custom Css -->

  <link rel="stylesheet" href="styles/custom.css">
  <link rel="stylesheet" href="styles/new.css">
  <link rel="stylesheet" href="styles/auction.css">
  <link rel="stylesheet" href="styles/mk-notifications.css">
  
  
	<!-- jQuery 3 -->
<script src="scripts/jquery.min.js"></script>
<script src="scripts/mk-notifications.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="scripts/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>

	<!-- jQuery upload Preview -->
<script src="scripts/jquery.uploadPreview.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/select2.full.min.js"></script>
<!-- Sweet Alert Js -->
<script src="scripts/sweetalert.min.js"></script>
<!-- Sweet Alert Js -->
<script src="scripts/diff_match_patch.js"></script>
<!-- Jquery Print-->
<script src="scripts/jQuery.print.js"></script>
<!-- Jquery Print-->
<script src="scripts/responsivevoice.js"></script>

<!-- daterangepicker -->
<script src="scripts/moment.min.js"></script>
<script src="scripts/daterangepicker.js"></script>
<!-- datepicker -->
<script src="scripts/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="scripts/bootstrap-colorpicker.min.js"></script>

<!-- bootstrap time picker -->
<script src="scripts/bootstrap-timepicker.min.js"></script>
<!-- Slimscroll -->
<script src="scripts/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="scripts/icheck.min.js"></script>

<!-- Session  -->
<script src="scripts/jquery.session.js"></script>


<!-- High Chart -->
<script src="scripts/highcharts.js"></script>
<script src="scripts/highcharts3d.js"></script>
<script src="scripts/data.js"></script>
<script src="scripts/drilldown.js"></script>
<script src="scripts/exporting.js"></script>
<script src="scripts/export-data.js"></script>
<script src="scripts/common.js"></script>



<!-- AdminLTE App -->
<script src="scripts/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="scripts/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="scripts/demo.js"></script>

<!-- Custom Js -->
<script src="scripts/custom.js"></script>
 <script src="wrsis/js/common.js"></script> 
 
<script src="scripts/validator.js"></script>
</head>
 
 <body class="hold-transition skin-blue sidebar-mini "><!-- sidebar-collapse -->
<div class="wrapper">

  <!--Header -->
  <tiles:insertAttribute name="header"></tiles:insertAttribute>
  
  <!--Left Menu -->
  <tiles:insertAttribute name="menu"></tiles:insertAttribute>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    <a href="#" class="menucontrol sidebar-toggle pull-left" data-toggle="push-menu" role="button">
        	<i class="fa fa-bars"></i>
      	</a>
      <h1>
        <tiles:insertAttribute name="pageTitle"></tiles:insertAttribute>
        
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> <tiles:insertAttribute name="pnav"/></a></li>
        <li class="active"><tiles:insertAttribute name="snav"/></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     <tiles:insertAttribute name="body"></tiles:insertAttribute>
    </section>
    <!-- /.content -->
	
  </div>
  <!-- /.content-wrapper End -->
  
  
  
  <!--Footer -->
<tiles:insertAttribute name="footer"></tiles:insertAttribute>
  
  
  
  
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


</body>

</html>
