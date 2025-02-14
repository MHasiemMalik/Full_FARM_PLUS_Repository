package com.farmplusDatabaseConnect.DataDisplay;

public class CropListingDetails {
    private int id;
    private int id2;
    private int cid;
    private String cropName;
    private String cropType;
    private String cropVariety;
    private String cropQuantity;
    private String listPrice;
    private String startDate;
    private String endDate;
    private String city;
    private String farmerName;
    private String ImgFileName;
    private long FarmerAadhar;
    private long phone;
    private String FPAN;
    private String Fphoto;
    
    
    private String BNAME;
    private long BAADHAR;
    private long BPHONE;
    private String BPAN;
    private String BCITY;
    private String BIDPRICE;
    private String Bphoto;
    
    private String LDateTime;
    private String BDateTime;
    private String CDateTime;
    private String OrderStatus;
    
    
    //seller/farmer details
    
    public String getOrderStatus() {
        return OrderStatus;
    }

    public void setOrderStatus(String OrderStatus) {
        this.OrderStatus = OrderStatus;
    }
    
    public String getLDateTime() {
        return LDateTime;
    }

    public void setLDateTime(String LDateTime) {
        this.LDateTime = LDateTime;
    }
    
    public String getBDateTime() {
        return BDateTime;
    }

    public void setBDateTime(String BDateTime) {
        this.BDateTime = BDateTime;
    }
    
    public String getCDateTime() {
        return CDateTime;
    }

    public void setCDateTime(String CDateTime) {
        this.CDateTime = CDateTime;
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getcid() {
        return cid;
    }

    public void setcid(int cid) {
        this.cid = cid;
    }
    
    public int getId2() {
        return id2;
    }

    public void setId2(int id2) {
        this.id2 = id2;
    }

    public String getCropName() {
        return cropName;
    }

    public void setCropName(String cropName) {
        this.cropName = cropName;
    }

    public String getCropType() {
        return cropType;
    }

    public void setCropType(String cropType) {
        this.cropType = cropType;
    }

    public String getCropVariety() {
        return cropVariety;
    }

    public void setCropVariety(String cropVariety) {
        this.cropVariety = cropVariety;
    }

    public String getCropQuantity() {
        return cropQuantity;
    }

    public void setCropQuantity(String cropQuantity) {
        this.cropQuantity = cropQuantity;
    }

    public String getListPrice() {
        return listPrice;
    }

    public void setListPrice(String listPrice) {
        this.listPrice = listPrice;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getFarmerName() {
        return farmerName;
    }

    public void setFarmerName(String farmerName) {
        this.farmerName = farmerName;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }
    
    public String getImgFileName() {
        return ImgFileName;
    }

    public void setImgFileName(String ImgFileName) {
        this.ImgFileName = ImgFileName;
    }
    
    public long getFarmerAadhar() {
        return FarmerAadhar;
    }

    public void setFarmerAadhar(long FarmerAadhar) {
        this.FarmerAadhar = FarmerAadhar;
    }
    
    public String getFPAN() {
        return FPAN;
    }

    public void setFPAN(String FPAN) {
        this.FPAN = FPAN;
    }
    
    public String getFphoto() {
        return Fphoto;
    }

    public void setFphoto(String Fphoto) {
        this.Fphoto = Fphoto;
    }
    
    
    
    //Bid/buyer details
    
    public long getBAADHAR() {
        return BAADHAR;
    }

    public void setBAADHAR(long BAADHAR) {
        this.BAADHAR = BAADHAR;
    }
    
    public String getBPAN() {
        return BPAN;
    }

    public void setBPAN(String BPAN) {
        this.BPAN = BPAN;
    }
    
    public long getBPHONE() {
        return BPHONE;
    }

    public void setBPHONE(long BPHONE) {
        this.BPHONE = BPHONE;
    }
    
    
    public String getBNAME() {
        return BNAME;
    }

    public void setBNAME(String BNAME) {
        this.BNAME = BNAME;
    }
    
    public String getBIDPRICE() {
        return BIDPRICE;
    }

    public void setBIDPRICE(String BIDPRICE) {
        this.BIDPRICE = BIDPRICE;
    }
    
    public String getBCITY() {
        return BCITY;
    }

    public void setBCITY(String BCITY) {
        this.BCITY = BCITY;
    }
    
    public String getBphoto() {
        return Bphoto;
    }

    public void setBphoto(String Bphoto) {
        this.Bphoto = Bphoto;
    }
}
