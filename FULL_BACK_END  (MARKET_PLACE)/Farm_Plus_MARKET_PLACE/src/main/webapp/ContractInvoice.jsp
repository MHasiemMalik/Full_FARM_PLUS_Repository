<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Futuristic Login & Signup</title>
    <script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
    <style>
        a{
            color: orange;
        }
        body {
            
            font-family: Arial, sans-serif;
            background-color: #101010;
            color: purple;
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
        

        .container {
            background-color: rgb(255, 254, 254);
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
            color: #ffffff;
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

        #X{
            /*margin-top: 10%;*/
            width: auto;
            text-align: center;
        }

        .switch {
            margin-top: 20px;
            cursor: pointer;
        }
        input::placeholder {
          color: rgb(255, 255, 255);
        }

        option{
          background-color: rgba(255, 255, 255, 0.7); /* Dark background like your body's background */
          color: rgb(0, 0, 0); /* Orange text to match your theme */
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
        
        
        /*From ChatGPT*/
          .form-group {
    position: relative;
    text-align: left;
         }

       .password-toggle {
    position: absolute;
    top: 59%;
    right: 10px;
    transform: translateY(-50%);
    cursor: pointer;
       }
       
       #register-form{    
       		padding-bottom:17%;
       }

/* Media query for smaller screens, for example below 768px (you can adjust this value) */
    @media (max-width: 428px) {
    .password-toggle {
    position: absolute;
    top: 69%;
    right: -1px;
    cursor: pointer;
     }
  }
  
  #Pic{
    padding-left:20%;
  }
    </style>
    
</head>

<body style="background-image: url(https://mhasiemmalik.github.io/FarmFlowerHRT/TP%20CP%20PICS/ASTER%20.jpg);background-repeat:no-repeat;background-position:center center; background-size:cover;  background-attachment:fixed;">
    
    <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    <div class="container" id="X">
        <form method="post" action="login" class="register-form"
							id="register-form" onsubmit="validateForm(event)">


     <%
        List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList != null && !cropList.isEmpty()) {
            for (CropListingDetails crop : cropList) {
    %>

                        <div>	
                                
                                 <div class="form-group">
                                    <img class="card-img-top" src="images/zfarmplusContractlogo.png" alt="Card image" style="height:150px;width:100%">
                                 </div>
                        </div> 
                        <p>~~~~~~~~~~~~~~~~~ This invoice is generated on <%= crop.getCDateTime() %> ~~~~~~~~~~~~~~~~~ </p>  
                          
						<br>
						<p>~~~~~~~~~~~~~~~~~~~~~~ Seller/Farmer Details ~~~~~~~~~~~~~~~~~~~~~~</p>	
						<div class="form-row">	
							<div class="form-group" style="margin-top: 2.5%;>
                               <label for="name"><i class="fas fa-user"></i> Seller Name : <span><%= crop.getFarmerName() %></span></label><br><br>
                               <label for="name"><i class="fas fa-id-card"></i> PAN : <span><%= crop.getFPAN() %></span></label> <br><br>
                               <label for="City"><i class="fas fa-map-marked-alt"></i> City : <span><%= crop.getCity() %></span></label><br><br>
                                
                            
                            </div>

                            <div class="form-group">
                            	<label for="name"><i class="fas fa-id-card"></i> Aadhar Number : <span><%= crop.getFarmerAadhar() %></span></label> <br><br>
                                <label for="name"><i class="fas fa-phone"></i> Phone Number: <%= crop.getPhone() %></label><br><br>
                                <label for="name"><i class="fab fa-pagelines"></i> Crop : <span><%= crop.getCropName() %></span> </label> 
                                     
                            </div>
                            
                             <div class="form-group">
							  <img id="Pic" class="card-img-top" src="UserPassportPics/Sellers/<%= crop.getFphoto() %>" alt="Card image" style="height:150px;width:70%">
						    </div>
                       </div> 
                       <p>~~~~~~~~~~~~~~~~~~~~~~ Buyer Details ~~~~~~~~~~~~~~~~~~~~~~</p>
                      <div class="form-row" >
                        <div class="form-group">
                            <label for="name"><i class="fas fa-user"></i> Bidder Name : <span><%= crop.getBNAME() %></span></label><br><br>
                            <label for="name"><i class="fas fa-id-card"></i> Pan : <span><%= crop.getBPAN() %></span></label> <br><br>
                            <label for="name"><i class="fas fa-phone"></i> Phone: <%= crop.getBPHONE() %></span></label> <br><br>
                            <label for="City"><i class="fas fa-map-marked-alt"></i> City : <span><%= crop.getBCITY() %></span></label><br><br>                            
                         </div>

                         <div class="form-group" >
                         	 <label for="name"><i class="fas fa-id-card"></i> Aadhar Number : <span><%= crop.getBAADHAR() %></span></label> <br><br>                            
                         	 <label for="name"><i class="fab fa-pagelines"></i> Crop : <span><%= crop.getCropName() %></span> </label> <br><br>
                         	 <label for="name"><i class="fas fa-coins"></i> Bid Price  : <span><%= crop.getBIDPRICE() %></span></label> <br><br>                                                                             
                             <label for="availability-duration"><i class="fas fa-calendar-alt"></i> Bidden On  : <span><%= crop.getBDateTime() %></span></label> <br><br>
                           
                         </div>
                         
                         <div class="form-group">
							  <img id="Pic" class="card-img-top" src="UserPassportPics/Bidders/<%= crop.getBphoto() %>" alt="Card image" style="height:150px;width:70%">
						  </div>

                         <!--div class="form-group">
                            <img class="card-img-top" src="zTestfarmerpasspic.png" alt="Card image" style="height:200px;width:90%">
                         </div-->
                        </div>
                       <p>~~~~~~~~~~~~~~~~~~~~~~ Crop Details ~~~~~~~~~~~~~~~~~~~~~~</p>
                       <div class="form-row">  
                        <div class="form-group" style="margin-bottom: 2%;">
                            <label for="name"><i class="fab fa-pagelines"></i> Crop Name : <span><%= crop.getCropName() %></span></label><br><br> 
                            <label for="name"><i class="fas fa-leaf"></i> Crop Type : <span><%= crop.getCropType() %></span></label><br><br>
                             <label for="name"><i class="fas fa-seedling"></i> Crop Location : <span><%= crop.getCity() %>(Warehouse)</span></label><br><br>                        
                            <label for="availability-duration"><i class="fas fa-calendar-alt"></i> Total Bidders  : <span>08</span></label> 
                            
                            </div>

                         <div class="form-group">
                            <label for="name"><i class="fas fa-seedling"></i> Crop Variety : <span><%=  crop.getCropVariety() %></span></label><br><br>
                            <label for="name"><i class="fas fa-balance-scale"></i> Crop Quantity : <span><%=  crop.getCropQuantity() %></span></label> <br><br>     
                            <label for="availability-duration"><i class="fas fa-calendar-alt"></i> Listed On  : <span><%= crop.getLDateTime() %></span></label> <br><br>
                             <label for="name"><i class="fas fa-coins"></i> Listing Price : <span><%= crop.getListPrice() %></span></label> <br><br>
                              
                        </div>
                         
                          <div class="form-group">
							  <img id="Pic" class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="height:160px;width:80%">
						  </div>
					  </div>
                      
                      <span>Transaction Id: Farmer5buyer5CropDate5Random10</span>
					  									
					</form>
		<%
            } %>			
					<br><button id="printButton">Print Contract</button><br>
    
<% 
        } else {
    %>
    <p>No crop details found.</p>
    <%
        }
    %>							
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- link rel="stylesheet" href="alert/dist/sweetalert.css">
	 -->	
	 <script type="text/javascript">
	      <!--var status = document.getElementById("status").value;
	      console.log(status);
	      if(status =="failed"){
	    	  swal("Sorry","The Email/Phone/Adhar is already registered :( ","error")	      
           }
	      -->
	      document.addEventListener("DOMContentLoaded", function() {
	    	    var status = document.getElementById("status").value;
	    	    console.log(status);
	    	     // Check if status has a value
	    	        if(status == "success") {
	    	            swal("Congrats", "Account Created Successfully", "success");
	    	        } else if (status == "duplicate_email") {
	    	            swal("Oops!", "Email already in use. Please use a different email address.", "error");
	    	        } else if (status == "duplicate_adhar") {
	    	            swal("Oops!", "The entered Aadhar number already in use. Please verify the Aadhar number.", "error");
	    	        } else if (status == "duplicate_contact") {
	    	            swal("Oops!", "The entered contact number is already in use. Please use a different number.", "error");
	    	        } else if (status == "error") {
	    	            swal("Oops!", "There was an issue creating your account! Please Try Again", "error");
	    	        }
	    	        else if (status == "null") {
	    	        	swal({
	    	        		  title: "WELCOME TO CONTRACT/INVOICE PAGE",
	    	        		  text: "Please Visit The Tracking Page For Further Details",
	    	        		  icon: "info",
	    	        		  button: "OK",
	    	        		  closeOnClickOutside: false
	    	        		}); }
	    	});
	      
	      
	        // JavaScript function to download the HTML content as PDF
	        document.getElementById("printButton").addEventListener("click", function () {
	            const element = document.getElementById("X");
	            const opt = {
	                margin: 0,
	                filename: 'ContractInvoice.pdf',
	                image: { type: 'jpeg', quality: 1.98 },
	                html2canvas: { scale: 5 },
	                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
	            };
	            html2pdf().set(opt).from(element).save();
	        });
	</script>
</body>

</html>
