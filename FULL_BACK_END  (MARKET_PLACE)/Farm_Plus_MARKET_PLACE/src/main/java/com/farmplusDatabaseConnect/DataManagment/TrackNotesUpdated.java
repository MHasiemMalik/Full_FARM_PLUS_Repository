package com.farmplusDatabaseConnect.DataManagment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TrackNotesUpdated
 */
@WebServlet("/TrackNotesUpdated")
public class TrackNotesUpdated extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TrackNotesUpdated() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Cropid = request.getParameter("CropId");
        String Status = request.getParameter("status");        
        String Logaadhar = request.getParameter("id");
        
        
        System.out.println("CropId: " + Cropid);
        System.out.println("Status: " + Status);  // Log the Status value
        System.out.println("Logaadhar: " + Logaadhar);  // Log the Logaadhar value

        
        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl", "system", "tiger");

            // Corrected the UPDATE query
            String updateQuery = "UPDATE CONTRACTS_TABLE_MAIN SET ORDERSTATUS = ?, LGSTAADHAR = ? WHERE ID = ?";

            // Prepare the statement
            pst = con.prepareStatement(updateQuery);

            // Set the values for placeholders
            pst.setString(1, Status);      // Set the value for ORDERSTATUS
            pst.setString(2, Logaadhar);   // Set the value for LGSTAADHAR
            pst.setString(3, Cropid);      // Use Cropid for the WHERE clause

            // Execute the update statement
            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
                System.out.println("Update failed.");
            }
             
        } catch (SQLException | ClassNotFoundException e) {
            if (e.getMessage().contains("ORA-02291")) { // Foreign key constraint error
                request.setAttribute("status", "foreign_key_error");
            } else if (e.getMessage().contains("ORA-00001")) { // Unique constraint violation error
                request.setAttribute("status", "unique_constraint_error");
            } else if (e.getMessage().contains("ORA-02290")) { // Invalid constraint violation error
                request.setAttribute("status", "CHECK_BADHAR_LOGADHAR_INVALIDITY");
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

        // Forward to the appropriate page
        if ("success".equals(request.getAttribute("status"))) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("TrackingLogSection.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("TrackingLogSection.jsp");
            dispatcher.forward(request, response);
        }
    }        
}
