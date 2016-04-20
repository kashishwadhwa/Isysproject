<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard-user_profile.aspx.cs" Inherits="WebApplication1.dashboard_user_profile" %>
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
    <link rel="stylesheet" href="index.css" />
    <link rel="stylesheet" href="css/form.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
              <div class="main-background-login">
        <h1>
            My Profile
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
							<li class="active">
								<a href="index.html">
									<i class="menu-icon icon-dashboard"></i>
									Dashboard
								</a>
							</li>
							<li>
								<a href="activity.html">
									<i class="menu-icon icon-bullhorn"></i>
									News Feed
								</a>
							</li>
							<li>
								<a href="message.html">
									<i class="menu-icon icon-inbox"></i>
									Inbox
									<b class="label green pull-right">11</b>
								</a>
							</li>
							
							<li>
								<a href="task.html">
									<i class="menu-icon icon-tasks"></i>
									Tasks
									<b class="label orange pull-right">19</b>
								</a>
							</li>
						</ul><!--/.widget-nav-->

						<ul class="widget widget-menu unstyled">
                                <li><a href="ui-button-icon.html"><i class="menu-icon icon-bold"></i> Buttons </a></li>
                                <li><a href="ui-typography.html"><i class="menu-icon icon-book"></i>Typography </a></li>
                                <li><a href="form.html"><i class="menu-icon icon-paste"></i>Forms </a></li>
                                <li><a href="table.html"><i class="menu-icon icon-table"></i>Tables </a></li>
                                <li><a href="charts.html"><i class="menu-icon icon-bar-chart"></i>Charts </a></li>
                            </ul><!--/.widget-nav-->

						<ul class="widget widget-menu unstyled">
							<li>
								<a class="collapsed" data-toggle="collapse" href="#togglePages">
									<i class="menu-icon icon-cog"></i>
									<i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
									More Pages
								</a>
								<ul id="togglePages" class="collapse unstyled">
									<li>
										<a href="other-login.html">
											<i class="icon-inbox"></i>
											Login
										</a>
									</li>
									<li>
										<a href="other-user-profile.html">
											<i class="icon-inbox"></i>
											Profile
										</a>
									</li>
									<li>
										<a href="other-user-listing.html">
											<i class="icon-inbox"></i>
											All Users
										</a>
									</li>
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
      
        <h1>My Profile</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Your Info</legend>
          <%--<label id="appointmentId" runat="server" for="name"></label>--%>
            <table id="table_user_profile_table" cellpadding="12">
                
           <tr>
               <td>
                 <asp:label runat="server"><b>Patient ID: </b></asp:label>  <asp:Label runat="server" ID="patientId" ></asp:Label>
               </td>
               <td class="id2">
                   <asp:label runat="server"><b>   Account ID: </b></asp:label><asp:Label runat="server" ID="accountId" ></asp:Label>
               </td>
           </tr> 
                <tr>
               <td>
                  <asp:label runat="server"><b>First Name: </b></asp:label> <asp:Label runat="server" ID="fname" ></asp:Label>
               </td>
               <td class="id2">
                   <asp:label runat="server"><b>   Middle Name: </b></asp:label><asp:Label runat="server" ID="mname" ></asp:Label>
               </td>
           </tr>
                <tr>
               <td>
                   <asp:label runat="server"><b>Last Name: </b></asp:label><asp:Label runat="server" ID="lname" ></asp:Label>
               </td>
               <td class="id2">

               </td>
           </tr>
                <tr>
               <td>
                   <asp:label runat="server"><b>Phone: </b></asp:label> <asp:Label runat="server" ID="ph" ></asp:Label>
               </td>
               <td class="id2">
                  <asp:label runat="server"><b>   DOB: </b></asp:label> <asp:Label runat="server" ID="dob" ></asp:Label>
               </td>
           </tr>
                <tr>
               <td>
                  <asp:label runat="server"><b>Street: </b></asp:label> <asp:Label runat="server" ID="street" ></asp:Label>
               </td>
               <td class="id2">
                  <asp:label runat="server"><b>   City: </b></asp:label> <asp:Label runat="server" ID="city" ></asp:Label>
               </td>
           </tr>
                <tr>
               <td>
                  <asp:label runat="server"><b>State: </b></asp:label> <asp:Label runat="server" ID="state" ></asp:Label>
               </td>
               <td class="id2">
                  <asp:label runat="server"><b>   Zip: </b></asp:label> <asp:Label runat="server" ID="zip" ></asp:Label>
               </td>
           </tr>
          </table>
          

        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Allergies</legend>
          <asp:Label runat="server" ID="allergies" ></asp:Label><br /><br />
        </fieldset>
          
         <fieldset>
          <legend><span class="number">3</span>Settings</legend>
         <asp:label runat="server"><b>Username: </b></asp:label><asp:Label runat="server" ID="username" ></asp:Label><br /><br /> 
         <asp:label runat="server"><b>Password: </b></asp:label><asp:Label runat="server" ID="password" >************</asp:Label><br /> <br />
        <asp:label runat="server"><b>SSN: </b></asp:label><asp:Label runat="server" ID="ssn" ></asp:Label><br /> <br />
        </fieldset>

        <button type="submit" class="button button-block" runat="server" id="button2" onserverclick="Button_edit_profile">Edit</button>
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

