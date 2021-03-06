﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard-receptionist-makeAppointment.aspx.cs" Inherits="WebApplication1.dashboard_receptionist_makeAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
     <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Book Appointment</title>
<link rel="stylesheet" href="css/normalize.css"/>
<link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="index.css" />
    <link rel="stylesheet" href="css/form.css" />
    <style>
        body{
            background-color:#eee;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
              <div class="main-background-login" style="background-image: url('images/overlay.png'), url('images/r-dashboard.jpg');">
        <h1>
            Book Appointment
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
                                <li><a href="dashboard-receptionist-appointmentSchedule.aspx"><i class="menu-icon icon-paste"></i>Appointment Schedule </a></li>
                                <li><a href="add_user.aspx"><i class="menu-icon icon-paste"></i>Add User</a></li>
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
      
        <h1>Book Appointment</h1>
        <asp:Label ID="lbl_warning" runat="server" ForeColor="Red" Width="100%" BackColor="YellowGreen" Height="50px"></asp:Label>
        <fieldset>
          <legend><span class="number">1</span>Your Info</legend>
          <label for="name">Appointment ID:</label>
          <input type="text" id="Appointment" name="Appointment" readonly="true" style="opacity:.5;" runat="server" />

          <label for="patient">Patient ID*:
              <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
  ControlToValidate="pat_id"
  ErrorMessage="Patient Id is a required field."
  ForeColor="Red" ValidationGroup="req"></asp:RequiredFieldValidator>
          </label>
          <input type="text" id="pat_id" name="pat_id"  runat="server" />
                      
          <label for="doctor">Dentist Name*:
               <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
  ControlToValidate="doctor"
  ErrorMessage="Doctor is a required field."
  ForeColor="Red" ValidationGroup="req"></asp:RequiredFieldValidator>
          </label>
          <select id="doctor" name="doctor" runat="server">
        </select>

        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Appointment Info</legend>
          <label for="date">Appointment Date*:
              <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
  ControlToValidate="date"
  ErrorMessage="Date is a required field."
  ForeColor="Red" ValidationGroup="req"></asp:RequiredFieldValidator>
          </label>
          <input type="date" id="date" name="appointment_date" runat="server"/>
          <label for="time">Appointment Time*:
                            <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
  ControlToValidate="time"
  ErrorMessage="Date is a required field."
  ForeColor="Red" ValidationGroup="req"></asp:RequiredFieldValidator>
          </label>
          <input type="time" id="time" name="appointment_time" runat="server" min="09:00" max="17:00"/>
          <label for="bio">Message:</label>
          <textarea id="message" name="message" runat="server"></textarea>
        </fieldset>

        <button type="submit" class="button button-block" runat="server" id="button2" onserverclick="Buttonbook_Click_book" validationgroup="req">Make Appointment</button>
     
</div>
                                                    

				</form>		
						
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
