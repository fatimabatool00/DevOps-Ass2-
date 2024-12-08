DROP DATABASE IF EXISTS Fertilizer_Management;
CREATE DATABASE Fertilizer_Management;
USE Fertilizer_Management;

CREATE TABLE FARMER(
	FarmerID CHAR(4) NOT NULL,
	FName VARCHAR(20) NOT NULL,
	LName VARCHAR(20) NOT NULL,
	Address VARCHAR(200) NOT NULL,
	TelNo CHAR(10) NOT NULL,
	NIC VARCHAR(12) NOT NULL,
	PRIMARY KEY(FarmerID)
);

CREATE TABLE SUPPLY_CENTER(
	CenterID CHAR(4) NOT NULL,
	Division VARCHAR(30) NOT NULL,
	PRIMARY KEY(CenterID)
);

CREATE TABLE AGRICULTURAL_OFFICER(
	OfficerID CHAR(4) NOT NULL,
	CenterID CHAR(4) NOT NULL,
	FName VARCHAR(20) NOT NULL,
	LName VARCHAR(20) NOT NULL,
	TelNo CHAR(10) NOT NULL,
	Password VARCHAR(40) NOT NULL,
	PRIMARY KEY(OfficerID),
	FOREIGN KEY (CenterID) REFERENCES SUPPLY_CENTER(CenterID)
	ON DELETE CASCADE ON UPDATE CASCADE	
);

CREATE TABLE CULTIVATION(
	LandID CHAR(4) NOT NULL,
	FarmerID CHAR(4) NOT NULL,
	OfficerID CHAR(4) NOT NULL,
	CropName VARCHAR(30) NOT NULL,
	LandArea DECIMAL(8,3) NOT NULL,
	Month VARCHAR(20) NOT NULL,
	PRIMARY KEY(LandID),
	FOREIGN KEY (FarmerID) REFERENCES FARMER(FarmerID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (OfficerID) REFERENCES AGRICULTURAL_OFFICER(OfficerID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE FERTILIZER(
	FertilizerID CHAR(4) NOT NULL,
	Description VARCHAR(30) NOT NULL,
	PRIMARY KEY(FertilizerID)
);

CREATE TABLE RECEIVES(
	LandID CHAR(4) NOT NULL,
	FertilizerID CHAR(4) NOT NULL,
	IssueDate DATE,
	Amount DECIMAL(8,3) NOT NULL,
	FOREIGN KEY (LandID) REFERENCES CULTIVATION(LandID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (FertilizerID) REFERENCES FERTILIZER(FertilizerID)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE STORES(
	FertilizerID CHAR(4) NOT NULL,
	CenterID CHAR(4) NOT NULL,
	QtyOnHand DECIMAL(8,3) NOT NULL,
	StoredDate DATE,	
	ExpireDate DATE,
	FOREIGN KEY (FertilizerID) REFERENCES FERTILIZER(FertilizerID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (CenterID) REFERENCES SUPPLY_CENTER(CenterID)
	ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO FARMER VALUES
('F001','Saman','Danapala','No.20, Walana, Panadura', '0912245896', '962291465V'),
('F002','Nimal','Gunapala','No. 200, Thalpitiya, Wadduwa','0712512500', '875612458V'),
('F003','Piyal','Amarapala','No. 100, Horawala, Matugama','0777458963', '625645789V'),
('F004','Prasanna','Somapala','No. 10, Ginigama, Galle','0762211456', '123456789456'),
('F005','Sanjeewa','Jinapala','N0. 34, Ginthota, Aluthgama','0701234568', '784596154V');


INSERT INTO SUPPLY_CENTER VALUES
('SC01','Aluthgama South'),
('SC02','Panadura'),
('SC03','Wadduwa North'),
('SC04','Galle Baddegama'),
('SC05','Galle Neluwa');


INSERT INTO AGRICULTURAL_OFFICER VALUES
('A001','SC01','Sarath','Amarasiri','0912258478', 'abcd1234'),
('A002','SC02','Kumara','Somawathee','0704455698','123xyz'),
('A003','SC01','Ramani','Karunarathne','0777586145', '#170#');


INSERT INTO CULTIVATION VALUES
('L001','F001','A002','Green Chilli',2.56,'January'),
('L002','F002','A003','Paddy',4.25,'March'),
('L003','F002','A003','Maize',5.50,'February'),
('L004','F003','A002','Paddy',1.85,'March'),
('L005','F001','A001','Brinjal',4.80,'January'),
('L006','F005','A001','Tomato',3.25,'January'),
('L007','F005','A001','Green Chilli',0.95,'January'),
('L008','F002','A001','Paddy',3.25,'April'),
('L009','F003','A001','Maize',2.30,'February'),
('L010','F004','A001','Tomato',1.20,'January');


INSERT INTO FERTILIZER VALUES
('M001','Urea'),
('M002','Sulphate of Ammonia'),
('M003','Sodium Nitrate'),
('M004','Triple Superphosphate'),
('M005','Ammonium Phosphate'),
('M006','Eppawala Rock Phosphate'),
('M007','Muriate of Potash'),
('M008','Dolamite');


INSERT INTO STORES VALUES
('M001','SC01',75,'2024-01-07','2025-01-07'),
('M002','SC01',60,'2024-03-20','2025-03-20'),
('M003','SC01',40,'2023-09-02','2024-09-02'),
('M004','SC01',30,'2023-11-17','2025-05-17'),
('M008','SC01',100,'2023-02-09','2025-02-09'),
('M001','SC02',120,'2024-01-07','2025-01-07'),
('M006','SC02',65,'2024-01-07','2025-07-07'),
('M008','SC02',50,'2024-01-07','2027-01-07'),
('M002','SC02',80,'2024-01-07','2025-01-07'),
('M007','SC02',95,'2024-01-07','2025-07-07');


INSERT INTO RECEIVES VALUES
('L001','M001','2024-01-20',5),
('L001','M004','2024-01-03',3),
('L002','M007','2024-03-02',5),
('L003','M001','2024-02-15',2.5),
('L003','M006','2024-02-15',1.5),
('L004','M004','2024-04-05',5),
('L006','M008','2024-01-30',2);
