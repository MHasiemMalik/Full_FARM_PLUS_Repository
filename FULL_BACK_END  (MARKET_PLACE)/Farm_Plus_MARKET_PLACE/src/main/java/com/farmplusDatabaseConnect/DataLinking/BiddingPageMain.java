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

@WebServlet("/BiddingPageMain")
public class BiddingPageMain extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("ID parameter value: " + id);
        
        if (id != null) {
            List<CropListingDetails> cropList = fetchDataFromDatabase(id);
            request.setAttribute("cropList", cropList);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("BiddingPageMain.jsp");
        rd.forward(request, response);
    }

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
            String query = "SELECT * FROM CropListingDetailsMain WHERE ID = '" + id + "'";

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
                crop.setLDateTime(rs.getString("LDATETIME"));
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
