<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard-patient.aspx.cs" Inherits="WebApplication1.dashboard_patient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Dashboard</title>
        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link type="text/css" href="css/theme.css" rel="stylesheet" />
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet" />
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet' />
    <link rel="stylesheet" href="index.css" />
 <style>
     .media_responsive
    {
        display: none;
        }
        body{
            background-color:#eee;
        }

        canvas{
            width:100% !important;
            height:auto !important;
        }
                .module-body table{
            overflow:hidden;
        }

        @media screen and (max-width: 425px) {
    .media_responsive
    {
        display: block;
        float:none;

    }
    .span3{
        display:none;
    }
    .chart{
        display:none;
    }



}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
          <div class="main-background-login" style="background-image: url('images/overlay.png'), url('images/p-dashboard.jpg');">
        <h1>
            Welcome <asp:label ID="lbl_patientName" runat="server"> </asp:label>
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
                                        <li><a href="#"><i class="icon-inbox"></i>My Family</a></li>
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
                            <div class="btn-controls">
                                <div class="btn-box-row row-fluid">
                                    <a href="dashboard-user_profile.aspx" class="btn-box big span4"><i class=" icon-random"></i><b>Profile</b>
                                        <p class="text-muted">
                                            Manage & Edit</p>
                                    </a><a href="Book-Appointment.aspx" class="btn-box big span4"><i class="icon-user"></i><b>Appointment</b>
                                        <p class="text-muted">
                                            Book & Manage</p>
                                    </a><a href="dashboard-billing.aspx" class="btn-box big span4"><i class="icon-money"></i><b>Billing</b>
                                        <p class="text-muted">
                                            Visits & Billing </p>
                                    </a>
                                </div>
								
                            </div>
                            <!--/#btn-controls-->
<div class="module">
                                <div class="module-head">
                                    <h3>
                                        Monthly Appointments</h3>
                                </div>
         <div class="chart">                       "
    <div class="module-body">
                                   









                                    

                               <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
var jQuery_1_8_3 = $.noConflict(true);
</script>
    <script src="js/excanvas.js" type="text/javascript"></script>
    <script src="//cdn.jsdelivr.net/chart.js/0.2/Chart.js" type="text/javascript"></script>
    <%--<form id="form2" runat="server">--%>
    <script type="text/javascript">
        jQuery_1_8_3(function () {
            LoadChart();
            jQuery_1_8_3("[id*=ddlCountries]").bind("change", function () {
                LoadChart();
            });
            jQuery_1_8_3("[id*=rblChartType] input").bind("click", function () {
                LoadChart();
            });
        });
        function LoadChart() {
            var chartType = parseInt(jQuery_1_8_3("[id*=rblChartType] input:checked").val());
            jQuery_1_8_3.ajax({
                type: "POST",
                url: "dashboard-patient.aspx/GetChart",
                data: "{country: '" + jQuery_1_8_3("[id*=ddlCountries]").val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    jQuery_1_8_3("#dvChart").html("");
                    jQuery_1_8_3("#dvLegend").html("");
                    var data = eval(r.d);
                    var el = document.createElement('canvas');
                    jQuery_1_8_3("#dvChart")[0].appendChild(el);

                    //Fix for IE 8
                    if (jQuery_1_8_3.browser.msie && jQuery_1_8_3.browser.version == "8.0") {
                        G_vmlCanvasManager.initElement(el);
                    }
                    var ctx = el.getContext('2d');

                    var userStrengthsChart;
                    switch (chartType) {
                        case 1:
                            userStrengthsChart = new Chart(ctx).Pie(data);
                            break;
                        case 2:
                            userStrengthsChart = new Chart(ctx).Doughnut(data);
                            break;
                    }
                    for (var i = 0; i < data.length; i++) {
                        var div = jQuery_1_8_3("<div />");
                        div.css("margin-bottom", "10px");
                        div.html("<span style = 'display:inline-block;height:10px;width:10px;background-color:" + data[i].color + "'></span> " + data[i].text);
                        jQuery_1_8_3("#dvLegend").append(div);
                    }
                },
                failure: function (response) {
                    alert('There was an error.');
                }
            });
        }
    </script>
                                    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
        <tr>
            <td>
                Year:
                <asp:DropDownList ID="ddlCountries" runat="server" DataSourceID="SqlDataSource1" DataTextField="appointment_year" DataValueField="appointment_year">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:isys 631ConnectionString2 %>" SelectCommand="select distinct DATEPART(year,appointment_date) as appointment_year from appointment where  DATEPART(year,appointment_date)<2017 order by 1 desc"></asp:SqlDataSource>
                <asp:RadioButtonList ID="rblChartType" runat="server" RepeatDirection="Horizontal" >
                    <asp:ListItem Text="Pie" Value="1" Selected="True" />
                    <asp:ListItem Text="Doughnut" Value="2" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <div id="dvChart" style="width:100%;">
                </div>
            </td>
            <td>
                <div id="dvLegend">
                </div>
            </td>
        </tr>
    </table>















                                </div>
             </div>
                            </div>
                            <!--/.module-->
                            <div class="module hide">
                                <div class="module-head">
                                    <h3>
                                        Adjust Budget Range</h3>
                                </div>
                                <div class="module-body">
                                    <div class="form-inline clearfix">
                                        <a href="#" class="btn pull-right">Update</a>
                                        <label for="amount">
                                            Price range:</label>
                                        &nbsp;
                                        <input type="text" id="amount" class="input-" />
                                    </div>
                                    <hr />
                                    <div class="slider-range">
                                    </div>
                                </div>
                            </div>
                            <div class="module">
                                <div class="module-head">
                                    <h3>
                                        Upcoming Appointments</h3>
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
                                    </form>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
                $('[id*=GridView1]').footable();
        });
    </script>

   
      
           
                                </div>
                            </div>
                            <!--/.module-->
                        </div>
                        <!--/.content-->
                    </div>
                    <!--/.span9-->
                     <div class="media_responsive">
                        <div class="sidebar">
                            <ul class="widget widget-menu unstyled">
                                <li><a id="linkLogout" runat="server"><i class="menu-icon icon-signout"></i>Logout </a></li>
                            </ul>
                        </div>
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
