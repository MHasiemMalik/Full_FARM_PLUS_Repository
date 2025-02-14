package com.farmplusDatabaseConnect.DataDisplay;

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

/**
 * Servlet implementation class ListedButNoBids
 */
@WebServlet("/ListedButNoBids")
public class ListedButNoBids extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListedButNoBids() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
        System.out.println("ID parameter value: " + id);
        
        if (id != null) {
            List<CropListingDetails> cropList = fetchDataFromDatabase(id);
            request.setAttribute("cropList", cropList);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("ListedButNoBid.jsp");
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
            String query = "SELECT * FROM CROPLISTINGDETAILSMAIN WHERE FAADHAR = '" + id + "'";
            
            /*String query = "SELECT * FROM CROPBIDDINGDETAILSMAIN WHERE FAADHAR = '" + id + "' ORDER BY TO_NUMBER(REGEXP_SUBSTR(BIDPRICE, '\\d+'))";
String query = "SELECT CLM.ID AS Listing_ID, CLM.FNAME AS Listing_Farmer_Name, CLM.FAADHAR AS Farmer_Aadhar, CLM.PHONE AS Farmer_Phone, CLM.CITY AS Farmer_City, CLM.CROPNAME AS Crop_Name, CLM.CROPVARIETY AS Crop_Viety, CLM.LFDURATION AS Listing_Duration, CLM.LEDURATION AS Listing_End_Date, CLM.CQUANTITY AS Crop_Quantity, CLM.CPRICE AS Crop_Price, CLM.CTYPE AS Crop_Type, CLM.CIMAGE_NAME1 AS Crop_Image, CBM.BID AS Bid_ID, CBM.BNAME AS Bidder_Name, CBM.BAADHAR AS Bidder_Aadhar, CBM.BPHONE AS Bidder_Phone, CBM.BCITY AS Bidder_City, CBM.BIDPRICE AS Bid_Price FROM CROPLISTINGDETAILSMAIN CLM JOIN CROPBIDDINGDETAILSMAIN CBM ON CLM.FAADHAR = CBM.FAADHAR WHERE CLM.FAADHAR ='" + id + "'";
            
*/
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                CropListingDetails crop = new CropListingDetails();
                crop.setId(rs.getInt("ID"));
                crop.setFarmerAadhar(rs.getLong("FAADHAR"));
                crop.setCropName(rs.getString("CROPNAME"));
                crop.setCropType(rs.getString("CTYPE"));
                crop.setCropVariety(rs.getString("CROPVARIETY"));
                crop.setCropQuantity(rs.getString("CQUANTITY"));
                crop.setListPrice(rs.getString("CPRICE"));
                crop.setStartDate(rs.getString("LFDURATION"));
                crop.setEndDate(rs.getString("LEDURATION"));
                crop.setCity(rs.getString("CITY"));
                crop.setFarmerName(rs.getString("FNAME"));
                crop.setPhone(rs.getLong("PHONE"));
                crop.setImgFileName(rs.getString("CIMAGE_NAME1"));
                
                /*crop.setBAADHAR(rs.getLong("BAADHAR"));
                crop.setBPHONE(rs.getLong("BPHONE"));
                crop.setBNAME(rs.getString("BNAME"));
                crop.setBCITY(rs.getString("BCITY"));
                crop.setBIDPRICE(rs.getString("BIDPRICE"));*/
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
