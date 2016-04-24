<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard-doctor-prescription.aspx.cs" Inherits="WebApplication1.Dashboard_doctor_prescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
                  <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
     <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>New Prescription</title>
<link rel="stylesheet" href="css/normalize.css"/>
<link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'/>
<link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/form.css" />
    <link rel="stylesheet" href="css/chosen.css">
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
            New Prescription
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
                                <li class="active"><a href="dashboard-doctor.aspx"><i class="menu-icon icon-dashboard"></i>Dashboard
                                </a></li>
                                <li><a href="dashboard-doctor-patient.aspx"><i class="menu-icon icon-bullhorn"></i>Patients </a>
                                </li>
                                <li><a href="dashboard-doctor-appointments.aspx"><i class="menu-icon icon-inbox"></i>Appointments  </a></li>
                                <li><a href="Dashboard-doctor-prescription.aspx"><i class="menu-icon icon-tasks"></i>New Prescription </a></li>
                            </ul>
                            <!--/.widget-nav-->
                            
                            
                            <ul class="widget widget-menu unstyled">
                                <li><a id="linkLogout" runat="server"><i class="menu-icon icon-signout"></i>Logout </a></li>
                            </ul>
                        </div>
                        <!--/.sidebar-->
				</div><!--/.span3-->


				<div class="span9">
					<div class="content">
                        <div class="module">
						 <form method="post" class="form-reg" runat="server">
      
        <h1>New Prescription</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Visit Info</legend>
          <label for="name">Visit ID*:
              <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
  ControlToValidate="Visit"
  ErrorMessage="Visit Id is a required field."
  ForeColor="Red" ValidationGroup="req_form"></asp:RequiredFieldValidator>
          </label>
          <input type="text" id="Visit" name="Appointment" runat="server" />
            <asp:Label runat="server" ID="lbl_visitId_validate" ForeColor="Red" ></asp:Label>
   


        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Service Info</legend>
                      
          <label for="doctor">Service Provided*:
                            <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
  ControlToValidate="service_list"
  ErrorMessage="Service Provided is a required field."
  ForeColor="Red" ValidationGroup="req_form"></asp:RequiredFieldValidator>
          </label>
          <select data-placeholder="Choose a Service..." class="chosen-select" multiple id="service_list" runat="server">
          </select>
        </fieldset>

        <button type="submit" class="button button-block" runat="server" id="button2"  onserverclick="Buttonbook_Click_visit" validationgroup="req_form">Add Service</button>
      
</div>		
                         <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Upcoming Visits</h3>
                                </div>
                                <div class="module-body table">
                                    
    

  
    <asp:GridView ID="GridView1" CssClass="footable" OnPageIndexChanging="GridView1_PageIndexChanging" runat="server" AutoGenerateColumns="false"
         AllowPaging="True" PagerSettings-Mode="NumericFirstLast">
        <Columns>
            <asp:BoundField DataField="visit_id" HeaderText="Visit Id" />
              <asp:BoundField DataField="patient_name" HeaderText="Patient Name" />
          
            <asp:BoundField DataField="visit_date" HeaderText="Visit_date" />

        </Columns>

                <EmptyDataTemplate>

<div>

No Upcoming Visits

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
  
		
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
  <script src="js/chosen.jquery.js" type="text/javascript"></script>
  <script src="js/prism.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    var config = {
      '.chosen-select'           : {},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"50%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
  </script>
	
</asp:Content>
