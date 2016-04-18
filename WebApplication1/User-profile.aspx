<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User-profile.aspx.cs" Inherits="WebApplication1.User_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
     <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Sign Up Form</title>
<link rel="stylesheet" href="css/normalize.css"/>
<link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="index.css" />
    <link rel="stylesheet" href="css/form.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
              <div class="main-background-login">
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
							
							<li>
								<a href="#">
									<i class="menu-icon icon-signout"></i>
									Logout
								</a>
							</li>
						</ul>

					</div><!--/.sidebar-->
				</div><!--/.span3-->


				<div class="span9">
					<div class="content">
                        <div class="module">
						 <form action="#" method="post" class="form-reg" runat="server">
      
        <h1>Book Appointment</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Your Info</legend>
          <label for="name">Appointment ID:</label>
          <input type="text" id="Appointment" name="Appointment" readonly="true" style="opacity:.5;" runat="server" />

          <label for="patient">Patient Name:</label>
          <select id="patient" name="patient" runat="server">
        </select>
                      
          <label for="doctor">Doctor Name:</label>
          <select id="doctor" name="doctor" runat="server">
        </select>

        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Appointment Info</legend>
          <label for="date">Appointment Date:</label>
          <input type="date" id="date" name="appointment_date" runat="server"/>
          <label for="time">Appointment Time:</label>
          <input type="time" id="time" name="appointment_time" runat="server"/>
          <label for="bio">Message:</label>
          <textarea id="message" name="message" runat="server"></textarea>
        </fieldset>

        <button type="submit" class="button button-block" runat="server" id="button2" onserverclick="Buttonbook_Click_book">Sign Up</button>
     
</div>
                                                    <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Booked Appointments</h3>
                                </div>
                                <div class="module-body table">
                                    
    

  
    <asp:GridView ID="GridView1" CssClass="footable" OnPageIndexChanging="GridView1_PageIndexChanging" runat="server" AutoGenerateColumns="false"
         AllowPaging="True" PagerSettings-Mode="NumericFirstLast">
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
        $(function () {
                $('[id*=GridView1]').footable();
        });
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
