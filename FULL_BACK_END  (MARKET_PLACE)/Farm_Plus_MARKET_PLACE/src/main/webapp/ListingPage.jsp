<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produce Listing</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

    <script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>
    <script>
        function validateForm(event) {
            // Prevent form submission
            event.preventDefault();

            // Validation for Seller Name (should not contain symbols, spaces, or digits)
            var firstName = document.getElementsByName("first-name")[0].value;
            if (!/^[a-zA-Z]+$/.test(firstName)) {
                alert("Seller Name should contain only alphabets");
                return false;
            }

            var Cropname = document.getElementsByName("crop-name")[0].value;
            if (!/^[a-zA-Z]+$/.test(Cropname)) {
                alert("Crop Name should contain only alphabets");
                return false;
            }

            var CropVariety = document.getElementsByName("crop-variety")[0].value;
            if (!/^[a-zA-Z]+$/.test(CropVariety)) {
                alert("Crop Variety should contain only alphabets");
                return false;
            }
            
            // Validation for Aadhar Number (should be 12 digits)
            var aadhar = document.getElementsByName("Adhar")[0].value;
            if (!/^\d{12}$/.test(aadhar)) {
                alert("Aadhar Number should be a 12-digit number");
                return false;
            }

            // Validation for Phone Number (should be 10 digits)
            var phoneNumber = document.getElementsByName("contact")[0].value;
            if (!/^\d{10}$/.test(phoneNumber)) {
                alert("Phone Number should be a 10-digit number");
                return false;
            }
            
             
            var ListPrice = document.getElementsByName("ListPrice")[0].value;
            if (!/\d/.test(ListPrice)) {
                alert("List Price should contain at least one integer");
                return false;
            }

            // Validation for Bid Price (should contain at least one integer)
            var CropQuantity = document.getElementsByName("Crop-quantity")[0].value;
            if (!/\d/.test(CropQuantity)) {
                alert("Crop Quantity should contain at least one integer");
                return false;
            }

            // If all validations pass, submit the form
            event.target.submit();
        }
        
        
      //fileinput
        
        


/*
        //handling dates
        $(document).ready(function(){
        $('#start-date').datepicker({
            dateFormat: 'dd M yy',
            minDate: new Date(),
            onSelect: function(selectedDate) {
                // Get the selected start date
                var startDate = $(this).datepicker('getDate');
                
                // If end date is already selected
                if ($('#end-date').datepicker('getDate')) {
                    // Compare start date with end date
                    if (startDate >= $('#end-date').datepicker('getDate')) {
                        // If start date is after or equal to end date, set end date to null
                        $('#end-date').val('');
                    }
                }
                
                // Set minDate for end date to selected start date
                $('#end-date').datepicker('option', 'minDate', startDate);
            }
        });

        $('#end-date').datepicker({
            dateFormat: 'dd M yy',
            minDate: new Date(),
            onSelect: function(selectedDate) {
                // Get the selected end date
                var endDate = $(this).datepicker('getDate');
                
                // If start date is already selected
                if ($('#start-date').datepicker('getDate')) {
                    // Compare end date with start date
                    if (endDate <= $('#start-date').datepicker('getDate')) {
                        // If end date is before or equal to start date, show an alert
                        alert("End date should be after the start date.");
                        // Clear the end date field
                        $(this).val('');
                    }
                }
                
                // Set maxDate for start date to selected end date
                $('#start-date').datepicker('option', 'maxDate', endDate);
            }
        });

        // Additional check for manual entry or unexpected issues
        $('#start-date, #end-date').change(function() {
            var startDate = $('#start-date').datepicker('getDate');
            var endDate = $('#end-date').datepicker('getDate');
            
            // Check if both start and end dates are valid and in correct order
            if (startDate && endDate && startDate > endDate) {
                alert("Dates need to be in correct order.");
                // Clear both date fields
                $('#start-date, #end-date').val('');
            }
        });
    });*/

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
            
            padding-top: 30px;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgb(78, 252, 78);
            width: 700px;
            text-align: center;
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
            background-color: rgb(5, 234, 5);
            color: #101010;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        #X:hover{
            box-shadow: 0 0 5px rgb(5, 234, 5),
                        0 0 25px rgb(5, 234, 5),
                        0 0 50px rgb(5, 234, 5);
        }
        button:hover {
            box-shadow:0 0 5px rgb(5, 234, 5),
                        0 0 25px rgb(5, 234, 5),
                        0 0 50px rgb(5, 234, 5),
                        0 0 100px rgb(5, 234, 5),
                        0 0 200px rgb(5, 234, 5);
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
    
@media (max-width: 530px) {
    #X {
        width: 100%;
    }
    #register-form {
        width: auto;
    }
    body {
        padding-top: 20%;
        padding-left: 10px; /* Remove padding */
        margin: 0; /* Remove margin */
        width: 100%; /* Set width to 100% */
        min-width: 530px; /* Set minimum width to 500px */
   }
}




    </style>
    
</head>

<body style="background-image: url(images/imagplus/grapes1.jpg);background-repeat:no-repeat;background-position:center center; background-size:cover;  background-attachment:fixed;">
    
    <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <div class="container" id="X">
        <form method="post" action="ListingPage" class="register-form" enctype="multipart/form-data"
							id="Listing-form" onsubmit="validateForm(event)">
							
                        <p>~~~~~~~~~~~~~~~~~ Your Details ~~~~~~~~~~~~~~~~~</p>	
						<div class="form-row">	
							<div class="form-group">
                               <label for="name"><h4><i class="fas fa-user"></i> Your Name : <%=session.getAttribute("name") %></h4></label> 
                               <!--  >input type="text" name="-name" placeholder="Enter Name" minlength="3" required maxlength="50"-->
                               <input type="hidden" name="first-name" value="<%=session.getAttribute("name") %>">
								<label for="name"><h4><i class="fas fa-id-card"></i> Your Aadhar : <%=session.getAttribute("Adhar") %></h4></label> 
                                    <!--  --input type="text" name="Adhar" placeholder="Aadhar Number" required maxlength="12"-->
                                <input type="hidden" name="Adhar" value="<%=session.getAttribute("Adhar") %>">							
                            
								</div>
                       	<div class="form-group">
								<label for="email"><h4><i class="fas fa-phone"></i> Phone : <%=session.getAttribute("Contact") %></h4></label> 
                                <!--  >input type="text" name="contact" placeholder="Phone" required maxlength="10"--> 
                                <input type="hidden" name="contact" value="<%=session.getAttribute("Contact") %>">
							 <label for="City"><h4><i class="fas fa-map-marked-alt"></i> Your District : <%=session.getAttribute("City") %></h4></label>
                                <!-- input type="text" list="mylist" placeholder="Enter City"  size="2"  name="City" required/-->
                                <input type="hidden" name="City" value="<%=session.getAttribute("City") %>">    
                            
						</div>                               	
					  </div>
					  <p>______Crop Details______</p>
					<div class="form-row">		
                        <div class="form-group">
                            <label for="name"><i class="fab fa-pagelines"></i> Crop Name</label> 
                            <input type="text" name="crop-name" placeholder="Enter Name" minlength="3" required maxlength="50">
                        </div>
                            <br>
                        <div class="form-group">
                            <label for="name"><i class="fas fa-seedling"></i> Crop Variety</label> 
                            <input type="text" name="crop-variety" placeholder="Enter Variety" minlength="3" required maxlength="50">
                        </div>        	
					</div>
                    
                    <div class="form-row">		
                        <div class="form-group">
                            <label for="availability-duration"><i class="fas fa-calendar-alt"></i> Availability Duration [From] </label> 
                            <label for="start-date"></label> 
                            <input type="text" id="start-date" name="start-date" placeholder="Select Start Date" required>
                            <label for="end-date"></label>
                        </div>
                        &nbsp; <p>to</p>
                        <div class="form-group">
                            <label for="availability-duration"><i class="far fa-calendar-alt"></i> Availability Duration [End]</label> 
                            <label for="start-date"></label>
                            <input type="text" id="end-date" name="end-date" placeholder="Select End Date" required>
                    
                        </div>        	
                    </div>
                    
					
					<div class="form-row">		
                        <div class="form-group">
                            <label for="name"><i class="fas fa-balance-scale"></i> Crop Quantity</label> 
                            <input type="text" name="Crop-quantity" placeholder="Ex: 8 Quintals"  required maxlength="60">
                        </div>
                            <br>
                        <div class="form-group">
                            <label for="name"><i class="fas fa-coins"></i> Listing Price in Rupees</label> 
                            <input type="text" name="ListPrice" placeholder="Ex: Rs.3000 per Quintal" required maxlength="60"> 
					    </div>        	
					</div>	
                    <div class="form-row">
                        <!-- Image upload section -->
                        <div class="form-group">
                            <label for="crop-pictures"><i class="fas fa-images"></i> Crop Picture (max:1, Size: 5MB)</label> 
                            <input type="file" id="crop-pictures" name="crop-pictures[]" accept="image/*" required>
                        </div>

                         <!-- Video upload section -->
                        <div class="form-group">
                            <label for="crop-video"><i class="fas fa-video"></i> Crop Video (max:1, Size: 50MB)</label>
                            <input type="file" id="crop-video" name="crop-video" accept="video/*">
                        </div>      
                    </div><br>
                    
                    <div class="form-group">
                            <label><i class="fas fa-leaf"></i> Crop Type :</label>                    
                            <input type="radio" name="role" value="Flower" required> Flower
                            <input type="radio" name="role" value="Fruit" required> Fruit
                            <input type="radio" name="role" value="Vegetable" required> Vegetable
                            <input type="radio" name="role" value="Spice" required> Spice
                            <input type="radio" name="role" value="Other" required> Cash Crop
                    </div><br>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" required /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<button type="submit" name="signup" id="signup"
									class="form-submit" value="Register" >Confirm Listing</button>
							</div><br>
						</form>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- link rel="stylesheet" href="alert/dist/sweetalert.css">
	 -->	
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
            
    $(document).ready(function() {
        $('#start-date').datepicker({
            dateFormat: 'dd M yy',
            minDate: new Date(),
            onSelect: function(selectedDate) {
                var startDate = $(this).datepicker('getDate');
                var endDate = $('#end-date').datepicker('getDate');

                if (endDate && startDate >= endDate) {
                    $('#end-date').val('');
                    alert("End date should be after the start date.");
                }

                $('#end-date').datepicker('option', 'minDate', startDate);
            }
        });

        $('#end-date').datepicker({
            dateFormat: 'dd M yy',
            minDate: new Date(),
            onSelect: function(selectedDate) {
                var startDate = $('#start-date').datepicker('getDate');
                var endDate = $(this).datepicker('getDate');

                if (startDate && endDate <= startDate) {
                    alert("End date should be after the start date.");
                    $(this).val('');
                }

                $('#start-date').datepicker('option', 'maxDate', endDate);
            }
        });

        // Additional check for manual entry or unexpected issues
        $('#start-date, #end-date').change(function() {
            var startDate = $('#start-date').datepicker('getDate');
            var endDate = $('#end-date').datepicker('getDate');

            // Check if both start and end dates are valid and in correct order
            if (startDate && endDate && startDate > endDate) {
                alert("Dates need to be in correct order.");
                // Clear both date fields
                $('#start-date, #end-date').val('');
            }
        });
    });


    // Limit file size and number of files for image and video
document.getElementById('crop-pictures').addEventListener('change', function() {
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

document.getElementById('crop-video').addEventListener('change', function() {
    var files = this.files;
    var maxSize = 50 * 1024 * 1024; // 50 MB for video
    var maxFiles = 1; // Allow only 1 video

    if (files.length !== maxFiles) {
        alert('Please select only one video.');
        this.value = ''; // Clear the input field
        return;
    }

    if (files[0].size > maxSize) {
        alert('The selected video exceeds the maximum file size of 50 MB.');
        this.value = ''; // Clear the input field
        return;
    }
});


</script>

</body>

</html>
