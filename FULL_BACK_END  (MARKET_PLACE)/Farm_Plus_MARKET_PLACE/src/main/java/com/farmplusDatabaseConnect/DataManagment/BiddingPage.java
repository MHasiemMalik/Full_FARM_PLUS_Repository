package com.farmplusDatabaseConnect.DataManagment;

import java.io.IOException;

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

/**
 * Servlet implementation class BiddingPage
 */
@WebServlet("/BiddingPage")
@MultipartConfig
public class BiddingPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Cid = request.getParameter("cid");
		String Faadhar = request.getParameter("FAA");
        String Cropname = request.getParameter("CN");
        String CType = request.getParameter("CT");
        String CropVariety = request.getParameter("CV");
        String Cquantity = request.getParameter("CQ");
        String Cprice = request.getParameter("LP");
        String LFDuration = request.getParameter("SD");
        String LEDuration = request.getParameter("ED");
        String FCity = request.getParameter("CC");
        String Fname = request.getParameter("FN");
        String CIMAGE_NAME1 = request.getParameter("IMGFN");
        String FPhone = request.getParameter("FP");
        String Buyername = request.getParameter("Buyer-name");
        String BAdhar = request.getParameter("BAdhar");
        String contact = request.getParameter("contact");
        String City = request.getParameter("City");
        String bidprice = request.getParameter("bid-price");
        
        String bpan = request.getParameter("BPAN");
        String spictures = request.getParameter("buyer-pictures[]");

        if (spictures == null || spictures.isEmpty()) {
            spictures = "";
        }

        String[] imageNames = spictures.split(",");

        Part file = request.getPart("buyer-pictures[]");
        String imageFileName = file.getSubmittedFileName();
        imageFileName = generateUniqueFileName(imageFileName);
        System.out.println("Selected image: " + imageFileName);
        String uploadPath = "D:/eclipse WS PRACTICES/Project FARM+ BG advj/FarmMpRegistration1/src/main/webapp/UserPassportPics/Bidders/" + imageFileName;
        System.out.println("Selected Path: " + uploadPath);
        
        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl", "system", "tiger");
            pst = con.prepareStatement("INSERT INTO CropBiddingDetailsMain (Cid, Fname,FAadhar, FPHONE,FCity, Cropname, CropVariety, LFDuration, LEDuration, Cquantity, Cprice, CType, CIMAGE_NAME1,BName,BAadhar,BPhone,BCity,BidPrice,BPAN,BPHOTO_NAME) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?)");
            pst.setString(1, Cid);
            pst.setString(2, Fname);
            pst.setString(3, Faadhar);
            pst.setString(4, FPhone);
            pst.setString(5, FCity);
            pst.setString(6, Cropname);
            pst.setString(7, CropVariety);
            pst.setString(8, LFDuration);
            pst.setString(9, LEDuration);
            pst.setString(10, Cquantity);
            pst.setString(11, Cprice);
            pst.setString(12, CType);
            pst.setString(13, CIMAGE_NAME1);
            pst.setString(14, Buyername);
            pst.setString(15, BAdhar);
            pst.setString(16, contact);
            pst.setString(17, City);
            pst.setString(18, bidprice);
            
            pst.setString(19, bpan);
            pst.setString(20, imageFileName);
            
            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
                System.out.println("Insertion into CropDetails failed.");
            }
            try (FileOutputStream fos = new FileOutputStream(uploadPath); InputStream is = file.getInputStream()) {
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
          //uploading submitted image
        } catch (SQLException | ClassNotFoundException e) {
        	if (e.getMessage().contains("ORA-02291")) { // Foreign key constraint error
                request.setAttribute("status", "foreign_key_error");
            } else if (e.getMessage().contains("ORA-00001")) { // Unique constraint violation error
                request.setAttribute("status", "unique_constraint_error");
            }else if (e.getMessage().contains("ORA-02290")) { // Unique constraint violation error
                request.setAttribute("status", "Invalid_SelfBid_error");
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
            RequestDispatcher dispatcher = request.getRequestDispatcher("BiddingPageMain.jsp");
            dispatcher.forward(request, response);
        } else {
            // If not success, forward back to the same page
            RequestDispatcher dispatcher = request.getRequestDispatcher("BiddingPageMain.jsp");
            dispatcher.forward(request, response);
        }
      }
	private String generateUniqueFileName(String fileName) {
        String[] parts = fileName.split("\\.");
        String extension = parts[parts.length - 1];
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        return timeStamp + "_" + UUID.randomUUID().toString() + "." + extension;
    }
}
	
	


