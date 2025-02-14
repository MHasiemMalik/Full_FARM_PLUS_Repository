package com.farmplusDatabaseConnect.DataLinking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.farmplusDatabaseConnect.DataDisplay.CropListingDetails;

/**
 * Servlet implementation class BiddingProfile
 */
@WebServlet("/BiddingProfile")
public class BiddingProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
        System.out.println("ID parameter value: " + id);
        
        if (id != null) {
            List<CropListingDetails> cropList = fetchDataFromDatabase(id);
            request.setAttribute("cropList", cropList);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("BidProfile.jsp");
        rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	private List<CropListingDetails> fetchDataFromDatabase(String id) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        List<CropListingDetails> cropList = new ArrayList<>();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl", "system", "tiger");
            stmt = con.createStatement();
            String query = "SELECT * FROM CROPBIDDINGDETAILSMAIN WHERE CID = '" + id + "'";

            rs = stmt.executeQuery(query);

            while (rs.next()) {
                CropListingDetails crop = new CropListingDetails();
                crop.setId(rs.getInt("CID"));
                crop.setFarmerAadhar(rs.getLong("FAADHAR"));
                crop.setCropName(rs.getString("CROPNAME"));
                crop.setCropType(rs.getString("CTYPE"));
                crop.setCropVariety(rs.getString("CROPVARIETY"));
                crop.setCropQuantity(rs.getString("CQUANTITY"));
                crop.setListPrice(rs.getString("CPRICE"));
                crop.setStartDate(rs.getString("LFDURATION"));
                crop.setEndDate(rs.getString("LEDURATION"));
                crop.setCity(rs.getString("FCITY"));
                crop.setFarmerName(rs.getString("FNAME"));
                crop.setPhone(rs.getLong("FPHONE"));
                crop.setImgFileName(rs.getString("CIMAGE_NAME1"));
                
                crop.setBAADHAR(rs.getLong("BAADHAR"));
                crop.setBPHONE(rs.getLong("BPHONE"));
                crop.setBNAME(rs.getString("BNAME"));
                crop.setBCITY(rs.getString("BCITY"));
                crop.setBIDPRICE(rs.getString("BIDPRICE"));
                cropList.add(crop);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return cropList;
    }
}
