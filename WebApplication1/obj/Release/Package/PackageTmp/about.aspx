<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="WebApplication1.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>About Us</title>
    <link href="css/about/bootstrap.min.css" rel="stylesheet">
    <link href="css/about/font-awesome.min.css" rel="stylesheet">
    <link href="css/about/lightbox.css" rel="stylesheet"> 
    <link href="css/about/animate.min.css" rel="stylesheet"> 
	<link href="css/about/main.css" rel="stylesheet">
	<link href="css/about/responsive.css" rel="stylesheet">
     <link rel="stylesheet" href="index.css" />
    <style> header{height :56px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="main-section">
        <section id="about-company" class="padding-top wow fadeInUp" data-wow-duration="400ms" data-wow-delay="400ms">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <img src="doctor_small.jpg" class="margin-bottom" alt=""/>
                    <h1 class="margin-bottom">About Dr. Trump</h1>
                    <p>Dr. Trump is the face of “Joaquina Dental” and represents the brand personality. Trump’s vivid image portrays the power of
                        the web application, and his welcoming and comforting posture attracts the patients to his brand. <br />Dr. Trump is always happy and makes the patient feel
                        comfortable. His exuberant and jolly nature assures the patients that they are in good hands. Dr. Trump keeps his patients entertained
                        and at the same time is professional. </p>
                </div>
            </div>
        </div>
    </section>
    <!--/#about-company-->

          <section id="action">
        <div class="vertical-center">
             <div class="container">
                <div class="row">
                    <div class="action count">
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="12500" data-speed="3000" data-from="0"></h1>   
                            <h3>Happy Clients</h3>
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="12" data-speed="3000" data-from="0"></h1>   
                            <h3>Years in Business</h3> 
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="432" data-speed="3000" data-from="0"></h1> 
                            <h3>Recognitions</h3>
                        </div>
                        <div class="col-sm-3 text-center wow bounceIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                            <h1 class="timer bold" data-to="145" data-speed="3000" data-from="0"></h1> 
                            <h3>Affiliations</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="300ms">
                            <img src="images/icon1.jpg" alt="">
                        </div>
                        <h2>Joaquina Dental</h2>
                        <p>The leading dental clinic in Denver, Colorado in United States which has been assisting patients in relieving them from dental problems since 2001</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="600ms">
                            <img src="images/icon3.png" alt="">
                        </div>
                        <h2>Your Smile. Our Passion. Your Life.</h2>
                        <p>Quality dental care starts with best dentists. JD bring best in class dentist and dental services at a very affordable price.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn" data-wow-duration="1000ms" data-wow-delay="900ms">
                    <div class="single-service">
                        <div class="wow scaleIn" data-wow-duration="500ms" data-wow-delay="900ms">
                            <img src="images/icon2.jpg" alt="">
                        </div>
                        <h2>Rewards</h2>
                        <p>Random discounts in the range of 5-25% on the first pre-dental check-up after the user completes the registration process.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#services-->

    </section>
    <script type="text/javascript" src="js/about/jquery.js"></script>
    <script type="text/javascript" src="js/about/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/about/lightbox.min.js"></script>
    <script type="text/javascript" src="js/about/wow.min.js"></script>
    <script type="text/javascript" src="js/about/jquery.countTo.js"></script>
    <script type="text/javascript" src="js/about/main.js"></script>  
</asp:Content>
