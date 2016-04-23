<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add_user.aspx.cs" Inherits="WebApplication1.add_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
     <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Add user</title>
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
            Add User
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

                <asp:Label runat="server" ID="lbl_invalidId" forecolor="Red"></asp:Label>
				<div class="span9">
					<div class="content">
                        <div class="module">
						 <form action="#" method="post" class="form-reg" runat="server">
      
        <h1>Add User</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Your Info</legend>
          <%--<label id="appointmentId" runat="server" for="name"></label>--%>

            
            <table id="table_user_profile_table" cellpadding="8">
                
           <tr>
               <td>
                 <asp:label runat="server"><b>Patient ID: </b></asp:label><asp:TextBox runat="server" ReadOnly="true" ID="patientId1"> </asp:TextBox>
               </td>
               <td class="id2">
                   <asp:label runat="server"><b>Account ID*: </b></asp:label><asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
  ControlToValidate="accountId"  ErrorMessage="Required"  ForeColor="Red" ValidationGroup="req_reg"></asp:RequiredFieldValidator><asp:Textbox runat="server" ID="accountId" ></asp:Textbox> 
               </td>
           </tr> 
                <tr>
               <td>
                  <asp:label runat="server"><b>First Name*: </b></asp:label><asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
  ControlToValidate="fname"  ErrorMessage="Required"  ForeColor="Red" ValidationGroup="req_reg"></asp:RequiredFieldValidator> <asp:Textbox runat="server" ID="fname" ></asp:Textbox> 
               </td>
               <td class="id2">
                   <asp:label runat="server"><b>   Middle Name: </b></asp:label><asp:Textbox runat="server" ID="mname" ></asp:Textbox>
               </td>
           </tr>
                <tr>
               <td>
                   <asp:label runat="server"><b>Last Name: </b></asp:label><asp:Textbox runat="server" ID="lname" ></asp:Textbox>
               </td>
               <td class="id2">

               </td>
           </tr>
                <tr>
               <td>
                   <asp:label runat="server"><b>Phone: </b></asp:label> <asp:Textbox runat="server" ID="ph" ></asp:Textbox>
               </td>
               <td class="id2">
                  <asp:label runat="server"><b>   DOB: </b></asp:label> <asp:Textbox runat="server" ID="dob" ></asp:Textbox>
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
         <asp:label runat="server"><b>Username*: </b></asp:label><asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
  ControlToValidate="username" ErrorMessage="Email is a required field." ForeColor="Red" ValidationGroup="req_reg"></asp:RequiredFieldValidator><asp:Textbox runat="server" ID="username" ></asp:Textbox>
         <asp:label runat="server"><b>Password*: </b></asp:label><asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
  ControlToValidate="password" ErrorMessage="Password is a required field." ForeColor="Red" ValidationGroup="req_reg"></asp:RequiredFieldValidator><asp:Textbox runat="server" ID="password" ></asp:Textbox>
        <asp:label runat="server"><b>SSN: </b></asp:label><asp:TextBox runat="server" ID="ssn"></asp:TextBox>
        </fieldset>

        <button type="submit" class="button button-block" runat="server" id="button2" onserverclick="Button_add_user" validationgroup="req_reg">Add User</button>
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
