<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listed Crops</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>
<style>
    /* Body styling with background image */
    body {
        background-image: url(images/imagplus/DEHLIAS2.jpg);
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        background-attachment: fixed;
        font-family: Arial, sans-serif;
        color: #fff; /* Default text color */
    }

    /* Center container */
    .container {
        margin-top: 20px;
    }

    /* Image section styling */
    .image-section {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: rgba(0, 0, 0, 0.67); /* Transparent black background */
        padding: 20px;
        border-radius: 8px;
    }

    .image-section img {
        display: block;
        height:300px;
        width: 360px;
        max-width: 500px;
        border: 3px solid #fff;
        border-radius: 8px;
        margin-bottom: 20px;
    }

    /* Description styling */
    .description {
        text-align: center;
        font-size: 18px;
        font-weight: 500;
    }

    /* Table styling */
    .details-table {
        width: 100%;
        margin-top: 30px;
        border-collapse: collapse;
        background-color: #fff; /* White background for the table */
        color: #000; /* Black text color for contrast */
        border-radius: 8px;
        overflow: hidden; /* Ensures the border-radius applies */
    }

    .details-table th, .details-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    .details-table th {
        background-color: #f8f9fa; /* Light gray header background */
        font-weight: bold;
    }

    .details-table tr:hover {
        background-color: #f1f1f1; /* Highlight row on hover */
    }
    
    #B2,#B1{
    padding: 10px 20px;
            border: none;
            background-color: rgb(5, 234, 5);
            color: #101010;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
    }
    #B1{
    background-color: orange;
    }
    #B2:hover{
            box-shadow:0 0 5px rgb(5, 234, 5),
                        0 0 25px rgb(5, 234, 5),
                        0 0 50px rgb(5, 234, 5),
                        0 0 100px rgb(5, 234, 5),
                        0 0 200px rgb(5, 234, 5);
    }
    #B1:hover{
            box-shadow:0 0 5px orange,
                        0 0 25px orange,
                        0 0 50px orange,
                        0 0 100px orange,
                        0 0 200px orange;
    }
</style>
</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">



<div class="container">
    <%
        List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");
        Set<String> displayedCrops = new HashSet<>(); // To track displayed crops

        if (cropList != null && !cropList.isEmpty()) {
            for (CropListingDetails crop : cropList) {
                String cropIdentifier = crop.getCropName() + crop.getCropVariety() + crop.getListPrice(); // Unique identifier for each crop

                if (!displayedCrops.contains(cropIdentifier)) {
                    displayedCrops.add(cropIdentifier); // Mark this crop as displayed
    %>
    <div class="image-section">
        <!-- Crop Image -->
        <img src="uploads/<%= crop.getImgFileName() %>" alt="Crop Image">
        <!-- Crop Description -->
        <div class="description">
            <p>
                This <u><b><%= crop.getCropName() %></b></u> was listed under the name 
                <u><b><%= crop.getFarmerName() %></b></u>, which is of the variety 
                <u><b><%= crop.getCropVariety() %></b></u> and quantity of 
                <u><b><%= crop.getCropQuantity() %></b></u> for the price 
                <u><b><%= crop.getListPrice() %></b></u> from the city 
                <u><b><%= crop.getCity() %></b></u>. 
                It will remain listed from <u><b><%= crop.getStartDate() %></b></u> to 
                <u><b><%= crop.getEndDate() %></b></u>.
            </p>
        </div>

        <!-- Table for bidder details -->
        <table class="details-table">
            <thead>
                <tr>
                    <th>Bidder Name</th>
                    <th>Bid Price</th>
                    <th>Bidder Aadhar</th>
                    <th>Bidder Phone</th>
                    <th>Bidder City</th>
                    <th>Bid Date & Time</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (CropListingDetails bidder : cropList) {
                        // Match bidders to the current crop
                        if (crop.getCropName().equals(bidder.getCropName()) &&
                            crop.getCropVariety().equals(bidder.getCropVariety()) &&
                            crop.getListPrice().equals(bidder.getListPrice())) {
                %>
                <tr>
                    <td><%= bidder.getBNAME() %></td>
                    <td><%= bidder.getBIDPRICE() %></td>
                    <td><%= bidder.getBAADHAR() %></td>
                    <td><%= bidder.getBPHONE() %></td>
                    <td><%= bidder.getBCITY() %></td>
                    <td><%= bidder.getBDateTime() %></td>
                    <td>
                        <form id="profileForm" action="SaleInterestedPage" method="post">
                            <input type="hidden" name="id" value="<%= bidder.getId() %>">
                            <center><button type="submit" id="B1" class="form-submit" value="Register">Show Interest</button></center>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
    <%
                }
            }
        } else {
    %>
    <h1 class="text-center text-danger">No Bids Found at the Moment.</h1>
    <%
        }
    %>
    <center>
    <form id="profileForm" action="ListedButNoBids" method="post">
        <input type="hidden" name="id" value="<%=session.getAttribute("Adhar") %>">
        <button type="submit" id="B2" class="form-submit" value="Register">All LISTED CROPS</button>
    </form>
    </center> 
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    $(document).ready(function() {
        var status = $("#status").val();
        console.log(status);
        if (status == "success") {
            swal("Congrats", "Bid Placed Successfully", "success");
        } else if (status == "foreign_key_error") {
            swal("Sorry", "Looks Like The Entered Aadhar Is Not Registered :( ", "error");
        } else if (status == "unique_constraint_error") {
            swal("Sorry", "Looks Like This Bid is Already Placed Before :| ", "error");
        } else if (status == "null") {
            swal({
                title: "Welcome To Your Listed Crops With Recent Bids",
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
