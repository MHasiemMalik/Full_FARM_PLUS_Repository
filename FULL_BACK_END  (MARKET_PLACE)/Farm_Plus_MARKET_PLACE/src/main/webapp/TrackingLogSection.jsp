<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Package Tracking</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url(https://mhasiemmalik.github.io/FarmFlowerHRT/TP%20CP%20PICS/Aflowergrowth/azalea.jpg);
            background-repeat:no-repeat;
            background-position:center center; 
            background-size:cover;  
            background-attachment:fixed;
            background-color: black;
        }
        .tracking-header {
            background-color: #00000095;
            color: white;
            padding: 1rem;
            text-align: center;
            
        }
        .tracking-card {
            margin: 1rem auto;
            background-color: #00000095;
            max-width: 800px;
            border-radius: 10px;
            color: white;
        }
        .tracking-status {
            font-size: 1.1rem;
            color: white;
        }
        .progress {
            height: 1rem;
        }
        .step {
            font-size: 0.9rem;
            text-align: center;
            color: white;
        }
        .product-image {
            max-width: 170px;
            height: auto;
        }
        button {
            padding: 5px 10px;
            border: none;
            background-color: orange;
            color: #101010;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
   button:hover {
            box-shadow:0 0 5px orange,
                        0 0 25px orange,
                        0 0 50px orange,
                        0 0 100px orange,
                        0 0 200px orange;
        }
        label{
          padding-top: 20px;
          color:orange;
        }
    </style>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">


    <div class="tracking-header">
        <h1>PRODUCE TRACKING</h1>
    </div>
    
    
    <%
        List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    Set<String> displayedCrops = new HashSet<>(); // To track displayed crops

    if (cropList != null && !cropList.isEmpty()) {
        for (CropListingDetails crop : cropList) {
            String cropIdentifier = crop.getCropName() + crop.getBIDPRICE() + crop.getListPrice(); // Unique identifier for each crop

            if (!displayedCrops.contains(cropIdentifier)) {
                displayedCrops.add(cropIdentifier); // Mark this crop as displayed
               
                for (CropListingDetails bidder : cropList) {
                    // Match bidders to the current crop
                    if (crop.getCropName().equals(bidder.getCropName()) &&
                        crop.getBIDPRICE().equals(bidder.getBIDPRICE()) &&
                        crop.getListPrice().equals(bidder.getListPrice())) {
                    	
                    	
                    	 String progressWidth = "10%"; // Default width for "Order Placed"
                         String progressBarClass = "bg-danger"; // Default class for "Order Placed"
                         String orderStatus = crop.getOrderStatus();
                         String nextStatus = "Your Product will be Shipped Soon";

                         if ("Shipped".equalsIgnoreCase(orderStatus)) {
                             progressWidth = "35%";
                             progressBarClass = "bg-warning";
                             nextStatus = "Your Product Will be Out for Delivery soon";
                         } else if ("Out for Delivery".equalsIgnoreCase(orderStatus)) {
                             progressWidth = "65%";
                             progressBarClass = "bg-success";
                             nextStatus = "Your Product Is Out For Delivery , Get Ready!";
                         } else if ("Delivered".equalsIgnoreCase(orderStatus)) {
                             progressWidth = "100%";
                             progressBarClass = "bg-info";
                             nextStatus = "";
                         }
    %>

    <div class="container">
        <!-- Product 1 -->
        <div class="card tracking-card shadow-sm">
            <div class="card-body">
                <div class="row align-items-center">
                    <div class="col-md-3 text-center">
                        <img src="uploads/<%= crop.getImgFileName() %>" alt="Crop Image" class="product-image">
                    </div>
                    <div class="col-md-9">
                        <h5 class="card-title"><%= crop.getCropName() %></h5>
                        <p> This <u><b><%= crop.getCropName() %></b></u> was listed by 
                <u><b><%= crop.getFarmerName() %></b></u>, which is of the variety 
                <u><b><%= crop.getCropVariety() %></b></u> and quantity of 
                <u><b><%= crop.getCropQuantity() %></b></u> for the price 
                <u><b><%= crop.getListPrice() %></b></u> from the city 
                <u><b><%= crop.getCity() %></b></u>. It was sold to 
                <u><b><%= crop.getBNAME() %></b></u> for  
                <u><b><%= crop.getBIDPRICE() %></b></u> from  
                <u><b><%= crop.getBCITY() %></b></u> city</p>
                        <p class="tracking-status">Status: <b><%= crop.getOrderStatus() %></b> on <%= crop.getCDateTime() %></p>
                        <div class="progress mb-2">
                            <div class="progress-bar <%= progressBarClass %>" role="progressbar" style="width: <%= progressWidth %>" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="step">Order Placed</span>
                            <span class="step">Shipped</span>
                            <span class="step">Out for Delivery</span>
                            <span class="step">Delivered</span>
                        </div>
                    </div>
                    
                    <%
                    if ("logistician".equals(session.getAttribute("Role"))) {
                    %>
                    <Center>
                    <form id="profileForm" action="TrackNotesUpdated" method="post">
                       <input type="hidden" name="id" value="<%=session.getAttribute("Adhar") %>">
                       <input type="hidden" name="CropId" value="<%=crop.getcid()%>">                      
                       <div class="form-group">
								<label><i class="fa-solid fa-pen-to-square"></i> SET STATUS :</label>
    							<select id="cropdata" name="status">
        								<option value="Order Placed">Order Placed</option>
        								<option value="Shipped">Shipped</option>
        								<option value="Out for Delivery">Out for Delivery</option>
        								<option value="Delivered">Delivered</option>
        				       </select>

                                
                        </div>
                       <center><button type="submit" id="B2" class="form-submit" value="Register">UPDATE</button></center>
						</form> </Center>
						
					<%
                       }else{
                    %>	   
						  <center><label> <%= nextStatus %> </label></center>
                    <% 	   
                       }					
					%>	
                </div>
            </div>
        </div>
 <%
                        }
                    }
                %>
  <%
                }
            }
        } else {
    %>
    <h1 class="text-center text-danger">No Crops Found at the Moment.</h1>
    <%
        }
    %>	  
    
         
        
        
    </div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    $(document).ready(function() {
        var status = $("#status").val();
        console.log(status);
        if (status == "success") {
            swal("Congrats", "Status Has Been Updated Successfully", "success");
        } else if (status == "foreign_key_error") {
            swal("Sorry", "Looks Like The Entered Aadhar Is Not Registered :( ", "error");
        } else if (status == "unique_constraint_error") {
            swal("Sorry", "Looks Like This Bid is Already Placed Before :| ", "error");
        } else if (status == "CHECK_BADHAR_LOGADHAR_INVALIDITY") {
            swal("Sorry", "You Cannot Update The Status If You Are The Bidder But The Seller And Other Logistician Can.  Try Informing Other Logisticians. :| ", "error");
        } else if (status == "null") {
            swal({
                title: "Welcome To The Produce Tracking Page ,Find The Status Of Your Produce",
                icon: "info",
                button: "OK",
                closeOnClickOutside: false
            });
        } else {
            swal("Sorry", "Looks Like There was an error Please Try Again :( ", "error");
        }
    });
</script>   
</body>
</html>
