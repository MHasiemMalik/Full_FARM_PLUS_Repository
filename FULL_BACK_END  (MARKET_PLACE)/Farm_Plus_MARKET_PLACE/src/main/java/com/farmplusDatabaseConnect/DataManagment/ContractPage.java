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

/**
 * Servlet implementation class ContractPage
 */
@WebServlet("/ContractPage")
@MultipartConfig
public class ContractPage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ContractPage() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bid = request.getParameter("bid");
        String cid = request.getParameter("cid");
        String faa = request.getParameter("FAA");
        String cn = request.getParameter("CN");
        String ct = request.getParameter("CT");
        String cv = request.getParameter("CV");
        String cq = request.getParameter("CQ");
        String lpr = request.getParameter("LPR");
        String sd = request.getParameter("SD");
        String ed = request.getParameter("ED");
        String fc = request.getParameter("FC");
        String fn = request.getParameter("FN");
        String imgfn = request.getParameter("IMGFN");
        String fp = request.getParameter("FP");
        String ldt = request.getParameter("LDT");
        String bn = request.getParameter("BN");
        String baa = request.getParameter("BAA");
        String bp = request.getParameter("BP");
        String bc = request.getParameter("BC");
        String bpr = request.getParameter("BPR");
        String bdt = request.getParameter("BDT");
        String fpan = request.getParameter("FPAN");
        
        String bpan = request.getParameter("BPAN");
        String bimg = request.getParameter("BIMGFN");
        String spictures = request.getParameter("seller-pictures[]");
        
        
        
        
        
        
        cid = cid.trim();
        bid = bid.trim();
        faa = faa.trim();
        fp= fp.trim();
        baa = baa.trim();
        bp = bp.trim();
        
        
        if (!cid.matches("\\d+")) System.out.println("Invalid FID: " + cid);
        if (!bid.matches("\\d+")) System.out.println("Invalid BID: " + bid);
        if (!faa.matches("\\d+")) System.out.println("Invalid FAADHAR: " + faa);
        if (!fp.matches("\\d+")) System.out.println("Invalid FPHONE: " + fp);
        if (!baa.matches("\\d+")) System.out.println("Invalid BAADHAR: " + baa);
        if (!bp.matches("\\d+")) System.out.println("Invalid BPHONE: " + bp);


        if (spictures == null || spictures.isEmpty()) {
            spictures = "";
        }

        String[] imageNames = spictures.split(",");

        Part file = request.getPart("seller-pictures[]");
        String imageFileName = file.getSubmittedFileName();
        imageFileName = generateUniqueFileName(imageFileName);
        System.out.println("Selected image: " + imageFileName);
        String uploadPath = "D:/eclipse WS PRACTICES/Project FARM+ BG advj/FarmMpRegistration1/src/main/webapp/UserPassportPics/Sellers/" + imageFileName;
        System.out.println("Selected Path: " + uploadPath);

        Connection con = null;
        PreparedStatement pst = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:orcl", "system", "tiger");

            pst = con.prepareStatement("INSERT INTO CONTRACTS_TABLE_MAIN "
                    + "(FID, BID, FNAME, FAADHAR, FPAN, FPHONE, FCITY, FPHOTO_NAME, CROPNAME, CROPVARIETY, LFDURATION, LEDURATION, CQUANTITY, CPRICE, CTYPE, CIMAGE_NAME1, BNAME, BAADHAR, BPAN, BPHONE, BCITY, BIDPRICE,BPHOTO_NAME, LDATETIME, BDATETIME) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.sql.Timestamp ldTimestamp = null;
            java.sql.Timestamp bdTimestamp = null;

            try {
                if (ldt != null && !ldt.trim().isEmpty()) {
                    Date ldDate = sdf.parse(ldt);
                    ldTimestamp = new java.sql.Timestamp(ldDate.getTime());
                }
                if (bdt != null && !bdt.trim().isEmpty()) {
                    Date bdDate = sdf.parse(bdt);
                    bdTimestamp = new java.sql.Timestamp(bdDate.getTime());
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("status", "date_parse_error");
                RequestDispatcher dispatcher = request.getRequestDispatcher("ContractInfo.jsp");
                dispatcher.forward(request, response);
                return;
            }

            pst.setString(1, cid);
            pst.setString(2, bid);
            pst.setString(3, fn);
            pst.setString(4, faa);
            pst.setString(5, fpan);
            pst.setString(6, fp);
            pst.setString(7, fc);
            pst.setString(8, imageFileName);
            pst.setString(9, cn);
            pst.setString(10, cv);
            pst.setString(11, sd);
            pst.setString(12, ed);
            pst.setString(13, cq);
            pst.setString(14, lpr);
            pst.setString(15, ct);
            pst.setString(16, imgfn);
            pst.setString(17, bn);
            pst.setString(18, baa);
            pst.setString(19, bpan);
            
            pst.setString(20, bp);
            pst.setString(21, bc);
            pst.setString(22, bpr);
            pst.setString(23, bimg);
            pst.setTimestamp(24, ldTimestamp);
            pst.setTimestamp(25, bdTimestamp);

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

        RequestDispatcher dispatcher = request.getRequestDispatcher("ContractInfo.jsp");
        dispatcher.forward(request, response);
    }

    private String generateUniqueFileName(String fileName) {
        String[] parts = fileName.split("\\.");
        String extension = parts[parts.length - 1];
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        return timeStamp + "_" + UUID.randomUUID().toString() + "." + extension;
    }
}
