<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard-receptionist-patients.aspx.cs" Inherits="WebApplication1.dashboard_receptionist_patients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Patient Profiles</title>
        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
    <link rel="stylesheet" href="index.css" />
        <style>
        body{
            background-color:#eee;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
          <div class="main-background-login" style="background-image: url('images/overlay.png'), url('images/p-dash2.jpg');">
        <h1>
            Patient Profiles
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
                    </div>
                    <!--/.span3-->	
                    <div class="span9">
                        <div class="content">
                  
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Patient Profiles</h3>
                                </div>
                                <div class="module-body table">
                                    
    

    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" CssClass="footable" OnPageIndexChanging="GridView1_PageIndexChanging" runat="server" AutoGenerateColumns="false"
         AllowPaging="True" PagerSettings-Mode="NumericFirstLast">
        <Columns>
            <asp:HyperLinkField 
     DataTextField="patient_id" 
     HeaderText="Patient Id" 
     DataNavigateUrlFields="patient_id" 
     DataNavigateUrlFormatString="receptionist-edit-patient.aspx?patient_id={0}" />
            <asp:BoundField DataField="Patient_Name" HeaderText="Patient Name" />
            <asp:BoundField DataField="patient_phone_primary" HeaderText="Phone" />
            <asp:BoundField DataField="dob" HeaderText="DoB" />
        </Columns>

        <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
    </asp:GridView>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
                $('[id*=GridView1]').footable();
        });
    </script>
</form>
   
      
           
                                </div>
                            </div>
                            <!--/.module-->
                        </div>
                        <!--/.content-->
                    </div>
                    <!--/.span9-->
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

