

/*CREATE TABLE CropDetails (
    Fname VARCHAR2(50) NOT NULL,
    FAadhar NUMBER NOT NULL,
    Phone NUMBER PRIMARY KEY NOT NULL,
    City  VARCHAR2(20) NOT NULL,
    Cropname VARCHAR2(50) NOT NULL,
    CropVariety VARCHAR2(50) NOT NULL,
    LFDuration VARCHAR2(15) NOT NULL,
    LEDuration VARCHAR2(15) NOT NULL,
    Cquantity VARCHAR2(60) NOT NULL,
    Cprice NUMBER NOT NULL,
    CType VARCHAR2(60) NOT NULL,
    Cimage_data1 BLOB NOT NULL,
    Cimage_data2 BLOB NOT NULL,
    Cimage_data3 BLOB ,
    FOREIGN KEY (FAadhar) REFERENCES Farmerdetails(AADHAR)
);*/
/*
CREATE TABLE BuyerDetails (
    BAadhar NUMBER PRIMARY KEY,
    Bname VARCHAR2(50) NOT NULL,
    BEmail VARCHAR2(60) NOT NULL,
    phone NUMBER NOT NULL,
    City VARCHAR2(20) NOT NULL
);
INSERT INTO BuyerDetails (BAadhar, Bname, BEmail, phone,City)
VALUES (123456789098, 'TestName','TestMail@gmail.com', 0000000001,'TCity');
*/
//select * from FarmerDetails;
//desc Farmuserregistermain;
/*SELECT  constraint_type*/
/*FROM user_constraints
WHERE table_name = 'Farmuserregistermain';*/
//ALTER TABLE BuyerDetails MODIFY (Bidprice VARCHAR2(60) NOT NULL);
//ALTER TABLE BuyerDetails Drop (BEmail);
//desc BuyerDetails;
/*desc FarmerDetails;
desc CropDetails;*/
//ALTER TABLE BuyerDetails ADD (Bidprice VARCHAR2(60));
//ALTER TABLE BuyerDetails RENAME TO NewCropDetails;
/*CREATE TABLE ListingDetails (
    Fname VARCHAR2(50) NOT NULL,
    FAadhar NUMBER NOT NULL,
    Phone NUMBER PRIMARY KEY ,
    City  VARCHAR2(20) NOT NULL,
    Cropname VARCHAR2(50) NOT NULL,
    CropVariety VARCHAR2(50) NOT NULL,
    LFDuration VARCHAR2(15) NOT NULL,
    LEDuration VARCHAR2(15) NOT NULL,
    Cquantity VARCHAR2(60) NOT NULL,
    Cprice NUMBER NOT NULL,
    CType VARCHAR2(60) NOT NULL,
    Cimage_data1 BLOB NOT NULL,
    Cimage_data2 BLOB NOT NULL,
    Cimage_data3 BLOB ,
    FOREIGN KEY (FAadhar) REFERENCES Farmerdetails(AADHAR)
);*/
//DROP TABLE farm;
 //select * from farmerdetails;
//desc cropdetails;
//select * from FarmUserRegistermain;
/*ALTER TABLE CropDetails
DROP CONSTRAINT SYS_C008197;*/
//select * from cropdetails;


//DROP TABLE CropListingDetailsMain;

//main contants
/*CREATE TABLE ListingDetails (
    Fname VARCHAR2(50) NOT NULL,
    FAadhar NUMBER  NOT NULL,
    Phone NUMBER NOT NULL,
    City  VARCHAR2(20) NOT NULL,
    Cropname VARCHAR2(50) NOT NULL,
    CropVariety VARCHAR2(50) NOT NULL,
    LFDuration VARCHAR2(15) NOT NULL,
    LEDuration VARCHAR2(15) NOT NULL,
    Cquantity VARCHAR2(60) NOT NULL,
    Cprice NUMBER NOT NULL,
    CType VARCHAR2(60) NOT NULL,
    CIMAGE_NAME1 VARCHAR2(255) NOT NULL
    
);*/

/*CREATE TABLE CropListingDetailsMain (
    Fname VARCHAR2(50) NOT NULL,
    FAadhar NUMBER  NOT NULL,
    Phone NUMBER NOT NULL,
    City  VARCHAR2(20) NOT NULL,
    Cropname VARCHAR2(50) NOT NULL,
    CropVariety VARCHAR2(50) NOT NULL,
    LFDuration VARCHAR2(15)  NOT NULL,
    LEDuration VARCHAR2(15) NOT NULL,
    Cquantity VARCHAR2(60) NOT NULL,
    Cprice NUMBER NOT NULL,
    CType VARCHAR2(60) NOT NULL,
    CIMAGE_NAME1 VARCHAR2(255) NOT NULL,
    FOREIGN KEY (FAadhar) REFERENCES Farmuserregistermain(ADHARNUMBER)
);*/
//desc Farmuserregistermain;
//desc CropListingDetailsMain;
//desc BuyerDetails;
//desc ListingDetailsMain;
//select* from farmerdetails;
//select* from CropListingDetailsMain;
//select* from Farmuserregistermain;
//ALTER TABLE ListingDetails ADD CONSTRAINT CK_FarmerDetails FOREIGN KEY (FAadhar) REFERENCES Farmuserregistermain(ADHARNUMBER);
//ALTER TABLE Cropdetails RENAME TO ListingDetailsMain;
//ALTER TABLE ListingDetails RENAME TO CropdetailsMain;

//desc CropListingDetailsMain;
//ALTER TABLE CropListingDetailsMain MODIFY (Cprice VARCHAR2(60));


//Managing / preventing spams
/*ALTER TABLE CropListingDetailsMain
ADD CONSTRAINT unique_crop_details UNIQUE (City,Cropname,CropVariety, LFDuration, LEDuration,Cquantity,Cprice,CType);
delete from  CropListingDetailsMain where Fname='Alam';*/

//COMMIT;
//select* from BuyerDetails;

/*
-- First, create a sequence to generate unique IDs
CREATE SEQUENCE your_table_id_seq
START WITH 1
INCREMENT BY 1;

-- Second, create a trigger to automatically populate the "id" column with the next value from the sequence
CREATE OR REPLACE TRIGGER your_table_trigger
BEFORE INSERT ON CropListingDetailsMain
FOR EACH ROW
BEGIN
    :NEW.id := your_table_id_seq.NEXTVAL;
END;
/

-- Third, alter your table to add the new "id" column as the primary key
ALTER TABLE CropListingDetailsMain
ADD (id NUMBER PRIMARY KEY);*/


/************************************/
-- Create sequence to generate unique IDs
/*CREATE SEQUENCE CropListingDetailsMain_id_seq
START WITH 1
INCREMENT BY 1;*/



-- Create table with the modified structure
/*CREATE TABLE CropListingDetailsMain (
    id NUMBER PRIMARY KEY,
    Fname VARCHAR2(50) NOT NULL,
    FAadhar NUMBER  NOT NULL,
    Phone NUMBER NOT NULL,
    City  VARCHAR2(20) NOT NULL,
    Cropname VARCHAR2(50) NOT NULL,
    CropVariety VARCHAR2(50) NOT NULL,
    LFDuration VARCHAR2(15)  NOT NULL,
    LEDuration VARCHAR2(15) NOT NULL,
    Cquantity VARCHAR2(60) NOT NULL,
    Cprice NUMBER NOT NULL,
    CType VARCHAR2(60) NOT NULL,
    CIMAGE_NAME1 VARCHAR2(255) NOT NULL,
    FOREIGN KEY (FAadhar) REFERENCES Farmuserregistermain(ADHARNUMBER)
);*/

//ALTER TABLE CropListingDetailsMain MODIFY (Cprice VARCHAR2(60));
//ALTER TABLE CropListingDetailsMain MODIFY (Phone VARCHAR2(16));

/*INSERT INTO CropListingDetailsMain (Fname, FAadhar, Phone, City, Cropname, CropVariety, LFDuration, LEDuration, Cquantity, Cprice, CType, CIMAGE_NAME1) 
VALUES ('Test1', 612368183368, 1, 'Test10', 'Test1', 'Test1', 'Test1', 'Test1', 'Test1', 'Test1', 'Test1', 'Test1');*/
         


/*ALTER TABLE CropListingDetailsMain
ADD CONSTRAINT unique_crop_details UNIQUE (City,Cropname,CropVariety, LFDuration, LEDuration,Cquantity,Cprice,CType);*/

-- Create trigger to populate the "id" column with the next value from the sequence
/*CREATE OR REPLACE TRIGGER CropListingDetailsMain_trigger
BEFORE INSERT ON CropListingDetailsMain
FOR EACH ROW
BEGIN
    :NEW.id := CropListingDetailsMain_id_seq.NEXTVAL;
END;
/*/

//desc CropListingDetailsMain;
//select* from Farmuserregistermain;
//select * from CropListingDetailsMain;
/************************************/

//SELECT * FROM CropListingDetailsMain WHERE CType ='Spice';

//Commit;

//desc CropListingDetailsMain;

/*ALTER TABLE CropListingDetailsMain
ADD CONSTRAINT unique_crop_details UNIQUE (City,Cropname,CropVariety, LFDuration, LEDuration,Cquantity,Cprice,CType);
delete from  CropListingDetailsMain where Fname='Alam';*/

/*CREATE SEQUENCE CropBiddingDetailsMain_id_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE CropBiddingDetailsMain (
    Bid NUMBER PRIMARY KEY,
    Cid NUMBER NOT NULL,
    Fname VARCHAR2(50) NOT NULL,
    FAadhar NUMBER  NOT NULL,
    FPhone NUMBER NOT NULL,
    FCity  VARCHAR2(20) NOT NULL,
    Cropname VARCHAR2(50) NOT NULL,
    CropVariety VARCHAR2(50) NOT NULL,
    LFDuration VARCHAR2(15)  NOT NULL,
    LEDuration VARCHAR2(15) NOT NULL,
    Cquantity VARCHAR2(60) NOT NULL,
    Cprice VARCHAR2(60) NOT NULL,
    CType VARCHAR2(60) NOT NULL,
    CIMAGE_NAME1 VARCHAR2(255) NOT NULL,
    BName VARCHAR2(50) NOT NULL,
    BAadhar NUMBER  NOT NULL,
    BPhone NUMBER NOT NULL,
    BCity  VARCHAR2(20) NOT NULL,
    BidPrice VARCHAR2(60) NOT NULL,
    FOREIGN KEY (FAadhar) REFERENCES Farmuserregistermain(ADHARNUMBER)
);

CREATE OR REPLACE TRIGGER CropBiddingDetailsMain_trigger
BEFORE INSERT ON CropBiddingDetailsMain
FOR EACH ROW
BEGIN
    :NEW.Bid := CropBiddingDetailsMain_id_seq.NEXTVAL;
END;
/*/
/*ALTER TABLE CropBiddingDetailsMain
ADD CONSTRAINT unique_Bid_details UNIQUE (FCity,Cropname,CropVariety, LFDuration, LEDuration,Cquantity,Cprice,CType,BName,BAadhar,BPhone,BidPrice);*/


/*ALTER TABLE CropBiddingDetailsMain
DROP CONSTRAINT FK_FAadhar;

ALTER TABLE CropBiddingDetailsMain
ADD CONSTRAINT FK_BAadhar FOREIGN KEY (BAadhar) REFERENCES BuyerRegisterMain(ADHARNUMBER);*/


/************************************/
-- Create sequence to generate unique IDs
/*CREATE SEQUENCE CropListingDetailsMain_id_seq
START WITH 1
INCREMENT BY 1;*/



-- Create table with the modified structure
/*CREATE TABLE CropListingDetailsMain (
    id NUMBER PRIMARY KEY,
    Fname VARCHAR2(50) NOT NULL,
    FAadhar NUMBER  NOT NULL,
    Phone NUMBER NOT NULL,
    City  VARCHAR2(20) NOT NULL,
    Cropname VARCHAR2(50) NOT NULL,
    CropVariety VARCHAR2(50) NOT NULL,
    LFDuration VARCHAR2(15)  NOT NULL,
    LEDuration VARCHAR2(15) NOT NULL,
    Cquantity VARCHAR2(60) NOT NULL,
    Cprice NUMBER NOT NULL,
    CType VARCHAR2(60) NOT NULL,
    CIMAGE_NAME1 VARCHAR2(255) NOT NULL,
    FOREIGN KEY (FAadhar) REFERENCES Farmuserregistermain(ADHARNUMBER)
);*/

//ALTER TABLE CropListingDetailsMain MODIFY (Cprice VARCHAR2(60));
//ALTER TABLE CropListingDetailsMain MODIFY (Phone VARCHAR2(16));

/*INSERT INTO CropListingDetailsMain (Fname, FAadhar, Phone, City, Cropname, CropVariety, LFDuration, LEDuration, Cquantity, Cprice, CType, CIMAGE_NAME1) 
VALUES ('Test1', 612368183368, 1, 'Test10', 'Test1', 'Test1', 'Test1', 'Test1', 'Test1', 'Test1', 'Test1', 'Test1');*/
         


/*ALTER TABLE CropListingDetailsMain
ADD CONSTRAINT unique_crop_details UNIQUE (City,Cropname,CropVariety, LFDuration, LEDuration,Cquantity,Cprice,CType);*/

-- Create trigger to populate the "id" column with the next value from the sequence
/*CREATE OR REPLACE TRIGGER CropListingDetailsMain_trigger
BEFORE INSERT ON CropListingDetailsMain
FOR EACH ROW
BEGIN
    :NEW.id := CropListingDetailsMain_id_seq.NEXTVAL;
END;
/*/

//desc CropListingDetailsMain;
//select* from Farmuserregistermain;
//select * from CropListingDetailsMain;
/************************************/


/*ALTER TABLE CROPLISTINGDETAILSMAIN
ADD (DateAndTime TIMESTAMP);

UPDATE CROPLISTINGDETAILSMAIN SET DateAndTime = CURRENT_TIMESTAMP WHERE DateAndTime IS NULL;

ALTER TABLE CROPLISTINGDETAILSMAIN
MODIFY (DateAndTime DEFAULT CURRENT_TIMESTAMP);

UPDATE CROPLISTINGDETAILSMAIN
SET DateAndTime = NULL;


ALTER TABLE CROPLISTINGDETAILSMAIN
DROP COLUMN DateAndTime;
/*/
/*****************************************//* Time and Dates/*************************************************/
/*ALTER TABLE CROPBIDDINGDETAILSMAIN
ADD (DateAndTime TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP); 

UPDATE CROPBIDDINGDETAILSMAIN SET DateAndTime = CURRENT_TIMESTAMP WHERE DateAndTime IS NULL; */




/*desc CropBiddingDetailsMain;/

/*ALTER TABLE CropBiddingDetailsMain
ADD CONSTRAINT FK_BAadhar FOREIGN KEY (BAadhar) REFERENCES Farmuserregistermain(ADHARNUMBER);
*/

/*SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'CropBiddingDetailsMain';

//ALTER TABLE CROPBIDDINGDETAILSMAIN DROP CONSTRAINT SYS_C008366;

commit;
 
//SELECT * FROM ALL_CONSTRAINTS WHERE table_name = 'CROPBIDDINGDETAILSMAIN' ;
select constraint_name,constraint_type 
from user_constraints
where table_name = 'CROPBIDDINGDETAILSMAIN';*/


//select * from farmuserregistermain;
//select ADHARNUMBER from farmuserregistermain where LASTNAME='ajayreddy';

/*CREATE TABLE CONTRACTS_TABLE_MAIN (
    ID          NUMBER NOT NULL,
    FID         NUMBER NOT NULL,
    BID         NUMBER NOT NULL,   
    FNAME        VARCHAR2(50) NOT NULL,
    FAADHAR      NUMBER NOT NULL,
    FPAN      NUMBER NOT NULL,
    FPHONE       NUMBER NOT NULL,
    FCITY        VARCHAR2(20) NOT NULL,
    FPHOTO_NAME VARCHAR2(255) NOT NULL, 
    CROPNAME     VARCHAR2(50) NOT NULL,
    CROPVARIETY  VARCHAR2(50) NOT NULL,
    LFDURATION   VARCHAR2(15) NOT NULL,
    LEDURATION   VARCHAR2(15) NOT NULL,
    CQUANTITY    VARCHAR2(60) NOT NULL,
    CPRICE       VARCHAR2(60) NOT NULL,
    CTYPE        VARCHAR2(60) NOT NULL,
    CIMAGE_NAME1 VARCHAR2(255) NOT NULL,
    BNAME        VARCHAR2(50) NOT NULL,
    BAADHAR      NUMBER NOT NULL,
    BPAN      NUMBER NOT NULL,
    BPHONE       NUMBER NOT NULL,
    BCITY        VARCHAR2(20) NOT NULL,
    BIDPRICE     VARCHAR2(60) NOT NULL,
    BPHOTO_NAME VARCHAR2(255) NOT NULL, 
    CONSTRAINT pk_bid PRIMARY KEY (ID),
    CONSTRAINT fk_faadhaar FOREIGN KEY (FID) REFERENCES CROPLISTINGDETAILSMAIN(ID),  -- Assuming PERSONS table with FAADHAR column
    CONSTRAINT fk_Baadhaar FOREIGN KEY (BID) REFERENCES CROPBIDDINGDETAILSMAIN(BID)
);

/*CREATE SEQUENCE CONTRACTS_TABLE_id_seq
START WITH 1
INCREMENT BY 1;


CREATE OR REPLACE TRIGGER CONTRACTS_TABLE_trigger
BEFORE INSERT ON CONTRACTS_TABLE_MAIN
FOR EACH ROW
BEGIN
    :NEW.ID := CONTRACTS_TABLE_id_seq.NEXTVAL;
END;*/
/*


*/



/*ALTER TABLE CROPBIDDINGDETAILSMAIN ENABLE CONSTRAINT FK_BAadhar;
TRUNCATE TABLE CROPBIDDINGDETAILSMAIN;*/


/*ALTER TABLE CROPBIDDINGDETAILSMAIN
ADD (
    BPAN VARCHAR2(10),
    BPHOTO_NAME VARCHAR2(255)
);

ALTER TABLE CROPBIDDINGDETAILSMAIN
MODIFY (
    BPAN VARCHAR2(10) DEFAULT 'PENDING' NOT NULL,
    BPHOTO_NAME VARCHAR2(255) DEFAULT 'PENDING' NOT NULL
);

ALTER TABLE CROPBIDDINGDETAILSMAIN
MODIFY BPHOTO_NAME DEFAULT 'PENDING';

ALTER TABLE CROPBIDDINGDETAILSMAIN
DROP COLUMN BPHOTO_NAME;

ALTER TABLE CROPBIDDINGDETAILSMAIN
DROP COLUMN BPAN;

UPDATE CROPBIDDINGDETAILSMAIN
SET BPAN = 'PENDING',
    BPHOTO_NAME = 'PENDING'
WHERE BPAN IS NULL OR BPHOTO_NAME IS NULL;*/






/*ALTER TABLE CONTRACTS_TABLE_MAIN 
MODIFY (FPAN VARCHAR2(10), BPAN VARCHAR2(10));
ALTER TABLE CONTRACTS_TABLE_MAIN MODIFY (FPAN NULL, BPAN NULL, FPHOTO_NAME NULL, BPHOTO_NAME NULL);


ALTER TABLE CROPLISTINGDETAILSMAIN RENAME COLUMN DATEANDTIME TO LDATETIME;

ALTER TABLE CONTRACTS_TABLE_MAIN ADD (CTDATEANDTIME TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP);

ALTER TABLE CONTRACTS_TABLE_MAIN DROP COLUMN LDATETIME;
ALTER TABLE CONTRACTS_TABLE_MAIN ADD (LDATETIME TIMESTAMP(0) NOT NULL);*/



SELECT TO_CHAR(DateAndTime, 'DD-MON-YY HH:MI:SS AM') AS DateAndTime
FROM CROPLISTINGDETAILSMAIN;

/*INSERT INTO CROPLISTINGDETAILSMAIN 
(FNAME, FAADHAR, PHONE, CITY, CROPNAME, CROPVARIETY, LFDURATION, LEDURATION, CQUANTITY, CPRICE, CTYPE, CIMAGE_NAME1) 
VALUES 
('John Doe', 456654456456, 9876543210, 'New York', 'Wheat', 'Variety X', '120 days', '100 days', '1000 kg', '5000', 'Organic', 'image1.jpg');

DELETE FROM CONTRACTS_TABLE_MAIN
WHERE ID = 2;
*/

DELETE FROM CONTRACTS_TABLE_MAIN
WHERE ID = 12;

ALTER TABLE CONTRACTS_TABLE_MAIN 
MODIFY BPHOTO_NAME DEFAULT 'PENDING' NOT NULL;

ALTER TABLE CONTRACTS_TABLE_MAIN
ADD CONSTRAINT unique_entire_row 
UNIQUE (
    FID, 
    BID, 
    FNAME, 
    FAADHAR,  
    FPHONE, 
    FCITY,  
    CROPNAME, 
    CROPVARIETY, 
    LFDURATION, 
    LEDURATION, 
    CQUANTITY, 
    CPRICE, 
    CTYPE, 
    CIMAGE_NAME1, 
    BNAME, 
    BAADHAR,  
    BPHONE, 
    BCITY, 
    BIDPRICE,  
    LDATETIME, 
    BDATETIME, 
    CTDATEANDTIME
);

ALTER TABLE CONTRACTS_TABLE_MAIN
DROP CONSTRAINT unique_entire_row;

desc FarmUserRegisterMain;
select * from FarmUserRegisterMain ;/*where ADHARNUMBER=789621475632;*/
desc CROPLISTINGDETAILSMAIN;
select * from CROPLISTINGDETAILSMAIN;
desc CROPBIDDINGDETAILSMAIN;
select * from CROPBIDDINGDETAILSMAIN;
desc BUYERDETAILS;
select * from BUYERDETAILS;
desc CONTRACTS_TABLE_MAIN;
select * from CONTRACTS_TABLE_MAIN;

//DELETE FROM CROPBIDDINGDETAILSMAIN;




/*INSERT INTO CONTRACTS_TABLE_MAIN 
(FID, BID, FNAME, FAADHAR, FPAN, FPHONE, FCITY, FPHOTO_NAME, CROPNAME, CROPVARIETY, 
LFDURATION, LEDURATION, CQUANTITY, CPRICE, CTYPE, CIMAGE_NAME1, BNAME, BAADHAR, 
BPAN, BPHONE, BCITY, BIDPRICE, BPHOTO_NAME, LDATETIME, BDATETIME, CTDATEANDTIME, ORDERSTATUS, LGSTAADHAR)
VALUES 
(181, 225, 'Farmer Name', 322266645454, 'ABCDE1234F', 8009456789, 'CityName', 'photo.jpg', 
'CropName', 'CropVariety', '5 days', '10 days', '100 kg', '2000', 'Type', 
'image1.jpg', 'Buyer Name', 147852369987, 'BPAN1234F', 8089147033, 'BuyerCity', 
'5000', 'buyer_photo.jpg', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Pending', '000000000000');


DELETE FROM CONTRACTS_TABLE_MAIN where ID=81;

ALTER TABLE CONTRACTS_TABLE_MAIN
DROP CONSTRAINT SYS_C009772;

ALTER TABLE CONTRACTS_TABLE_MAIN
MODIFY LGSTAADHAR DEFAULT '000000000000';


/*SELECT c.constraint_name, c.table_name, col.column_name
FROM user_constraints c
JOIN user_cons_columns col
  ON c.constraint_name = col.constraint_name
WHERE c.table_name = 'CONTRACTS_TABLE_MAIN' AND col.column_name = 'LGSTAADHAR';*/










commit;

