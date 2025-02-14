<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crop Listing</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <!-- style type="text/css">
     
     #X {
        display: grid;
        grid-template-columns: repeat(4, 1fr); /* Three columns with equal width */
        grid-gap: 1px; /* Gap between grid items */
    }

    /* Style for individual grid items (cards) */
    #X .card {
        background-color: #fff; /* Background color for cards */
        border: 1px solid #ccc; /* Border for cards */
        border-radius: 8px; /* Border radius for rounded corners */
        padding: 20px; /* Padding inside cards */
    }

    #t {
        color: white;
    }

    #k {
        padding: 10px 15px;
    }
    
    #BK{
    
     display:flex;
     gap:10%;
     padding-left:10%;
    }

    /* Optional: Adjust styles for responsive design */
    @media (max-width: 768px) {
        #X {
            grid-template-columns: repeat(2, 1fr); /* Two columns on smaller screens */
        }
    }

    @media (max-width: 576px) {
        #X {
            grid-template-columns: 1fr; /* Single column on mobile screens */
        }
    }

    form {
        display: flex;
        gap: 10px;
        justify-content: center; /* Horizontally center the form */
        align-items: flex-start; /* Align the form to the top */
        margin-top: 50px; /* Add top margin to the form */
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
    
    #B1 {
        padding: 10px 15px;
        border: none;
        background-color: orange;
        color: #101010;
        border-radius: 5px;
        cursor: pointer;
    } 
        
   #B3:hover ,#B1:hover {
        box-shadow: 0 0 5px orange,
                    0 0 25px orange,
                    0 0 50px orange,
                    0 0 100px orange,
                    0 0 200px orange;
    }
                
    #B2:hover {
        box-shadow: 0 0 5px rgb(5, 234, 5),
                    0 0 25px rgb(5, 234, 5),
                    0 0 50px rgb(5, 234, 5),
                    0 0 100px rgb(5, 234, 5),
                    0 0 200px rgb(5, 234, 5);
    }
    </style-->
    <style type="text/css">
    body {
        font-family: Arial, sans-serif;
        background-image: url(images/imagplus/farmabc1.jpg);
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        background-attachment: fixed;
    }

    /*#X {
  display: flex;
  overflow-x: auto;
  padding: 20px; 
  gap: 15px; 
}
*/
#X {
        display: grid;
        grid-template-columns: repeat(4, 1fr); 
        grid-gap: 0px; 
        
    }
    
    

    /* Style for individual grid items (cards) */
    #X .card {
         background-color: #fff; /* Background color for cards */
    border: 1px solid #ccc; /* Border for cards */
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* Light shadow for depth */
    padding: 10px; /* Smaller padding inside cards */
    text-align: left; /* Align text to the left */
    width: 290px; /* Reduced width to better fit contents */
    margin: 0 auto; /* Center the card in its grid column */
    }

    #X .card img {
        height: 150px; /* Smaller fixed height for images */
        object-fit: cover; /* Ensure the image covers the area proportionally */
        border-radius: 8px 8px 0 0; /* Match card's border radius for the top corners */
        width: 100%;
    }

    #X .card .card-body {
        padding: 10px; /* Smaller padding inside the body */
        width:90%;
    }

    #X .card h5 {
        margin-bottom: 8px; /* Reduced space between titles */
        font-size: 14px; /* Smaller font size */
        font-weight: 500;
    }

    #X .card .btn {
        padding: 5px 10px; /* Smaller buttons */
        font-size: 12px; /* Smaller button text */
        border-radius: 4px;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    
    #t {
        color: white;
        margin-bottom: 15px;
        text-align: center;
        font-size: 18px; /* Smaller title text */
    }

    form {
        display: flex;
        gap: 10px; /* Reduced gap between elements */
        justify-content: center;
        align-items: center;
        margin: 15px 0;
    }
    #BK{
     display:flex;gap:4%;
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
    
    #B1 {
        padding: 10px 15px;
        border: none;
        background-color: orange;
        color: #101010;
        border-radius: 5px;
        cursor: pointer;
    } 
        
   #B3:hover ,#B1:hover {
        box-shadow: 0 0 5px orange,
                    0 0 25px orange,
                    0 0 50px orange,
                    0 0 100px orange,
                    0 0 200px orange;
    }
                
    #B2:hover {
        box-shadow: 0 0 5px rgb(5, 234, 5),
                    0 0 25px rgb(5, 234, 5),
                    0 0 50px rgb(5, 234, 5),
                    0 0 100px rgb(5, 234, 5),
                    0 0 200px rgb(5, 234, 5);
    }
     /* Optional: Adjust styles for responsive design */
    @media (max-width: 1268px) {
        #X {
            grid-template-columns: repeat(3, 1fr); /* Two columns on smaller screens */
        }
    }
    
    @media (max-width: 978px) {
        #X {
            grid-template-columns: repeat(2, 1fr); /* Two columns on smaller screens */
        }
    }

    @media (max-width: 666px) {
        #X {
            display: flex;
  			overflow-x: auto;
  			padding: 20px; 
  			gap: 15px; 
        }
    }
    
</style>
    
</head>

<body style="background-image: url(images/imagplus/farmabc1.jpg); background-repeat: no-repeat; background-position: center center; background-size: cover; background-attachment: fixed;">


<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<form method="post" action="ListingDisplayMain">
    <h3 id="t">Select Crop Type:</h3>
    <select id="k" name="cropType">
        <option value="Flower">Flower</option>
        <option value="Fruit">Fruits</option>
        <option value="Spice">Spices</option>
        <option value="Vegetable">Vegetables</option>
        <option value="Other">Other</option>
        <!-- Add options for other values -->
    </select>
    <button type="submit" id="B1" value="Search">Search</button>
</form>

<div id="X">
<% 
    List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");
    if (cropList != null && !cropList.isEmpty()) {
        for (CropListingDetails crop : cropList) {
            String ImgFileName = crop.getImgFileName();
            
            String id = String.valueOf(crop.getId());
            String cropName = crop.getCropName();
            String cropType = crop.getCropType();
            String cropVariety = crop.getCropVariety();
            String cropQuantity = crop.getCropQuantity();
            String listPrice = crop.getListPrice();
            String startDate = crop.getStartDate();
            String endDate = crop.getEndDate();
            String city = crop.getCity();
            String farmerName = crop.getFarmerName();
            String umobile = String.valueOf(crop.getPhone());

%>
<div class="container mt-3">
    <h2 id="t"><%= cropType %></h2>
    <div class="card">
        <img class="card-img-top" src="uploads/<%= ImgFileName %>" alt="Card image" style="height:250px;width:100%">
        <div class="card-body">
            <h5 class="card-title"><b>Crop Name:</b> <%= cropName %></h5>
            <h5 class="card-title"><b>Crop Variety:</b> <%= cropVariety %></h5>
            <h5 class="card-title"><b>Crop Quantity:</b> <%= cropQuantity %></h5>
            <h5 class="card-title"><b>Crop Sale Starts On:</b> <%= startDate %></h5>
            <h5 class="card-title"><b>Crop Sale Ends On:</b> <%= endDate %></h5>
            <h5 class="card-title"><b>Listing price:</b> <%= listPrice %></h5>
            <h5 class="card-title"><b>Farmer Name:</b> <%= farmerName %></h5>
            <h5 class="card-title"><b>Mobile:</b> <%= umobile %></h5>
            <h5 class="card-title"><b>City:</b> <%= city %></h5>
            
          <div id="BK">
            <form id="profileForm" action="BiddingPageMain" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <button type="submit" id="B2" class="form-submit" value="Register">Place Bid</button>
</form>   <form id="profileForm" action="BiddingProfile" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <button type="submit" id="B3" class="form-submit" value="Register">Profile</button>
</form>
          </div>

 </div>
    </div>
</div>
<% 
        }
    } else {
%>
<div class="container mt-3">
    <h2>No Option Selected</h2>
</div>
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
	        }
	    });

	</script>
</body>
</html>




<!-- 

old code

< page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<form method="post" action="ListingDisplay" >
Enter Image Id :
  <input type="number" name="EnteredId">
  <input type="Submit" Value="Display Details">
</form>


 
String imgFileName=(String)request.getAttribute("img");
String imgId=(String)request.getAttribute("id");

String Cname=(String)request.getAttribute("Cname");
String CType=(String)request.getAttribute("CType");
String cvariety=(String)request.getAttribute("cvariety");
String Cquantity=(String)request.getAttribute("Cquantity");
String ListPrice=(String)request.getAttribute("ListPrice");

String CSdate=(String)request.getAttribute("CSdate");
String CEdate=(String)request.getAttribute("CEdate");

String City=(String)request.getAttribute("City");
String fname=(String)request.getAttribute("fname");
String umobile=(String)request.getAttribute("umobile");


%>

 < 
     if(imgFileName!="" && imgId!=""){
  
  
<div class="container mt-3">
  <h2><=CType %></h2>
  <p>Crop Name: Cname %></p>
  <div class="card" style="width:400px">
    <img class="card-img-top" src="uploads/<imgFileName " alt="Card image" style="height:300px;width:100%">
    <div class="card-body">
      <h5 class="card-title">Crop Variety: cvariety </h5>
      <h5 class="card-title">Crop Quantity: Cquantity </h5>
      <h5 class="card-title">Crop Sale Started On: <CSdate %></h5>
      <h5 class="card-title">Crop Sale Ends On: <=CEdate %></h5>
      <h5 class="card-title">Listing price: Price %></h5>
      
      
      <h5 class="card-title">Farmer Name: <=fname %></h5>
      <h5 class="card-title">Mobile: <=umobile %></h5>
      <h5 class="card-title">City: <=City %></h5>
      <a href="#" class="btn btn-primary">See Profile or Bid</a>
    </div>
  </div>
</div>

< 

     }
%>






 -->



