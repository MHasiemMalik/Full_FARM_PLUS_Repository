<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>
<%
 if(session.getAttribute("name")==null){
	 response.sendRedirect("login.jsp");
 }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Farm Plus Market Place</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script> 
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>
 <style type="text/css">
 #X {
  display: flex;
  overflow-x: auto;
  padding: 20px; 
  gap: 15px; 
}

@media screen and (max-width: 300px) {
  #X {
    gap: 35%; 
  }
}
#Y{
width:300px;
}  

 
 #ct{
                position: relative;
                top: -10px;
                right: 5px;
                background-color: red;
                color: white;
                border-radius: 50%;
                padding: 2px 6px;
                font-size: 10px;
                line-height: 1;
                font-weight: bold;
                display: inline-block;
 }
 #B1{
   background: none;
   border:none;
   color:White; 
   font-size: 14px;
   font-weight: bold;
   font-family:Montserrat;
   display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px; /* Space between text and icon */
    white-space: nowrap; /* Prevent text wrapping */
 }
 
 #B2 {
        padding: 10px 20px;
        border: none;
        background-color: rgb(5, 234, 5);
        color: #101010;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }
    
    #B3 {
        padding: 10px 20px;
        border: none;
        background-color: orange;
        color: #101010;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 10px;
    }
 #B2:hover {
        box-shadow: 0 0 5px rgb(5, 234, 5),
                    0 0 25px rgb(5, 234, 5),
                    0 0 50px rgb(5, 234, 5),
                    0 0 100px rgb(5, 234, 5),
                    0 0 200px rgb(5, 234, 5);
    }
 #B3:hover {
        box-shadow: 0 0 5px orange,
                    0 0 25px orange,
                    0 0 50px orange,
                    0 0 100px orange,
                    0 0 200px orange;
    }
 #B1:hover{
            color:orange;
         }
 #ics:hover{
            color:;
         }        
 Label{
   color:rgb(44 62 80);
 }
 
#BK{
     display:flex;gap:4%;
    }
    
 </style>
 
 
</head>
<body id="page-top">
    <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">

	<!-- Navigation-->
	<form id="autoSubmitForm" action="HomePageListingsDetails" method="post">
        <input type="hidden" name="id" value="<%=session.getAttribute("City") %>">
    </form>
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">FARM+ MARKET PLACE</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-warning text-rgb(44 62 80) rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="ListingPage.jsp"> SELL</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="ListedSection">
						<form id="profileForm" action="ListedSection" method="post">
                       <input type="hidden" name="id" value="<%=session.getAttribute("Adhar") %>">
                       <button type="submit" id="B1" class="form-submit" value="Register">LISTED <i class="fa-solid fa-clipboard-list"><span id="ct">2</span></i></button>
						</form></a></li>  
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="ListedDetailsViewer.jsp"> BUY</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="ListedSection">
					<form id="profileForm" action="UserBidsSection" method="post">
                       <input type="hidden" name="id" value="<%=session.getAttribute("Adhar") %>">
                       <button type="submit" id="B1" class="form-submit" value="Register">CART</button>
						</form></a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="ListedSection">	
					<form id="profileForm" action="ContractInvoiceViewer" method="post">
                       <input type="hidden" name="id" value="<%=session.getAttribute("Adhar") %>">
                       <button type="submit" id="B1" class="form-submit" value="Register">CONTRACT <i class="fa-solid fa-clipboard-list"><span id="ct">2</span></i></button>
						</form></a></li>	
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="ListedSection">	
					<form id="profileForm" action="TrackLogisticDetails" method="post">
                       <input type="hidden" name="id" value="<%=session.getAttribute("Adhar") %>">
                       <button type="submit" id="B1" class="form-submit" value="Register">TRACK <i class="fa-solid fa-clipboard-list"><span id="ct">2</span></i></button>
						</form></a></li>
					<li class="nav-item mx-0 mx-lg-1"><a id="ics"
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logoutFServlet"> Logout</a></li>
					<li class="nav-item mx-0 mx-lg-1 bg-warning"><Label class="py-3 px-0 px-lg-3 rounded"> WELCOME <%=session.getAttribute("name") %></Label></li>
					
					<%
                    if ("logistician".equals(session.getAttribute("Role"))) {
                    %>
                    <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="ListedSection">	
					<form id="profileForm" action="LogisticUpdate" method="post">
                       <input type="hidden" name="id" value="<%=session.getAttribute("Adhar") %>">
                       <button type="submit" id="B1" class="form-submit" value="Register">LOGISTICS<i class="fa-solid fa-clipboard-list"><span id="ct">2</span></i></button>
						</form></a></li>
					<%
                       }
                    %>	
					
						
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-warning text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="images/imagplus/icon.jpeg"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome to The MARKET PLACE <i class="fa-solid fa-cart-shopping"></i></h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">CHECK THE LATEST LISTINGS BELOW</p>
		</div>
	</header>
	
<br>	
<!-- Complete CurrentBidList -->	
	<center><h2>Flowers</h2></center>
<div class="container" id="X">

            <%
        List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList != null && !cropList.isEmpty()) {
            for (CropListingDetails crop : cropList) {
       if("Flower".equals(crop.getCropType())){ %>
            <div class="container mt-3">
               <h2><%= crop.getCropName() %></h2>
               <p><%= crop.getCity() %></p>
               <div class="card" id="Y"  >
               <img class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="width:100%;height:210px">
               <div class="card-body">
               <h4 class="card-title"><%= crop.getListPrice() %></h4>
               <p class="card-text"> This <b><%= crop.getCropName() %></b>  was listed by <b><%= crop.getFarmerName() %></b> which is of the Variety <b><%= crop.getCropVariety() %></b> and Quantity of <b><%= crop.getCropQuantity() %></b> for the price <b><%= crop.getListPrice() %></b> from the City <b><%= crop.getCity() %></b> on <b><%= crop.getLDateTime() %></b>. It will remain listed from <b><%= crop.getStartDate() %></b> to <b><%= crop.getEndDate() %></b>.</p>
               
               <div id="BK">
               <form id="profileForm" action="BiddingPageMain" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B2" class="form-submit" value="Register">Place Bid</button>
</form>   <form id="profileForm" action="BiddingProfile" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B3" class="form-submit" value="Register">Profile</button>
</form>
             </div>
               </div>
              </div>	
           </div>
           
           <% } %>
           <%
            }
        } else {
    %>
    <p>No crop details found.</p>
    <%
        }
    %>
     		                
 </div>
 
 
 
 <br>
<center><h2>Fruits</h2></center>
<div class="container" id="X">
    <%
        List<CropListingDetails> cropList1 = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList1 != null && !cropList1.isEmpty()) {
            for (CropListingDetails crop : cropList1) {
         
             if("Fruit".equals(crop.getCropType())){ %>
            <div class="container mt-3">
               <h2><%= crop.getCropName() %></h2>
               <p><%= crop.getCity() %></p>
               <div class="card" id="Y"  >
               <img class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="width:100%;height:210px">
               <div class="card-body">
               <h4 class="card-title"><%= crop.getListPrice() %></h4>
               <p class="card-text"> This <b><%= crop.getCropName() %></b>  was listed by <b><%= crop.getFarmerName() %></b> which is of the Variety <b><%= crop.getCropVariety() %></b> and Quantity of <b><%= crop.getCropQuantity() %></b> for the price <b><%= crop.getListPrice() %></b> from the City <b><%= crop.getCity() %></b> on <b><%= crop.getLDateTime() %></b>. It will remain listed from <b><%= crop.getStartDate() %></b> to <b><%= crop.getEndDate() %></b>.</p>
               <div id="BK">
               <form id="profileForm" action="BiddingPageMain" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B2" class="form-submit" value="Register">Place Bid</button>
</form>   <form id="profileForm" action="BiddingProfile" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B3" class="form-submit" value="Register">Profile</button>
</form>
             </div>
               </div>
              </div>	
           </div>
           
           <% } %>
           <%
            }
        } else {
    %>
    <p>No crop details found.</p>
    <%
        }
    %>
     		                
 </div>
 
 
 
 
 
 <br>
<center><h2>Spices</h2></center>
<div class="container" id="X">
<%
        List<CropListingDetails> cropList2 = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList2 != null && !cropList2.isEmpty()) {
            for (CropListingDetails crop : cropList2) {
    		 if("Spice".equals(crop.getCropType())){ %>
            <div class="container mt-3">
               <h2><%= crop.getCropName() %></h2>
               <p><%= crop.getCity() %></p>
               <div class="card" id="Y"  >
               <img class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="width:100%;height:210px">
               <div class="card-body">
               <h4 class="card-title"><%= crop.getListPrice() %></h4>
               <p class="card-text"> This <b><%= crop.getCropName() %></b>  was listed by <b><%= crop.getFarmerName() %></b> which is of the Variety <b><%= crop.getCropVariety() %></b> and Quantity of <b><%= crop.getCropQuantity() %></b> for the price <b><%= crop.getListPrice() %></b> from the City <b><%= crop.getCity() %></b> on <b><%= crop.getLDateTime() %></b>. It will remain listed from <b><%= crop.getStartDate() %></b> to <b><%= crop.getEndDate() %></b>.</p>
               <div id="BK">
               <form id="profileForm" action="BiddingPageMain" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B2" class="form-submit" value="Register">Place Bid</button>
</form>   <form id="profileForm" action="BiddingProfile" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B3" class="form-submit" value="Register">Profile</button>
</form>
             </div>
               </div>
              </div>	
           </div>
           
           <% } %>
           <%
            }
        } else {
    %>
    <p>No crop details found.</p>
    <%
        }
    %>
     		                
 </div>
 
 
 
 <br>
 <center><h2>Vegetables</h2></center>
<div class="container" id="X">
<%
        List<CropListingDetails> cropList3 = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList3 != null && !cropList3.isEmpty()) {
            for (CropListingDetails crop : cropList3) {
            	
            if("Vegetable".equals(crop.getCropType())){ %>
            
            <div class="container mt-3">
               <h2><%= crop.getCropName() %></h2>
               <p><%= crop.getCity() %></p>
               <div class="card" id="Y"  >
               <img class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="width:100%;height:210px">
               <div class="card-body">
               <h4 class="card-title"><%= crop.getListPrice() %></h4>
               <p class="card-text"> This <b><%= crop.getCropName() %></b>  was listed by <b><%= crop.getFarmerName() %></b> which is of the Variety <b><%= crop.getCropVariety() %></b> and Quantity of <b><%= crop.getCropQuantity() %></b> for the price <b><%= crop.getListPrice() %></b> from the City <b><%= crop.getCity() %></b> on <b><%= crop.getLDateTime() %></b>. It will remain listed from <b><%= crop.getStartDate() %></b> to <b><%= crop.getEndDate() %></b>.</p>
               <div id="BK">
               <form id="profileForm" action="BiddingPageMain" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B2" class="form-submit" value="Register">Place Bid</button>
</form>   <form id="profileForm" action="BiddingProfile" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B3" class="form-submit" value="Register">Profile</button>
</form>
             </div>
               </div>
              </div>	
           </div>
           
           <% } %>
           <%
            }
        } else {
    %>
    <p>No crop details found.</p>
    <%
        }
    %>
     		                
 </div>
 
 <br>
 
 
 <center><h2>Other Crops</h2></center>
<div class="container" id="X">
<%
        List<CropListingDetails> cropList4 = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList4 != null && !cropList4.isEmpty()) {
            for (CropListingDetails crop : cropList4) {
            	if("Other".equals(crop.getCropType())){ %>
            
            <div class="container mt-3">
               <h2><%= crop.getCropName() %></h2>
               <p><%= crop.getCity() %></p>
               <div class="card" id="Y"  >
               <img class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="width:100%;height:210px">
               <div class="card-body">
               <h4 class="card-title"><%= crop.getListPrice() %></h4>
               <p class="card-text"> This <b><%= crop.getCropName() %></b>  was listed by <b><%= crop.getFarmerName() %></b> which is of the Variety <b><%= crop.getCropVariety() %></b> and Quantity of <b><%= crop.getCropQuantity() %></b> for the price <b><%= crop.getListPrice() %></b> from the City <b><%= crop.getCity() %></b> on <b><%= crop.getLDateTime() %></b>. It will remain listed from <b><%= crop.getStartDate() %></b> to <b><%= crop.getEndDate() %></b>.</p>
               <div id="BK">
               <form id="profileForm" action="BiddingPageMain" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B2" class="form-submit" value="Register">Place Bid</button>
</form>   <form id="profileForm" action="BiddingProfile" method="post">
            <input type="hidden" name="id" value="<%=crop.getId() %>">
            <button type="submit" id="B3" class="form-submit" value="Register">Profile</button>
</form>
             </div>
               </div>
              </div>	
           </div>
           
           <% } %>
           <%
            }
        } else {
    %>
    <p>No crop details found.</p>
    <%
        }
    %>
     		                
 </div>
 
	<!-- About Section>
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading>
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content>
			<div class="row">
				<div class="col-lg-4 ms-auto">
					<p class="lead">Freelancer is a free bootstrap theme created by
						Start Bootstrap. The download includes the complete source files
						including HTML, CSS, and JavaScript as well as optional SASS
						stylesheets for easy customization.</p>
				</div>
				<div class="col-lg-4 me-auto">
					<p class="lead">You can create your own custom avatar for the
						masthead, change the icon in the dividers, and add your email
						address to the contact form to make it fully functional!</p>
				</div>
			</div>
			<!-- About Section Button->
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light"
					href="https://startbootstrap.com/theme/freelancer/"> <i
					class="fas fa-download me-2"></i> Free Download!
				</a>
			</div>
		</div>
	</section>
	< Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact
				Us</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form id="contactForm" data-sb-form-api-token="API_TOKEN">
						<!-- Name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text"
								placeholder="Enter your name..." data-sb-validations="required" />
							<label for="name">Full name</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">A
								name is required.</div>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="email" type="email"
								placeholder="name@example.com"
								data-sb-validations="required,email" /> <label for="email">Email
								address</label>
							<div class="invalid-feedback" data-sb-feedback="email:required">An
								email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email
								is not valid.</div>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="phone" type="tel"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="phone">Phone number</label>
							<div class="invalid-feedback" data-sb-feedback="phone:required">A
								phone number is required.</div>
						</div>
						<!-- Message input-->
						<div class="form-floating mb-3">
							<textarea class="form-control" id="message" type="text"
								placeholder="Enter your message here..." style="height: 10rem"
								data-sb-validations="required"></textarea>
							<label for="message">Message</label>
							<div class="invalid-feedback" data-sb-feedback="message:required">A
								message is required.</div>
						</div>
						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
						<!-- Submit Button-->
						<button class="btn btn-primary btn-xl disabled" id="submitButton"
							type="submit">Send</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						CMR Engineering College Kandlakoyya , Medchel <br /> Hyderabad 500045, Telangana , India. 
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Farm Plus</h4>
					<p class="lead mb-0">
						An agricultural Comprehensive platform revolutionizing Indian agriculture system. For secure and seamless listing and bidding of agricultural produce across the country.
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Farm+ Website 18 Dec 2022</small>
		</div>
	</div>
	<!-- Portfolio Modals-->
	<!-- Portfolio Modal 1-->
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	 <script>
	 $(document).ready(function() {
	        var status = $("#status").val();
	        console.log(status);
	        if (status == "success") {
	            swal("Congrats", "Crop Listed Successfully", "success");
	        }else if (status == "foreign_key_error") {
	            swal("Sorry", "Looks Like The Entered Aadhar Is Not Registered :( ", "error");
	        } else if (status == "unique_constraint_error") {
	        	swal("Sorry", "Looks Like This Crop is Already Listed :| ", "error");
	        }else if (status == "null") {
	        	swal({
	        		  title: "WELCOME TO LISTING PAGE",
	        		  text: "Please Enter The Details To List Your Produce",
	        		  icon: "info",
	        		  button: "OK",
	        		  closeOnClickOutside: false
	        		}); }
	        else {
	            swal("Sorry", "Looks Like There was an error Please Try Again :( ", "error");
	        }
	    });

           
            
	    window.onload = function () {
            if (!sessionStorage.getItem("formSubmitted")) {
                sessionStorage.setItem("formSubmitted", "true"); // Set flag to indicate form has been submitted
                document.getElementById('autoSubmitForm').submit(); // Auto-submit the form
            } else {
                sessionStorage.removeItem("formSubmitted"); // Clear the flag for the next page refresh
            }
        };


	</script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * *
	
//NOT USED CONTENTS

<!-- Portfolio Section-
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">PORTFOLIO</h2>
			<!-- Icon Divider-
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Portfolio Grid Items-
			<div class="row justify-content-center">
				<!-- Portfolio Item 1-
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal1">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/cabin.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 2-
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal2">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/cake.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 3--
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal3">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/circus.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 4--
				<div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal4">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/game.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 5--
				<div class="col-md-6 col-lg-4 mb-5 mb-md-0">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal5">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/safe.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 6--
				<div class="col-md-6 col-lg-4">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal6">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/submarine.png"
							alt="..." />
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	 * * * * * * * * * * * * * * * * * * * * * * * *-->
	
	
	
	
	
	
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
