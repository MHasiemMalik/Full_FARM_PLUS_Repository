<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bidding Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

    <script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>
    <script>
        function validateForm(event) {
            // Prevent form submission
            event.preventDefault();

            // Validation for Seller Name (should not contain symbols, spaces, or digits)
            var panCard = document.getElementsByName("BPAN")[0].value;
        	if (!/^[A-Z]{5}[0-9]{4}[A-Z]{1}$/.test(panCard)) {
            alert("Enter a valid PAN card number (e.g., ABCDE1234F)");
            return false;
        	}

            // Validation for Bid Price (should contain at least one integer)
            var bidPrice = document.getElementsByName("bid-price")[0].value;
            if (!/\d/.test(bidPrice)) {
                alert("Bid Price should contain at least one integer");
                return false;
            }

            // If all validations pass, submit the form
            event.target.submit();
        }
    </script>
    <style>
        a{
            color: orange;
        }
        body {
           
            font-family: Arial, sans-serif;
            background-color: #101010;
            color: orange;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 95vh;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px orange;
            width: 700px;
            text-align: center;
        }
@media (max-width: 768px) {
    body {
        padding-top:none;
    }
}
        input[type="text"], input[type="password"],input[type="email"],input[type="number"],input[type="option"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            background-color: rgba(26, 191, 158, 0.1);
            color: #00ffcc;
            border-bottom: 2px solid #00ffcc;
        }

        button {
            padding: 10px 20px;
            border: none;
            background-color: orange;
            color: #101010;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        #X:hover{
            box-shadow: 0 0 5px orange,
                        0 0 25px orange,
                        0 0 50px orange;
        }
        button:hover {
            box-shadow:0 0 5px orange,
                        0 0 25px orange,
                        0 0 50px orange,
                        0 0 100px orange,
                        0 0 200px orange;
        }

        .switch {
            margin-top: 20px;
            cursor: pointer;
        }
        input::placeholder {
          color: orange;
        }

        option{
          background-color: #101010; /* Dark background like your body's background */
          color: orange; /* Orange text to match your theme */
          padding: 5px 10px;
           /* Some padding for better appearance */
        }
        
        .form-row {
          display: flex;
          justify-content: space-between;
          width: 100%;
          align-items: center;
          margin-bottom: 10px;
          }

          .form-row .form-group {
          width: 45%; /* Adjust this value according to your design preference */
          }

/* Media query for smaller screens, for example below 768px (you can adjust this value) */
 
    </style>
    
</head>

<body style="background-image: url(images/imagplus/GERBERAFARMER.jpg);background-repeat:no-repeat;background-position:center center; background-size:cover;  background-attachment:fixed;">
    
    <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    
    
   
   
    <div class="container" id="X">
                        <div class="form-row">	
    <%
        List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList != null && !cropList.isEmpty()) {
            for (CropListingDetails crop : cropList) {
    %>
                             <div class="form-group">
							  <img class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="height:200px;width:90%">
							    
                            </div>
                            <div class="form-group">
                              <h4 class="card-title">Crop Name: <%= crop.getCropName() %>  </h4> 
							  <h4 class="card-title">Farmer Name: <%= crop.getFarmerName() %>   </h4>
                              <h4 class="card-title">City: <%= crop.getCity() %></h4> 
                              <h4 class="card-title">Crop Variety: <%=  crop.getCropVariety() %></h4>
                              <h4 class="card-title">Listed Date: <%= crop.getLDateTime() %></h4>
                            </div>
							
                           <div class="form-group">
                              <h4 class="card-title">Sale Started: <%= crop.getStartDate() %></h4>
                              <h4 class="card-title">Sale Ends: <%= crop.getEndDate() %></h4>
                              <h4 class="card-title">Crop Quantity: <%= crop.getCropQuantity() %></h4>
                              <U><h2 class="card-title">Listing Price: <%= crop.getListPrice() %></h2></U>
                               
                            </div>
                            
                       </div> 
  
    
        <form method="post" action="BiddingPage" class="register-form"
							id="BiddingPage-form" onsubmit="validateForm(event)" enctype="multipart/form-data">
							<input type="hidden" name="cid" value="<%= crop.getId() %>">
							<input type="hidden" name="FAA" value="<%= crop.getFarmerAadhar() %>">
							<input type="hidden" name="CN" value="<%= crop.getCropName() %>">
							<input type="hidden" name="CT" value="<%= crop.getCropType() %>">
							<input type="hidden" name="CV" value="<%= crop.getCropVariety() %>">
							<input type="hidden" name="CQ" value="<%= crop.getCropQuantity() %>">
							<input type="hidden" name="LP" value="<%= crop.getListPrice() %>">
							<input type="hidden" name="SD" value="<%= crop.getStartDate() %>">
							<input type="hidden" name="ED" value="<%= crop.getEndDate() %>">
							<input type="hidden" name="CC" value="<%= crop.getCity() %>">
							<input type="hidden" name="FN" value="<%= crop.getFarmerName() %>">
							<input type="hidden" name="IMGFN" value="<%= crop.getImgFileName()%>">
							<input type="hidden" name="FP" value="<%= crop.getPhone() %>">
							
                        <p>~~~~~~~~~~~~~~~~~ Buyer Details ~~~~~~~~~~~~~~~~~</p>	
						<div class="form-row">	
							<div class="form-group">
                               <label for="name"><h4><i class="fas fa-user"></i> Buyer Name : <%=session.getAttribute("name") %></h4> </label> 
                               <!--  >input type="text" name="Buyer-name" placeholder="Enter Name" minlength="3" required maxlength="50"-->
                               <input type="hidden" name="Buyer-name" value="<%=session.getAttribute("name") %>">
							
                           
								<label for="Adhar"><h4><i class="fas fa-id-card"></i> Aadhar Number : <%=session.getAttribute("Adhar") %></h4></label> 
                                    <!--  --input type="text" name="BAdhar" placeholder="Aadhar Number" required maxlength="12"-->
                                    <input type="hidden" name="BAdhar" value="<%=session.getAttribute("Adhar") %>">
							
                            </div>
                          
							<div class="form-group">
								<label for="contact"><h4><i class="fas fa-phone"></i> Phone : <%=session.getAttribute("Contact") %></h4></label> 
                                <!--  ->input type="text" name="contact" placeholder="Phone" required maxlength="10"-->
                                <input type="hidden" name="contact" value="<%=session.getAttribute("Contact") %>">
							 
						
                                <label for="City"><h4><i class="fas fa-map-marked-alt"></i> District : <%=session.getAttribute("City") %></h4></label>                                
                                <!--  >input type="text" list="mylist" placeholder="Enter City"  size="2"  name="City" required/-->
                            	<input type="hidden" name="City" value="<%=session.getAttribute("City") %>">    
                            </div>	
					  </div>
					  <div class="form-row">
                           <div class="form-group">
                               <label for="price"><i class="fas fa-hand-holding-usd"></i> Bid Price in Rupees</label> 
                               <input type="text" name="bid-price" placeholder="Ex: Rs.3000 per Quintal" required maxlength="60">
                           </div>
                           
                            <div class="form-group">
                                <label for="email"><i class="fas fa-id-card"></i>  Pancard </label> 
                                <input type="text" name="BPAN" placeholder="Enter Pan" required maxlength="10" > 
                            </div>
                      </div> 
                      
                      		<div class="form-group">            
                               <label for="buyer-pictures"><i class="fas fa-images"></i> passport-size photo (max:1,Size:5MB)</label> 
                                <Br> 
                               <input type="file" id="buyer-pictures" name="buyer-pictures[]" accept="image/*"  required>                                                        
                            </div> 
                             
			                <div class="form-group"><br>
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" required/> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
							    
								<button type="submit" name="signup" id="signup"
									class="form-submit" value="Register" >Confirm Biding</button>
							</div><br>
						</form>
						
<%
            }
        } else {
    %>
    <p>No crop details found.</p>
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
	            swal("Congrats", "Bid Placed Successfully", "success");
	        }else if (status == "foreign_key_error") {
	            swal("Sorry", "Looks Like The Entered Aadhar Is Not Registered :( ", "error");
	        } else if (status == "unique_constraint_error") {
	        	swal("Sorry", "Looks Like This Bid is Already Placed Before :| ", "error");
	        } else if (status == "Invalid_SelfBid_error") {
	        	swal("Sorry", " Looks Like This Is Your Listing, You Can not Bid On Your Own Crop :| ", "error");
	        }else if (status == "null") {
	        	swal({
	        		  title: "WELCOME TO BIDDING PAGE",
	        		  text: "Please Enter The Details To Place Your Bid",
	        		  icon: "info",
	        		  button: "OK",
	        		  closeOnClickOutside: false
	        		}); }
	        else {
	            swal("Sorry", "Looks Like There was an error Please Try Again :( ", "error");
	        }
	    });

	    document.getElementById('buyer-pictures').addEventListener('change', function() {
	        var files = this.files;
	        var maxSize = 5 * 1024 * 1024; // 5 MB for image
	        var maxFiles = 1; // Allow only 1 image

	        if (files.length !== maxFiles) {
	            alert('Please select only one image.');
	            this.value = ''; // Clear the input field
	            return;
	        }

	        if (files[0].size > maxSize) {
	            alert('The selected image exceeds the maximum file size of 5 MB.');
	            this.value = ''; // Clear the input field
	            return;
	        }
	    });     
            
    


	</script>
</body>

</html>
