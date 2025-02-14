<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contract Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

    <script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>
    <script>
    function validateForm(event) {
        // Prevent form submission
        event.preventDefault();

        // Validation for PAN Card (should be exactly 10 alphanumeric characters)
        var panCard = document.getElementsByName("FPAN")[0].value;
        if (!/^[A-Z]{5}[0-9]{4}[A-Z]{1}$/.test(panCard)) {
            alert("Enter a valid PAN card number (e.g., ABCDE1234F)");
            return false;
        }

        // If validation passes, submit the form
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
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
        #X{
        	margin-top:1.5%;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px white;
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
            background-color: white;
            color: #101010;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        #X:hover{
            box-shadow: 0 0 5px white,
                        0 0 25px white,
                        0 0 50px white;
        }
        button:hover {
            box-shadow:0 0 5px white,
                        0 0 25px white,
                        0 0 50px white,
                        0 0 100px white,
                        0 0 200px white;
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

<body style="background-image: url(images/imagplus/rose.jpg);background-repeat:no-repeat;background-position:center center; background-size:cover;  background-attachment:fixed;">
    
    <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    
    
   
     
    <div class="container" id="X">
    					<p>~~~~~~~~~~~~~~~~~~~~~~ Crop Details ~~~~~~~~~~~~~~~~~~~~~~</p>
                        <div class="form-row">	
    <%
        List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList != null && !cropList.isEmpty()) {
            for (CropListingDetails crop : cropList) {
    %>
                            <div class="form-group">
                           	  <h4 class="card-title"><i class="fab fa-pagelines"></i> Crop Name: <%= crop.getCropName() %>  </h4>  
                              <h4 class="card-title"><i class="fas fa-leaf"></i> Crop Variety: <%=  crop.getCropVariety() %></h4>
                              <h4 class="card-title"><i class="fas fa-balance-scale"></i> Crop Type: <%= crop.getCropType() %></h4>                                                           
                              <h4 class="card-title"><i class="fas fa-balance-scale"></i> Crop Quantity: <%= crop.getCropQuantity() %></h4>                              
                              </div>
                              
                            <div class="form-group">
                              <h4 class="card-title"><i class="fas fa-user"></i> Listed On: <%= crop.getLDateTime() %>  </h4>                                                                                                                                           	
                              <h4 class="card-title"><i class="fas fa-calendar-alt"></i> Sale Start Date: <%= crop.getStartDate() %></h4>         
							  <h4 class="card-title"><i class="fas fa-calendar-alt"></i> Sale End Date: <%= crop.getEndDate() %></h4>							  
							  <U><h4 class="card-title"><i class="fas fa-coins"></i> Listing Price: <%= crop.getListPrice() %></h4></U>                                
						    
                              </div>
                            <div class="form-group">
							  <img class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="height:150px;width:90%">
							 </div>
      
                        </div>
                        <p>~~~~~~~~~~~~~~~~~~~~~~ Buyer Details ~~~~~~~~~~~~~~~~~~~~~~</p>
                        <div class="form-row">
                        
                       		<div class="form-group">
                              <h4 class="card-title"><i class="fas fa-user"></i> Bidder Name: <%= crop.getBNAME() %>  </h4> 
							  <h4 class="card-title"><i class="fas fa-id-card"></i> Bidder Aadhar: <%= crop.getBAADHAR() %>   </h4>
							  <h4 class="card-title"><i class="fas fa-phone"></i> Bidder Phone: <%= crop.getBPHONE() %></h4> 
                              <h4 class="card-title"><i class="fas fa-phone"></i> Bidder PAN: <%= crop.getBPAN() %></h4> 
                              
                            </div>
                            <div class="form-group">
                              <h4 class="card-title"><i class="fas fa-map-marked-alt"></i> Bidder City: <%=  crop.getBCITY() %></h4> 
                              <U><h4 class="card-title"><i class="fas fa-coins"></i> Bid Price: <%= crop.getBIDPRICE() %></h4></U>
                           	  <h4 class="card-title"><i class="fas fa-calendar-alt"></i> Bid Date: <%= crop.getBDateTime() %></h4>                                                               
                            </div>
                            
                            
                           <div class="form-group">
							  <img class="card-img-top" src="UserPassportPics/Bidders/<%= crop.getBphoto() %>" alt="Card image" style="height:150px;width:90%">
							 </div>
                       
                       </div> 
                       
        <form method="post" action="ContractPage" class="register-form"
							id="BiddingPage-form" onsubmit="validateForm(event)" enctype="multipart/form-data">
							<input type="hidden" name="bid" value="<%= crop.getId() %>">
							<input type="hidden" name="cid" value="<%= crop.getId2() %>">							
							<input type="hidden" name="FAA" value="<%= crop.getFarmerAadhar() %>">
							<input type="hidden" name="CN" value="<%= crop.getCropName() %>">
							<input type="hidden" name="CT" value="<%= crop.getCropType() %>">
							<input type="hidden" name="CV" value="<%= crop.getCropVariety() %>">
							<input type="hidden" name="CQ" value="<%= crop.getCropQuantity() %>">
							<input type="hidden" name="LPR" value="<%= crop.getListPrice() %>">
							<input type="hidden" name="SD" value="<%= crop.getStartDate() %>">
							<input type="hidden" name="ED" value="<%= crop.getEndDate() %>">
							<input type="hidden" name="FC" value="<%= crop.getCity() %>">
							<input type="hidden" name="FN" value="<%= crop.getFarmerName() %>">
							<input type="hidden" name="IMGFN" value="<%= crop.getImgFileName()%>">
							<input type="hidden" name="FP" value="<%= crop.getPhone() %>">
							<input type="hidden" name="LDT" value="<%= crop.getLDateTime() %>">
							
							
							
							<input type="hidden" name="BN" value="<%= crop.getBNAME() %>">
							<input type="hidden" name="BAA" value=" <%= crop.getBAADHAR() %>">
							<input type="hidden" name="BP" value="<%= crop.getBPHONE() %>">
							<input type="hidden" name="BC" value="<%=  crop.getBCITY() %>">
							<input type="hidden" name="BPR" value="<%= crop.getBIDPRICE() %>">
							<input type="hidden" name="BDT" value="<%= crop.getBDateTime() %>">
							<input type="hidden" name="BPAN" value="<%= crop.getBPAN() %>">
							<input type="hidden" name="BIMGFN" value="<%= crop.getBphoto() %>">
							
							
							
							
							
							<p>~~~~~~~~~~~~~~~~~~~~~~ Complete Your Details ~~~~~~~~~~~~~~~~~~~~~~</p>	
                       <div class="form-row"> 
                        
                            
							<div class="form-group">
                              <h4 class="card-title"><i class="fas fa-user"></i> Farmer Name: <%= crop.getFarmerName() %>   </h4>
                              <h4 class="card-title"><i class="fas fa-id-card"></i> Aadhar Number: <%= crop.getFarmerAadhar() %></h4> 
                            </div> 
                            <div class="form-group">
                              <h4 class="card-title"><i class="fas fa-phone"></i> Phone Number: <%= crop.getPhone() %>   </h4>
                              <h4 class="card-title"><i class="fas fa-map-marked-alt"></i> Farmer City: <%= crop.getCity() %></h4>     
                            </div>
                                                                                                     	
                            <div class="form-group">
                                <label for="seller-pictures"><i class="fas fa-images"></i> passport-size photo (max:1,Size:5MB)</label> 
                                <input type="file" id="seller-pictures" name="seller-pictures[]" accept="image/*"  required> 
                                <Br>                          
                            
                                <label for="email"><i class="fas fa-id-card"></i>  Pancard </label> 
                                <input type="text" name="FPAN" placeholder="Enter Pan" required maxlength="10" > 
                            </div>  
                            
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
									class="form-submit" value="Register" >Proceed</button>
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
	            swal("Congrats", "Notification Sent to the Bidder Successfully Keep an eye on the contract section", "success");
	        }else if (status == "foreign_key_error") {
	            swal("Sorry", "Looks Like The Entered Aadhar Is Not Registered :( ", "error");
	        } else if (status == "unique_constraint_error") {
	        	swal("Sorry", "Looks Like You Have Already Proceeded With The Contract! Visit The Contract Section. :| ", "error");
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

           
            
	    document.getElementById('seller-pictures').addEventListener('change', function() {
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
