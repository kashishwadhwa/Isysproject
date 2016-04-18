<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebApplication1.WebForm5" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Appointments</title>
        	
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://bootsnipp.com/dist/bootsnipp.min.css?ver=7d23ff901039aef6293954d33d23c066">
    <link rel="stylesheet" href="index.css" />
    </asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
    <div class="main-background-appointments">
        <h1>
        Appointments
</h1>
		</div>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


       <section id="main-section">
               <form id="form1" runat="server">
            <div class="container">
	<div class="row">
		<div class="col-md-12">
            <div class="input-group" id="adv-search">
                <input type="text" class="form-control" placeholder="Search for snippets" />
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                <form class="form-horizontal" role="form">
                                  <div class="form-group">
                                    <label for="filter">Filter by</label>
                                    <select class="form-control">
                                        <option value="0" selected>All Snippets</option>
                                        <option value="1">Featured</option>
                                        <option value="2">Most popular</option>
                                        <option value="3">Top rated</option>
                                        <option value="4">Most commented</option>
                                    </select>
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Author</label>
                                    <input class="form-control" type="text" />
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Contains the words</label>
                                    <input class="form-control" type="text" />
                                  </div>
                                  <button type="submit" class="btn btn-primary" runat="server"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </form>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                    </div>
                </div>
            </div>
          </div>
        </div>
	</div>

               <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="http://bootsnipp.com/dist/scripts.min.js"></script>
    <script src="http://d1n0x3qji82z53.cloudfront.net/src-min-noconflict/ace.js"></script>
    
        <script type="text/javascript">
var jQuery_1_11_0 = $.noConflict(true);
</script>



           <div class="gridv">


    <asp:GridView ID="GridView1" CssClass="footable" OnPageIndexChanging="GridView1_PageIndexChanging" runat="server" AutoGenerateColumns="false"
        Style="max-width: 1000px" AllowPaging="True" PagerSettings-Mode="NumericFirstLast">
        <Columns>
            <asp:BoundField DataField="appointment_id" HeaderText="Appointment ID" />
            <asp:BoundField DataField="patient_first_name" HeaderText="Patient First Name" />
            <asp:BoundField DataField="patient_last_name" HeaderText="Patient Last Name" />
            <asp:BoundField DataField="dentist_first_name" HeaderText="Dentist First Name" />
            <asp:BoundField DataField="dentist_last_name" HeaderText="Dentist Last Name" />
            <asp:BoundField DataField="appointment_date" HeaderText="Appointment Date" />
            <asp:BoundField DataField="appointment_time" HeaderText="Appointment Time" />
        </Columns>

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
        <script type="text/javascript">

</script>

    </form>
           </div>

                   <div class="doctor-image-gridview">
            <img src="doctor.jpg" alt="DOCTOR" />
        </div>



           </section>

</asp:Content>
