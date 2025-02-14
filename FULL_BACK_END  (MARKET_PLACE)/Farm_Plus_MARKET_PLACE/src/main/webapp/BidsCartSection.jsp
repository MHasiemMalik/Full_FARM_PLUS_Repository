<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.farmplusDatabaseConnect.DataDisplay.CropListingDetails" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Latest Bids</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/f25cce70b4.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-image: url(images/imagplus/LILIE2.jpg);
            background-repeat: no-repeat;
            background-position: center center;
            background-size: cover;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
            color: #fff; /* Default text color */
        }

        .container {
            margin-top: 30px;
        }

        .card {
            margin-bottom: 20px;
            border-radius: 8px;
            overflow: hidden;
            background-color: rgba(0, 0, 0, 0.67);
        }

        .card-body {
            padding: 15px;
        }

        .card-img-top {
            width: 100%;
            height: 250px;
            padding:5px;
        }

        .card-description {
            font-size: 16px;
            color: #fff;
            font-weight: 500;
            text-align: justify;
        }

        .image-section {
            background-color: rgba(0, 0, 0, 0.67); /* Transparent black background */
            padding: 15px;
            border-radius: 8px;
            text-align: center;
        }

        .text-center-custom {
            text-align: center;
            font-size: 18px;
        }
        #B1{
        padding: 10px 20px;
            border: none;
            background-color: rgb(5, 234, 5);
            color: #101010;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        
        }
        #B1:hover{
            box-shadow:0 0 5px rgb(5, 234, 5),
                        0 0 25px rgb(5, 234, 5),
                        0 0 50px rgb(5, 234, 5),
                        0 0 100px rgb(5, 234, 5),
                        0 0 200px rgb(5, 234, 5);
         }

    </style>
</head>

<body>
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

    <div class="container">
        <div class="row">
            <%
                List<CropListingDetails> cropList = (List<CropListingDetails>) request.getAttribute("cropList");

                if (cropList != null && !cropList.isEmpty()) {
                    for (CropListingDetails crop : cropList) {
            %>

            <div class="col-md-4">
                <div class="card">
                    <!-- Crop Image -->
                    <img src="uploads/<%= crop.getImgFileName() %>" class="card-img-top" alt="Crop Image">
                    <div class="card-body">
                        <!-- Crop Description -->
                        <div class="card-description">
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
                            <H4 style="color:Orange"><b>Your Bid: <U><%= crop.getBIDPRICE() %></U></b></H4>                           
                        </div>
                    </div>
                </div>
            </div>

            <% 
                } 
                } else {
            %>
            <h1 class="text-center text-danger">You haven't Bid on anything, Yet!</h1>
            <% 
                }
            %>
        </div>
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
                    title: "Welcome To All Your latest Bids!!",
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
