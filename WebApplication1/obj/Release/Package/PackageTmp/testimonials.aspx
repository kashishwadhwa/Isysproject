<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="testimonials.aspx.cs" Inherits="WebApplication1.testimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/testimonialstyle.css"> <!-- Resource style -->
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
    <link rel="stylesheet" href="index.css" />
	<title>Client Testimonials </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="banner" runat="server">
    <div class="main-background-appointments">
        <h1>
        Testimonials
</h1>
		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="main-section">
    <div class="testimonials">
    <div class="cd-testimonials-wrapper cd-container">
	<ul class="cd-testimonials">
		<li>
			<p>From the receptionist, the hygienist, to the dentist there is a high degree of professionalism exhibited throughout the staff.</p>
			<div class="cd-author">
				<img src="images/avatar-1.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Aston Martin</li>
					<li>Project Manager, Tulsa Motors</li>
				</ul>
			</div>
		</li>

		<li>
			<p>The implant procedure was easy to have done. It was much easier than a root canal or filling. Dr. Elvis and Kevin do a great job and make you feel very relaxed and
comfortable. The staff was very supportive and helpful as they explained every step thoroughly with detail.  It went extremely well- was painless.</p>
			<div class="cd-author">
				<img src="images/avatar-2.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Lauren Wolff</li>
					<li>Student, Colorado School of Mines</li>
				</ul>
			</div>
		</li>

		<li>
			<p>The staff is excellent and super friendly. Dr. Simmons is a chill dude and is a true professional at his profession. Come check out this place.</p>
			<div class="cd-author">
				<img src="images/avatar-3.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Chase Lee</li>
					<li>Mother of two</li>
				</ul>
			</div>
		</li>
        <li>
				<p>Over the years Joaquina Dental has helped me overcome my fear of going to the
dentist and fear of the pain. They have a pleasant, calming, way to explain things so I
can understand them. I like my hygienist and the rest of my support staff. I talk high 
about Joaquina Dental whenever it comes up.</p>
				
				<div class="cd-author">
					<img src="images/avatar-4.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>Champion Snape</li>
						<li>Recruiter, Staff Maniac</li>
					</ul>
				</div> <!-- cd-author -->
			</li>

			<li >
				<p>My visit with Joaquina Dental was the first time I had a pain free and stress free
dental visit for a very long time.  Having Dr. Angela as my Orthodontist was also
a very pleasant experience.  My wife, Beth, says ditto regarding her dental 
appointments as well.</p>
				
				<div class="cd-author">
					<img src="images/avatar-5.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>Greg Matters</li>
						<li>Sales Rep, Grinder.com</li>
					</ul>
				</div> <!-- cd-author -->
			</li>

			<li>
				<p>Best Service in town. You guys rock!.
                    Dr. Trump is so funny and wanna make me come again and again.
				</p>
				
				<div class="cd-author">
					<img src="images/avatar-6.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>MyName</li>
						<li>CEO, Alphabet</li>
					</ul>
				</div> <!-- cd-author -->
			</li>
		
	</ul> <!-- cd-testimonials -->

	<a href="#0" class="cd-see-all">See all</a>
</div> <!-- cd-testimonials-wrapper -->

<div class="cd-testimonials-all">
	<div class="cd-testimonials-all-wrapper">
		<ul>
			<li class="cd-testimonials-item">
				<p>From the receptionist, the hygienist, to the dentist there is a high degree of professionalism exhibited throughout the staff.</p>
			<div class="cd-author">
				<img src="images/avatar-1.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Aston Martin</li>
					<li>Project Manager, Tulsa Motors</li>
				</ul>
			</div>
			</li>

			<li class="cd-testimonials-item">
				<p>The implant procedure was easy to have done. It was much easier than a root canal or filling. Dr. Elvis and Kevin do a great job and make you feel very relaxed and
comfortable. The staff was very supportive and helpful as they explained every step thoroughly with detail.  It went extremely well- was painless.</p>
			<div class="cd-author">
				<img src="images/avatar-2.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Lauren Wolff</li>
					<li>Student, Colorado School of Mines</li>
				</ul>
			</div>
			</li>

			<li class="cd-testimonials-item">
				<p>The staff is excellent and super friendly. Dr. Simmons is a chill dude and is a true professional at his profession. Come check out this place.</p>
			<div class="cd-author">
				<img src="images/avatar-3.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Chase Lee</li>
					<li>Mother of two</li>
				</ul>
			</div>
			</li>

			<li class="cd-testimonials-item">
				<p>Over the years Joaquina Dental has helped me overcome my fear of going to the
dentist and fear of the pain. They have a pleasant, calming, way to explain things so I
can understand them. I like my hygienist and the rest of my support staff. I talk high 
about Joaquina Dental whenever it comes up.</p>
				
				<div class="cd-author">
					<img src="images/avatar-4.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>Champion Snape</li>
						<li>Recruiter, Staff Maniac</li>
					</ul>
				</div> <!-- cd-author -->
			</li>

			<li class="cd-testimonials-item">
				<p>My visit with Joaquina Dental was the first time I had a pain free and stress free
dental visit for a very long time.  Having Dr. Angela as my Orthodontist was also
a very pleasant experience.  My wife, Beth, says ditto regarding her dental 
appointments as well.</p>
				
				<div class="cd-author">
					<img src="images/avatar-5.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>Greg Matters</li>
						<li>Sales Rep, Grinder.com</li>
					</ul>
				</div> <!-- cd-author -->
			</li>

			<li class="cd-testimonials-item">
				<p>Best Service in town. You guys rock!.
                    Dr. Trump is so funny and wanna make me come again and again.
				</p>
				
				<div class="cd-author">
					<img src="images/avatar-6.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>MyName</li>
						<li>CEO, Alphabet</li>
					</ul>
				</div> <!-- cd-author -->
			</li>

			<li class="cd-testimonials-item">
				<p>From the receptionist, the hygienist, to the dentist there is a high degree of professionalism exhibited throughout the staff.</p>
			<div class="cd-author">
				<img src="images/avatar-1.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Aston Martin</li>
					<li>Project Manager, Tulsa Motors</li>
				</ul>
			</div>
			</li>

			<li class="cd-testimonials-item">
				<p>The implant procedure was easy to have done. It was much easier than a root canal or filling. Dr. Elvis and Kevin do a great job and make you feel very relaxed and
comfortable. The staff was very supportive and helpful as they explained every step thoroughly with detail.  It went extremely well- was painless.</p>
			<div class="cd-author">
				<img src="images/avatar-2.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Lauren Wolff</li>
					<li>Student, Colorado School of Mines</li>
				</ul>
			</div>
			</li>

			<li class="cd-testimonials-item">
				<p>The staff is excellent and super friendly. Dr. Simmons is a chill dude and is a true professional at his profession. Come check out this place.</p>
			<div class="cd-author">
				<img src="images/avatar-3.jpg" alt="Author image">
				<ul class="cd-author-info">
					<li>Chase Lee</li>
					<li>Mother of two</li>
				</ul>
			</div>
			</li>

			<li class="cd-testimonials-item">
				<p>Over the years Joaquina Dental has helped me overcome my fear of going to the
dentist and fear of the pain. They have a pleasant, calming, way to explain things so I
can understand them. I like my hygienist and the rest of my support staff. I talk high 
about Joaquina Dental whenever it comes up.</p>
				
				<div class="cd-author">
					<img src="images/avatar-4.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>Champion Snape</li>
						<li>Recruiter, Staff Maniac</li>
					</ul>
				</div> <!-- cd-author -->
			</li>

			<li class="cd-testimonials-item">
				<p>My visit with Joaquina Dental was the first time I had a pain free and stress free
dental visit for a very long time.  Having Dr. Angela as my Orthodontist was also
a very pleasant experience.  My wife, Beth, says ditto regarding her dental 
appointments as well.</p>
				
				<div class="cd-author">
					<img src="images/avatar-5.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>Greg Matters</li>
						<li>Sales Rep, Grinder.com</li>
					</ul>
				</div> <!-- cd-author -->
			</li>

			<li class="cd-testimonials-item">
				<p>Best Service in town. You guys rock!.
                    Dr. Trump is so funny and wanna make me come again and again.
				</p>
				
				<div class="cd-author">
					<img src="images/avatar-6.jpg" alt="Author image">
					<ul class="cd-author-info">
						<li>MyName</li>
						<li>CEO, Alphabet</li>
					</ul>
				</div> <!-- cd-author -->
			</li>
	</ul>
			
	</div>	<!-- cd-testimonials-all-wrapper -->

	<a href="#0" class="close-btn">Close</a>
</div> <!-- cd-testimonials-all -->
        </div>
<script src="js/jquery-2.1.1.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->
    
    </section>
</asp:Content>
