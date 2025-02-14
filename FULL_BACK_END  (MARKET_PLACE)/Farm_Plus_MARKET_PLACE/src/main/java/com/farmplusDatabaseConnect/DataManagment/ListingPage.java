package com.farmplusDatabaseConnect.DataManagment;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ListingPage")
@MultipartConfig
public class ListingPage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("first-name");
        String uadhar = request.getParameter("Adhar");
        String umobile = request.getParameter("contact");
        String ucity = request.getParameter("City");
        String cname = request.getParameter("crop-name");
        String cvariety = request.getParameter("crop-variety");
        String CSdate = request.getParameter("start-date");
        String CEdate = request.getParameter("end-date");
        String Cquantity = request.getParameter("Crop-quantity");
        String ListPrice = request.getParameter("ListPrice");
        String FWype = request.getParameter("role");
        String FRtype = request.getParameter("role");
        String VGype = request.getParameter("role");
        String SPype = request.getParameter("role");
        String Otype = request.getParameter("role");
        String Cpictures = request.getParameter("crop-pictures[]");
     // Check if Cpictures is null (no images uploaded)
        if (Cpictures == null || Cpictures.isEmpty()) {
            Cpictures = ""; // Set to empty string
        }

        // Assuming Cpictures is a comma-separated list of image filenames
        String[] imageNames = Cpictures.split(",");

        Part file=request.getPart("crop-pictures[]");
        String imageFileName=file.getSubmittedFileName();
        imageFileName = generateUniqueFileName(imageFileName); // Generate unique file name
        System.out.println("Selected image:"+imageFileName);
        String uploadPath="D:/eclipse WS PRACTICES/Project FARM+ BG advj/FarmMpRegistration1/src/main/webapp/uploads/"+imageFileName;
        System.out.println("Selected Path:"+uploadPath);
        
        
        
        //databaseConnection
        
        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl", "system", "tiger");
            pst = con.prepareStatement("INSERT INTO CropListingDetailsMain (Fname, FAadhar, Phone, City, Cropname, CropVariety, LFDuration, LEDuration, Cquantity, Cprice, CType, CIMAGE_NAME1) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setString(1, fname);
            pst.setString(2, uadhar);
            pst.setString(3, umobile);
            pst.setString(4, ucity);
            pst.setString(5, cname);
            pst.setString(6, cvariety);
            pst.setString(7, CSdate);
            pst.setString(8, CEdate);
            pst.setString(9, Cquantity);
            pst.setString(10, ListPrice);
            pst.setString(11, FWype != null ? FWype : (FRtype != null ? FRtype : (VGype != null ? VGype : (SPype != null ? SPype : Otype))));
            pst.setString(12, imageFileName);
            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
                System.out.println("Insertion into CropDetails failed.");
            }
            
          //uploading submitted image
            try {
            	 
            	FileOutputStream fos=new FileOutputStream(uploadPath);
            	InputStream is=file.getInputStream();
            	
            	byte[] data=new byte[is.available()];
            	is.read(data);
            	fos.write(data);
            	fos.close();
            	
            }catch(Exception e) {
                e.printStackTrace();	
            }
        } catch (SQLException | ClassNotFoundException e) {
        	if (e.getMessage().contains("ORA-02291")) { // Foreign key constraint error
                request.setAttribute("status", "foreign_key_error");
            } else if (e.getMessage().contains("ORA-00001")) { // Unique constraint violation error
                request.setAttribute("status", "unique_constraint_error");
            } else {
                request.setAttribute("status", "error");
            }
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if ("success".equals(request.getAttribute("status"))) {
        	
            // If success, forward to login.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListingPage.jsp");
            dispatcher.forward(request, response);
        } else {
            // If not success, forward back to the same page
            RequestDispatcher dispatcher = request.getRequestDispatcher("ListingPage.jsp");
            dispatcher.forward(request, response);
        }
      }

    private String generateUniqueFileName(String fileName) {
        String[] parts = fileName.split("\\.");
        String extension = parts[parts.length - 1]; // Get file extension
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        return timeStamp + "_" + UUID.randomUUID().toString() + "." + extension;
    }
}
