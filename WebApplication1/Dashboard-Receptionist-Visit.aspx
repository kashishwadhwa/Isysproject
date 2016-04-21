<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard-Receptionist-Visit.aspx.cs" Inherits="WebApplication1.Dashboard_Receptionist_Visit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
     <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Add Visit</title>
<link rel="stylesheet" href="css/normalize.css"/>
<link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/theme.css" />    
    <link rel="stylesheet" href="index.css" />
     <link rel="stylesheet" href="css/form.css" />
    <style>
        body{
            background-color:#eee;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
              <div class="main-background-login">
        <h1>
            Add Visit
        </h1>
		</div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard">
                <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                
            </div>
            <!-- /navbar-inner -->
        </div>

	<div class="wrapper" style="padding-top:20px;">
		<div class="container" >
			<div class="row">
				<div class="span3">
                        <div class="sidebar">
                            <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="dashboard.aspx"><i class="menu-icon icon-dashboard"></i>Dashboard
                                </a></li>
                                <li><a href="dashboard-receptionist-makeAppointment.aspx"><i class="menu-icon icon-bullhorn"></i>Make Appointment </a>
                                </li>
                                <li><a href="Dashboard-Receptionist-Visit.aspx"><i class="menu-icon icon-inbox"></i>Add Visit </a></li>
                                
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a href="dashboard-receptionist-doctors.aspx"><i class="menu-icon icon-book"></i>Doctors </a></li>
                                <li><a href="dashboard-receptionist-patients.aspx"><i class="menu-icon icon-paste"></i>Patients </a></li>
                                <li><a href="dashboard-receptionist-appointmentSchedule.aspx"><i class="menu-icon icon-paste"></i>Appointment History </a></li>
                                <li><a href="form.html"><i class="menu-icon icon-paste"></i>Add User</a></li>
                                    <%--APPOINTMENTS WITH BILLS dr.name pat name appt. date/time services amount--%> 
                                    
                            </ul>
                            <!--/.widget-nav-->
                            <ul class="widget widget-menu unstyled">
  <%--                              <li><a class="collapsed" data-toggle="collapse" href="#togglePages"><i class="menu-icon icon-cog">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>More Pages </a>
                                    <ul id="togglePages" class="collapse unstyled">
                                        <li><a href="other-login.html"><i class="icon-inbox"></i>Login </a></li>
                                        <li><a href="other-user-profile.html"><i class="icon-inbox"></i>Profile </a></li>
                                        <li><a href="other-user-listing.html"><i class="icon-inbox"></i>All Users </a></li>
                                    </ul>
                                </li>--%>
                                <li><a id="linkLogout" runat="server"><i class="menu-icon icon-signout"></i>Logout </a></li>
                            </ul>
                        </div>
                    <!--/.sidebar-->
				</div><!--/.span3-->


				<div class="span9">
					<div class="content">
                        <div class="module">
						 <form action="#" method="post" class="form-reg" runat="server">
      
        <h1>Add Visit</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Your Info</legend>
          <label for="name">Visit ID:</label>
          <input type="text" id="Visit" name="Appointment" readonly="true" style="opacity:.5;" runat="server" />

          <label for="email">Email ID:</label>
          <input type="email" id="emailId" name="email" runat="server" />
   
                      
          <label for="doctor">Doctor Name:</label>
          <select id="doctor" name="doctor" runat="server">
        </select>

        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Appointment Info</legend>
          <label for="date">Visit Date:</label>
          <input type="date" id="date" name="visit_date" runat="server"/>
          <label for="time">Visit Time:</label>
          <input type="time" id="time" name="visit_time" runat="server"/>
          <label for="bio">Message:</label>
          <textarea id="message" name="message" runat="server"></textarea>
        </fieldset>

        <button type="submit" class="button button-block" runat="server" id="button2" onserverclick="Buttonbook_Click_book">Add Visit</button>
     
</div>
                                                    <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Today's Appointments</h3>
                                </div>
                                <div class="module-body table">
                                    
    

  
    <asp:GridView ID="GridView1" CssClass="footable" OnPageIndexChanging="GridView1_PageIndexChanging" runat="server" AutoGenerateColumns="false"
         AllowPaging="True" PagerSettings-Mode="NumericFirstLast" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="appointment_id" HeaderText="Appointment ID" />
            <asp:BoundField DataField="Patient Name" HeaderText="Patient Name" />

            <asp:BoundField DataField="Dentist Name" HeaderText="Dentist Name" />

            <asp:BoundField DataField="appointment_date" HeaderText="Appointment Date" />
            <asp:BoundField DataField="appointment_time" HeaderText="Appointment Time" />
        </Columns>
        <EmptyDataTemplate>

<div>

No Upcoming Appointments

</div>

</EmptyDataTemplate>

        <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
    </asp:GridView>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        var jQuery_1_8_3 = $.noConflict(true);
        jQuery_1_8_3(function () {
            jQuery_1_8_3('[id*=GridView1]').footable();
        });
    </script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
  <script src="js/chosen.jquery.js" type="text/javascript"></script>
  <script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
      var jQuery_1_6_4 = $.noConflict(true);
    var config = {
      '.chosen-select'           : {},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
        jQuery_1_6_4(selector).chosen(config[selector]);
    }
  </script>

</form>
   
      
           
                                </div>
                            </div>

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->
        </div>
	



	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>

</asp:Content>

