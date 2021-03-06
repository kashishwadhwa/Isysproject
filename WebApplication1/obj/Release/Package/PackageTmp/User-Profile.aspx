﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User-Profile.aspx.cs" Inherits="WebApplication1.User_Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
     <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>User profile</title>
<link rel="stylesheet" href="css/normalize.css"/>
<link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" href="css/main.css"/>
    
    <link rel="stylesheet" href="css/form.css" />
    <link rel="stylesheet" href="index.css" />
     <style>
        body{
            background-color:#eee;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
                 <div class="main-background-login">
        <h1>
            Edit Profile
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
                        </div><!--/.sidebar-->
				</div><!--/.span3-->


				<div class="span9">
					<div class="content">
                        <div class="module">
						 <form action="#" method="post" class="form-reg" runat="server">
      
        <h1>Edit Profile</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Your Info</legend>
          <%--<label id="appointmentId" runat="server" for="name"></label>--%>
            <table id="table_user_profile_table" cellpadding="8">
                
           <tr>
               <td>
                 <asp:label runat="server"><b>Patient ID: </b></asp:label> <asp:TextBox runat="server" ID="patientId" ReadOnly="true"></asp:TextBox>
               </td>
               <td class="id2">
                   <asp:label runat="server"><b>   Account ID: </b></asp:label><asp:TextBox runat="server" ReadOnly="true" ID="accountId"></asp:TextBox>
               </td>
           </tr> 
                <tr>
               <td>
                  <asp:label runat="server"><b>First Name*: </b></asp:label> <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
  ControlToValidate="fname"  ErrorMessage="Required"  ForeColor="Red" ValidationGroup="req_reg"></asp:RequiredFieldValidator><asp:Textbox runat="server" ID="fname" ></asp:Textbox>
               </td>
               <td class="id2">
                   <asp:label runat="server"><b>   Middle Name: </b></asp:label><asp:Textbox runat="server" ID="mname" ></asp:Textbox>
               </td>
           </tr>
                <tr>
               <td>
                   <asp:label runat="server"><b>Last Name*: </b></asp:label><asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
  ControlToValidate="lname"  ErrorMessage="Required"  ForeColor="Red" ValidationGroup="req_reg"></asp:RequiredFieldValidator><asp:Textbox runat="server" ID="lname" ></asp:Textbox>
               </td>
               <td class="id2">

               </td>
           </tr>
                <tr>
               <td>
                   <asp:label runat="server"><b>Phone: </b></asp:label> <asp:Textbox runat="server" ID="ph" ></asp:Textbox>
               </td>
               <td class="id2">
                  <asp:label runat="server"><b>   DOB: </b></asp:label> <input type="date"  runat="server" id="dob1" />
               </td>
           </tr>
                <tr>
               <td>
                  <asp:label runat="server"><b>Street: </b></asp:label> <asp:Textbox runat="server" ID="street" ></asp:Textbox>
               </td>
               <td class="id2">
                  <asp:label runat="server"><b>   City: </b></asp:label> <asp:Textbox runat="server" ID="city" ></asp:Textbox>
               </td>
           </tr>
                <tr>
               <td>
                  <asp:label runat="server"><b>State: </b></asp:label> <asp:Textbox runat="server" ID="state" ></asp:Textbox>
               </td>
               <td class="id2">
                  <asp:label runat="server"><b>   Zip: </b></asp:label> <asp:Textbox runat="server" ID="zip" ></asp:Textbox>
               </td>
           </tr>
          </table>
          

        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Allergies</legend>
          <asp:Textbox runat="server" ID="allergies" ></asp:Textbox><br /><br />
        </fieldset>
          
         <fieldset>
          <legend><span class="number">3</span>Settings</legend>
         <asp:label runat="server"><b>Username: </b></asp:label><asp:TextBox runat="server" ID="username" ReadOnly="true" ></asp:TextBox> 
         <asp:label runat="server"><b>Password*: </b></asp:label><asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
  ControlToValidate="password"  ErrorMessage="Required"  ForeColor="Red" ValidationGroup="req_reg"></asp:RequiredFieldValidator><asp:TextBox runat="server" ID="password" ></asp:TextBox>
        <asp:label runat="server"><b>SSN: </b></asp:label><asp:TextBox runat="server" ID="ssn"></asp:TextBox><br /> <br />
        </fieldset>

        <button type="submit" class="button button-block" runat="server" id="button2" onserverclick="Button_edit_profile" validationgroup="req_reg">Submit</button>
                             </form>
     
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
