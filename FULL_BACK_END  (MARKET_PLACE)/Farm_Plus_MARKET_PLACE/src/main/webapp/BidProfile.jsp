<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bid Profile</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
<script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>
    <style>
        #X {
       display: flex;
  overflow-x: auto;
  padding: 20px; 
  gap: 15px;
    }

    /* Style for individual grid items (cards) */


#X .card {
        background-color: #fff; /* Background color for cards */
        border: 1px solid #ccc; /* Border for cards */
        border-radius: 8px; /* Border radius for rounded corners */
        padding: 20px; /* Padding inside cards */
    }
   

    #k {
        padding: 10px 15px;
    }
    
  

    /* Optional: Adjust styles for responsive design */
    

    form {
        display: flex;
        gap: 10px;
        justify-content: center; /* Horizontally center the form */
        align-items: flex-start; /* Align the form to the top */
        margin-top: 50px; /* Add top margin to the form */
    }
   

/* Media query for smaller screens, for example below 768px (you can adjust this value) */
 
    </style>
    
</head>

<body style="background-image: url(images/imagplus/GERBERAFARMER.jpg);background-repeat:no-repeat;background-position:center center; background-size:cover;  background-attachment:fixed;">
    
    <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
    
    
   
   
    <div class="container mt-3" id="X">
                        
    <%
        List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");
    
    
    
    
    
        if (cropList != null && !cropList.isEmpty()) {
            for (CropListingDetails crop : cropList) {
    %>
                      
                       
 <div class="container mt-3" >
    <div class="card" style="width:410px">
        <img class="card-img-top" src="uploads/<%= crop.getImgFileName() %>" alt="Card image" style="height:300px;width:100%">
        <div class="card-body">
            
            </p> This <u><B><%= crop.getCropName() %></B></u> crop was listed by <u><B><%= crop.getFarmerName() %></B></u> which is of the Variety <u><B><%= crop.getCropVariety() %></B></u> 
           and Quantity of <u><B><%= crop.getCropQuantity() %></B></u>  for the price <u><B><%= crop.getListPrice() %></B></u> from the City <%= crop.getCity() %>.
           It will remain listed from <u><B><%= crop.getStartDate()%></B></u> to <u><B><%= crop.getEndDate() %></B></u>. </p>
            
            <center><h4 class="card-title"><u><B>Current Bidders:</B></u></h4>   
            <h5 class="card-title">Bidder Name: <%= crop.getBNAME() %>   </h5>
            <h5 class="card-title">Bid Price: <%= crop.getBIDPRICE() %>   </h5>
            <h5 class="card-title">Bidder Aadhar: <%= crop.getBAADHAR() %>   </h5>
            <h5 class="card-title">Bidder phone: <%= crop.getBPHONE() %>   </h5>
            <h5 class="card-title">Bidder City: <%= crop.getBCITY() %>   </h5>
            </center>                                      
       </div>
    </div>
</div>
                       						
<%
            }
        } else {
    %>
    <h1 style="bgcolor:Black">No Bids Found At The Movement.</h1>
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
	        }else if (status == "null") {
	        	swal({
	        		  title: "Welcome To Crop Profile Page",
	        		  icon: "info",
	        		  button: "OK",
	        		  closeOnClickOutside: false
	        		}); }
	        else {
	            swal("Sorry", "Looks Like There was an error Please Try Again :( ", "error");
	        }
	    });

           
            
    

	</script>

</body>
</html>