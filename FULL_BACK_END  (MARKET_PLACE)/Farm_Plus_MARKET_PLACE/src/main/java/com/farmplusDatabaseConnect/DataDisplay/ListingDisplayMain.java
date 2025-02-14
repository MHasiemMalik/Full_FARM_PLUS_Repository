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
 * Servlet implementation class ListingDisplay
 */
@WebServlet("/ListingDisplayMain")
public class ListingDisplayMain extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListingDisplayMain() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
        System.out.println("Hello");

        String selectedType = request.getParameter("cropType");

        Connection con = null;
        Statement smt = null;
        ResultSet rs = null;

        List<CropListingDetails> cropList = new ArrayList<>();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl", "system", "tiger");
            smt = con.createStatement();
            String query = "SELECT * FROM CropListingDetailsMain WHERE CType = '" + selectedType + "'";

            rs = smt.executeQuery(query);

            while (rs.next()) {
                CropListingDetails crop = new CropListingDetails();
                crop.setId(rs.getInt("ID"));
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
                cropList.add(crop);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (smt != null)
                    smt.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println(cropList); 
        request.setAttribute("cropList", cropList);
        RequestDispatcher rd = request.getRequestDispatcher("ListedDetailsViewer.jsp");
        rd.forward(request, response);
    }

}
