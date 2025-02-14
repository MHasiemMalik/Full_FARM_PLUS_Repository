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
 * Servlet implementation class TrackLogisticDetails
 */
@WebServlet("/TrackLogisticDetails")
public class TrackLogisticDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrackLogisticDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("ID parameter value: " + id);
        
       if (id != null) {
            List<CropListingDetails> cropList = fetchDataFromDatabase(id);
            request.setAttribute("cropList", cropList);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("TrackingLogSection.jsp");
        rd.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            String query = "SELECT * FROM CONTRACTS_TABLE_MAIN WHERE FAADHAR = '" + id + "' OR BAADHAR = '" + id + "'";

            rs = stmt.executeQuery(query);

            while (rs.next()) {
                CropListingDetails crop = new CropListingDetails();
                crop.setcid(rs.getInt("ID"));
                crop.setId(rs.getInt("BID"));
                crop.setId2(rs.getInt("FID"));
                crop.setFarmerName(rs.getString("FNAME"));
                crop.setFarmerAadhar(rs.getLong("FAADHAR"));
                crop.setPhone(rs.getLong("FPHONE"));
                crop.setCity(rs.getString("FCITY"));
                crop.setCropName(rs.getString("CROPNAME"));
                crop.setCropType(rs.getString("CTYPE"));
                crop.setCropVariety(rs.getString("CROPVARIETY"));
                crop.setCropQuantity(rs.getString("CQUANTITY"));
                crop.setListPrice(rs.getString("CPRICE"));
                crop.setStartDate(rs.getString("LFDURATION"));
                crop.setEndDate(rs.getString("LEDURATION"));
                crop.setLDateTime(rs.getString("LDATETIME"));
                crop.setFPAN(rs.getString("FPAN"));
                crop.setFphoto(rs.getString("FPHOTO_NAME"));
                
                crop.setBNAME(rs.getString("BNAME"));
                crop.setBAADHAR(rs.getLong("BAADHAR"));
                crop.setBPHONE(rs.getLong("BPHONE"));
                crop.setBCITY(rs.getString("BCITY"));
                crop.setBIDPRICE(rs.getString("BIDPRICE"));
                crop.setBDateTime(rs.getString("BDATETIME"));
                crop.setBPAN(rs.getString("BPAN"));
                crop.setBphoto(rs.getString("BPHOTO_NAME"));
                
                crop.setCDateTime(rs.getString("CTDATEANDTIME"));              
                crop.setImgFileName(rs.getString("CIMAGE_NAME1"));
                crop.setOrderStatus(rs.getString("ORDERSTATUS"));
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
