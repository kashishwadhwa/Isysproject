<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard-patient-editAppointment.aspx.cs" Inherits="WebApplication1.dashboard_patient_editAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
                <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
     <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Edit Appointment</title>
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
      <div class="main-background-login">
        <h1>
            Edit Appointment
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
        <!-- /navbar -->
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <div class="sidebar">
                            <ul class="widget widget-menu unstyled">
                                <li class="active"><a href="dashboard-patient.aspx"><i class="menu-icon icon-dashboard"></i>Dashboard
                                </a></li>
                                <li><a href="Book-Appointment.aspx"><i class="menu-icon icon-bullhorn"></i>Appointments </a>
                                </li>
                                <li><a href="dashboard-billing.aspx"><i class="menu-icon icon-inbox"></i>Billing </a></li>
                                <li><a href="dashboard-user_profile.aspx"><i class="menu-icon icon-tasks"></i>Profile </a></li>
                            </ul>
                            <!--/.widget-nav-->
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages"><i class="menu-icon icon-cog">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>Settings </a>
                                    <ul id="togglePages" class="collapse unstyled">
                                        
                                        <li><a href="User-Profile.aspx"><i class="icon-inbox"></i>Edit Profile </a></li>
                                        <li><a href="dashboard-patient-myfamily.aspx"><i class="icon-inbox"></i>My Family</a></li>
                                    </ul>
                                </li>
                                <li><a id="linkLogout" runat="server"><i class="menu-icon icon-signout"></i>Logout </a></li>
                            </ul>
                        </div>
                        <!--/.sidebar-->
                    </div>
                    <!--/.span3-->	
                   <div class="span9">
					<div class="content">
                        <div class="module">
						 <form action="#" method="post" class="form-reg" runat="server">
      
        <h1>Edit Appointment</h1>
        <asp:Label ID="lbl_warning" runat="server" ForeColor="Red" Width="100%" Height="50px"></asp:Label>
        <fieldset>
          <legend><span class="number">1</span>Your Info</legend>
          <label for="name">Appointment ID:</label>
          <input type="text" id="Appointment" name="Appointment" readonly="true" style="opacity:.5;" runat="server" />

          <label for="patient">Patient ID*:
                <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
  ControlToValidate="pat_id"
  ErrorMessage="Patient Id is a required field."
  ForeColor="Red" ValidationGroup="req"></asp:RequiredFieldValidator>
          </label>
          <input type="text" id="pat_id" name="pat_id"  runat="server" />
                      
          <label for="doctor">Dentist ID*:
                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
  ControlToValidate="txt_dentist_id"
  ErrorMessage="Dentist Id is a required field."
  ForeColor="Red" ValidationGroup="req"></asp:RequiredFieldValidator>
          </label>
          <input type="text" id="txt_dentist_id" name="dentist_id"  runat="server" />

        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Appointment Info</legend>
          <label for="date">Appointment Date*:
                <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
  ControlToValidate="txt_date"
  ErrorMessage="Date is a required field."
  ForeColor="Red" ValidationGroup="req"></asp:RequiredFieldValidator>
          </label>
          <input type="date" id="txt_date" name="appointment_date" runat="server"/>
          <label for="time">Appointment Time*:
                <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
  ControlToValidate="txt_time"
  ErrorMessage="Time is a required field."
  ForeColor="Red" ValidationGroup="req"></asp:RequiredFieldValidator>
          </label>
          <input type="time" id="txt_time" name="appointment_time" runat="server" min="09:00" max="17:00"/>
          <label for="bio">Message:</label>
          <textarea id="message" name="message" runat="server"></textarea>
        </fieldset>

        <button type="submit" class="button button-block" runat="server" id="button2" onserverclick="Buttonbook_Click_book" validationgroup="req">Update Appointment</button>
        <button type="submit" class="button button-block" runat="server" id="button1" onserverclick="Buttonbook_Click_delete" style="background-color:#ff3232">Delete Appointment</button>
</div>
                                                    

				</form>		
						
					</div><!--/.content-->
				</div><!--/.span9-->
                </div>
            </div>
            <!--/.container-->
        </div>
        <!--/.wrapper-->
        </div>
     <%--<script src="dashboard_scripts/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
        <script src="dashboard_scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="dashboard_scripts/flot/jquery.flot.js" type="text/javascript"></script>
        <script src="dashboard_scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
        <script src="dashboard_scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="dashboard_scripts/common.js" type="text/javascript"></script>
</asp:Content>



