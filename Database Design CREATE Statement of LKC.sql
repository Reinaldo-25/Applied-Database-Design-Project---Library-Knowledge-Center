-- Table 1: Member
CREATE TABLE Members ( 
    memberCode   VARCHAR2(10)  NOT NULL , 
    memberName   VARCHAR2 (50)  NOT NULL ,
    memberGender VARCHAR2 (10) NOT NULL,  
    memberEmail  VARCHAR2 (75)  NOT NULL , 
    memberType   VARCHAR2 (10)  NOT NULL , 
    memberStatus VARCHAR2 (10)  NOT NULL,
    location_LocationID VARCHAR2(3) not null
);

ALTER TABLE Members
    ADD CONSTRAINT Member_PK PRIMARY KEY (memberCode);

ALTER TABLE Members
    ADD CONSTRAINT gender_check CHECK (memberGender IN ('Male', 'Female'));

ALTER TABLE Members
    ADD CONSTRAINT email_check CHECK (REGEXP_LIKE(memberEmail, '^[A-Za-z0-9._%+-]+@binus\.ac\.id$'));

ALTER TABLE Members
    ADD CONSTRAINT type_check CHECK (memberType IN ('Student', 'Lecturer', 'User'));

ALTER TABLE Members DROP CONSTRAINT type_check;

ALTER TABLE Members
    ADD CONSTRAINT status_check CHECK (memberStatus IN ('Active', 'Inactive'));

ALTER TABLE Members
    ADD CONSTRAINT User_Location_FK FOREIGN KEY (location_LocationID) 
	    REFERENCES Locations (locationID) ON DELETE CASCADE;

-- Table 1.1: User (Subtypes dari Member)
CREATE TABLE Users ( 
    userID VARCHAR2(7)  NOT NULL , 
    userRole VARCHAR2 (35)  NOT NULL 
);

ALTER TABLE Users
    ADD CONSTRAINT User_PK PRIMARY KEY (userID);

ALTER TABLE Users
	ADD CONSTRAINT userID_Check CHECK (REGEXP_LIKE(userID, '^USE[0-9]{4}$'));

ALTER TABLE Users
    ADD CONSTRAINT User_Members_FK FOREIGN KEY (userID) 
	    REFERENCES Members(memberCode) ON DELETE CASCADE;
    
-- Table 1.2: Student (Subtypes dari Member)
CREATE TABLE Students ( 
    nim VARCHAR2(10)  NOT NULL   
);

ALTER TABLE Students 
    ADD CONSTRAINT Students_PK PRIMARY KEY ( nim );

ALTER TABLE Students
    ADD CONSTRAINT Students_Members_FK FOREIGN KEY (nim)
        REFERENCES Members(memberCode) on delete cascade;

-- Table 1.3: Lecturer (Subtypes dari Member)
CREATE TABLE Lecturers ( 
    lecturerCode VARCHAR2(5) NOT NULL 
);

ALTER TABLE Lecturers 
	ADD CONSTRAINT Lecturers_PK PRIMARY KEY ( lecturerCode );

ALTER TABLE Lecturers 
	ADD CONSTRAINT lecturerCode_Check CHECK (REGEXP_LIKE(lecturerCode, '^D[0-9]{4}$'));

ALTER TABLE Lecturers 
	ADD CONSTRAINT Lecturer_Member_FK FOREIGN KEY (lecturerCode)
		REFERENCES Members(memberCode) on delete cascade;

-- Table 2: Room Reservation
CREATE TABLE Room_Reservations ( 
    reservationID       VARCHAR2 (7)  NOT NULL , 
    reservationDate     DATE  NOT NULL , 
    reservationTimeSlot TIMESTAMP  NOT NULL , 
    unit                VARCHAR2 (25)  NOT NULL , 
    accessories         VARCHAR2 (25)  NOT NULL , 
    notes               VARCHAR2 (50)  NOT NULL , 
    status              VARCHAR2 (12)  NOT NULL , 
    Member_memberCode   VARCHAR2 (10)  NOT NULL , 
    Location_locationID VARCHAR2 (3)  NOT NULL , 
    Room_roomID         VARCHAR2 (6)  NOT NULL 
);

ALTER TABLE Room_Reservations 
    ADD CONSTRAINT Room_Reservations_PK PRIMARY KEY (reservationID);

ALTER TABLE Room_Reservations
    ADD CONSTRAINT reservationID_chk CHECK (REGEXP_LIKE(reservationID, '^RES[0-9]{4}$'));

ALTER TABLE Room_Reservations 
    ADD CONSTRAINT accessories_chk check (accessories in ('Spidol', 'Remote', 'Cable', 'Projector', 'Penghapus', 'Monitor'));

ALTER TABLE Room_Reservations 
	Add constraint stats_chk check (status in ('Booked', 'Ongoing', 'Finished', 'Cancelled'));

ALTER TABLE Room_Reservations 
    ADD CONSTRAINT Room_Reservation_Location_FK FOREIGN KEY (Location_locationID) 
	    REFERENCES Locations (locationID) on delete cascade;

ALTER TABLE Room_Reservations 
    ADD CONSTRAINT Room_Reservation_Member_FK FOREIGN KEY (Member_memberCode) 
	    REFERENCES Members (memberCode) on delete cascade;

ALTER TABLE Room_Reservations 
    ADD CONSTRAINT Room_Reservation_Room_FK FOREIGN KEY (Room_roomID) 
	    REFERENCES Rooms (roomID) on delete cascade;

-- Table 3: Room
CREATE TABLE Rooms ( 
    roomID              VARCHAR2 (6)  NOT NULL , 
    roomName            VARCHAR2 (40)  NOT NULL , 
    roomType            VARCHAR2 (40)  NOT NULL , 
    timeSlot            TIMESTAMP  NOT NULL , 
    accessories         VARCHAR2 (40)  NOT NULL , 
    minMemberBook       NUMBER  NOT NULL , 
    maxBookingTime      NUMBER  NOT NULL , 
    Location_locationID VARCHAR2 (3)  NOT NULL 
);

ALTER TABLE Rooms 
    ADD CONSTRAINT Room_PK PRIMARY KEY (roomID);

ALTER TABLE Rooms 
    ADD CONSTRAINT roomID_check CHECK (REGEXP_LIKE(roomID, '^ROOM[0-9]{2}$'));

ALTER TABLE Rooms 
    ADD CONSTRAINT Room_type_check CHECK (roomType IN ('Discussion Room', 'Mini Theatre Room'));

ALTER TABLE Rooms 
    ADD CONSTRAINT Accessories_Check CHECK (accessories in ('Spidol', 'Remote', 'Cable', 'Projector', 'Penghapus', 'Monitor'));

ALTER TABLE Rooms 
	ADD CONSTRAINT minMemberBook_check CHECK (minMemberBook >= 4);

ALTER TABLE Rooms 
	add constraint maxBookingTime_Check check(maxBookingTime >= 1);

ALTER TABLE Rooms 
    ADD CONSTRAINT Room_Location_FK FOREIGN KEY (Location_locationID) 
	    REFERENCES Locations (locationID) on delete cascade;

-- Table 3.1: Discussion Room (Subtypes dari Room)
CREATE TABLE Discussion_Rooms ( 
    dRoomID    VARCHAR2 (6)  NOT NULL, 
    spidolNum NUMBER, 
    remoteNum NUMBER, 
    cableNum  NUMBER 
);

ALTER TABLE Discussion_Rooms 
	ADD CONSTRAINT Discussion_Room_PK PRIMARY KEY (dRoomID);

ALTER TABLE Discussion_Rooms
	ADD CONSTRAINT dRoomID_check CHECK (REGEXP_LIKE(dRoomID, '^DR[0-9]{2}$'));

ALTER TABLE Discussion_Rooms DROP CONSTRAINT dRoomID_check;

ALTER TABLE Discussion_Rooms 
    ADD CONSTRAINT dRoomID_check CHECK (REGEXP_LIKE(dRoomID, '^ROOM[0-9]{2}$'));

ALTER TABLE Discussion_Rooms
	ADD CONSTRAINT Discussion_room_FK FOREIGN KEY (dRoomID)
        REFERENCES Rooms(roomID) ON DELETE CASCADE;
		    
-- Table 3.2: Mini Theatre Room (Subtypes dari Room)
CREATE TABLE Mini_Theatre_Rooms ( 
    mtRoomID VARCHAR2 (6)  NOT NULL , 
    projectorNum NUMBER  NOT NULL 
);

ALTER TABLE Mini_Theatre_Rooms 
	ADD CONSTRAINT Mini_Theatre_Room_PK PRIMARY KEY (mtRoomID);

ALTER TABLE Mini_Theatre_Rooms 
	ADD CONSTRAINT mtRoomID_check CHECK (REGEXP_LIKE(mtRoomID, '^MTR[0-9]{2}$'));

ALTER TABLE Mini_Theatre_Rooms DROP CONSTRAINT mtRoomID_check;

ALTER TABLE Mini_Theatre_Rooms 
    ADD CONSTRAINT mtRoomID_check CHECK (REGEXP_LIKE(mtRoomID, '^ROOM[0-9]{2}$'));

ALTER TABLE Mini_Theatre_Rooms 
	ADD CONSTRAINT Theatre_room_FK FOREIGN KEY (mtRoomID)
		REFERENCES Rooms(roomID) ON DELETE CASCADE;

-- Table 4: Penalty
CREATE TABLE Penalties ( 
    penaltyID                      VARCHAR2 (6)  NOT NULL , 
    durations                      NUMBER  NOT NULL , 
    descriptions                   VARCHAR2 (40)  NOT NULL , 
    levelPenalty                   VARCHAR2 (40)  NOT NULL , 
    Room_Reservation_reservationID VARCHAR2 (7)  NOT NULL 
);

ALTER TABLE Penalties 
	ADD CONSTRAINT penalties_PK PRIMARY KEY (penaltyID);

ALTER TABLE Penalties 
	ADD CONSTRAINT penaltyId_chk CHECK (REGEXP_LIKE(penaltyID, '^PEN[0-9]{2}$'));

ALTER TABLE Penalties 
	ADD CONSTRAINT levelPenalty_chk check(levelPenalty in('Low', 'Medium', 'High'));

ALTER TABLE Penalties 
    ADD CONSTRAINT Penalty_Room_Reservation_FK FOREIGN KEY (Room_Reservation_reservationID) 
	    REFERENCES Room_Reservations (reservationID) on delete cascade;

-- Table 5: Locations
CREATE TABLE Locations ( 
    locationID   VARCHAR2 (3)  NOT NULL , 
    locationName VARCHAR2 (50)  NOT NULL , 
    address      VARCHAR2 (100)  NOT NULL 
);

ALTER TABLE Locations 
	ADD CONSTRAINT Location_PK PRIMARY KEY (locationID);

ALTER TABLE Locations 
	ADD CONSTRAINT locationId_check CHECK(locationID IN ('ALS', 'BDG', 'KMG', 'BKS'));

ALTER TABLE Locations 
	ADD CONSTRAINT address_check CHECK (address IN ('Jakarta', 'Tangerang', 'Bandung', 'Bekasi'));

-- Table 6: Book Reservation
CREATE TABLE Book_Reservations ( 
    bookingID           VARCHAR2 (5)  NOT NULL , 
    bookingDate         DATE  NOT NULL , 
    returnDate          DATE  NOT NULL , 
    status              VARCHAR2 (12)  NOT NULL , 
    Member_memberCode   VARCHAR2 (10)  NOT NULL , 
    Location_locationID VARCHAR2 (3)  NOT NULL , 
    Book_NIB            VARCHAR2 (6)  NOT NULL
);

ALTER TABLE Book_Reservations 
	ADD CONSTRAINT Book_Reservation_PK PRIMARY KEY (bookingID);

ALTER TABLE Book_Reservations 
	ADD CONSTRAINT bookingID_chk CHECK (REGEXP_LIKE(bookingID, '^BK[0-9]{3}$'));

ALTER TABLE Book_Reservations 
	ADD CONSTRAINT status_chk CHECK (status IN ('On Going','Late', 'Completed'));

ALTER TABLE Book_Reservations 
    ADD CONSTRAINT Book_Reservation_Book_FK FOREIGN KEY (Book_NIB) 
        REFERENCES Books (NIB) on delete cascade;

ALTER TABLE Book_Reservations 
    ADD CONSTRAINT Book_Reservation_Location_FK FOREIGN KEY (Location_locationID) 
        REFERENCES Locations (locationID) on delete cascade;

ALTER TABLE Book_Reservations 
    ADD CONSTRAINT Book_Reservation_Member_FK FOREIGN KEY (Member_memberCode) 
        REFERENCES Members (memberCode) on delete cascade;

-- Table 7: Book
CREATE TABLE Books ( 
    NIB                 VARCHAR2 (6)  NOT NULL , 
    bookType            VARCHAR2 (50)  NOT NULL , 
    bookTitle           VARCHAR2 (100)  NOT NULL , 
    Location_locationID VARCHAR2 (3)  NOT NULL , 
    Book_Acquisition_acquisitionID VARCHAR2 (2) NOT NULL  
);

ALTER TABLE Books 
	ADD CONSTRAINT Book_PK PRIMARY KEY (NIB);

ALTER TABLE Books 
	ADD CONSTRAINT nib_valid CHECK (REGEXP_LIKE(NIB, '^B[0-9]{5}$'));

ALTER TABLE Books 
	ADD CONSTRAINT bookType_chk CHECK (bookType IN ('Text', 'Referensi', 'Restricted', 'Tandon'));

ALTER TABLE Books
    ADD CONSTRAINT Book_Book_Acquisition_FK FOREIGN KEY (Book_Acquisition_acquisitionID) 
        REFERENCES Book_Acquisitions (acquisitionID) on delete cascade;

ALTER TABLE Books 
    ADD CONSTRAINT Book_Location_FK FOREIGN KEY ( Location_locationID) 
        REFERENCES Locations (locationID) on delete cascade;

-- Table 8: Book Acquisition
CREATE TABLE Book_Acquisitions ( 
    acquisitionID   VARCHAR2 (2)  NOT NULL , 
    typeAcquisition VARCHAR2 (12)  NOT NULL
);

ALTER TABLE Book_Acquisitions 
	ADD CONSTRAINT Book_Acquisition_PK PRIMARY KEY (acquisitionID);

ALTER TABLE Book_Acquisitions 
	ADD CONSTRAINT acquisitionID_chk CHECK (acquisitionID IN ('D','P','PJ','R'));

ALTER TABLE Book_Acquisitions 
	ADD CONSTRAINT typeAcquisition_chk CHECK (typeAcquisition in ('Purchase', 'Donation','Project', 'Reimburse'));

-- Table 9: Fine
CREATE TABLE Fines ( 
    fineID                     VARCHAR2 (5)  NOT NULL , 
    fineType                   VARCHAR2 (15)  NOT NULL , 
    fineAmount                 NUMBER  NOT NULL , 
    recordDate                 DATE  NOT NULL , 
    notes                      VARCHAR2 (256) , 
    status                     VARCHAR2 (50)  NOT NULL , 
    Book_Reservation_bookingID VARCHAR2 (5)  NOT NULL
);

ALTER TABLE Fines 
	ADD CONSTRAINT Fine_PK PRIMARY KEY (fineID);

ALTER TABLE Fines 
	ADD CONSTRAINT fineID_chk CHECK (REGEXP_LIKE(fineID, '^FN[0-9]{4}$'));

ALTER TABLE Fines
    MODIFY fineID VARCHAR2(6);

ALTER TABLE Fines 
	ADD CONSTRAINT fineType_chk CHECK (fineType IN ('Late', 'Damaged Book', 'Lost Book'));

ALTER TABLE Fines 
	ADD CONSTRAINT fineStatus_chk CHECK (status IN ('Paid', 'Unpaid'));

ALTER TABLE Fines 
    ADD CONSTRAINT Fine_Book_Reservation_FK FOREIGN KEY (Book_Reservation_bookingID) 
        REFERENCES Book_Reservations (bookingID) on delete cascade;

-- Table 10: Payment
CREATE TABLE Payments ( 
    paymentID     VARCHAR2 (5)  NOT NULL , 
    paymentDate   DATE  NOT NULL , 
    paymentAmount NUMBER  NOT NULL , 
    paymentMethod VARCHAR2 (20)  NOT NULL , 
    fineID        VARCHAR2 (5)  NOT NULL
);

ALTER TABLE Payments
    MODIFY fineID VARCHAR2(6);

ALTER TABLE Payments 
	ADD CONSTRAINT Payment_PK PRIMARY KEY (paymentID);

ALTER TABLE Payments 
	ADD CONSTRAINT paymentID_chk CHECK (REGEXP_LIKE(paymentID, '^PY[0-9]{3}$'));

ALTER TABLE Payments 
	ADD CONSTRAINT paymentMethod_chk CHECK (paymentMethod IN ('QRIS', 'Bank Transfer', 'Flazz'));

ALTER TABLE Payments 
	ADD CONSTRAINT Payment_Fine_FK FOREIGN KEY (fineID) REFERENCES Fines (fineID) on delete cascade;
	
-- Table 11: BankTransfer (Subtypes dari Payment)
CREATE TABLE Bank_Transfers ( 
    bankAccountNumber VARCHAR2(20)  NOT NULL , 
    bankName          VARCHAR2 (35)  NOT NULL , 
    Payment_paymentID VARCHAR2 (5)  NOT NULL 
);

ALTER TABLE Bank_Transfers 
    ADD CONSTRAINT Bank_Transfer_PK PRIMARY KEY (bankAccountNumber);

ALTER TABLE Bank_Transfers 
    add constraint Bank_PaymentFK foreign key (Payment_paymentID) 
        references Payments(paymentID) on delete cascade;

-- Table 12: Flazz (Subtypes dari Payment)
CREATE TABLE Flazz ( 
    cardNumber        VARCHAR2(15)  NOT NULL , 
    Payment_paymentID VARCHAR2 (5)  NOT NULL 
);

ALTER TABLE Flazz 
    ADD CONSTRAINT Flazz_PK PRIMARY KEY (cardNumber);

ALTER TABLE Flazz 
    add constraint Flazz_PaymentFK foreign key (Payment_paymentID) 
        references Payments(paymentID) on delete cascade;

-- Table 13: QRIS (Subtypes dari Payment)
CREATE TABLE QRIS ( 
    NMID              VARCHAR2 (15)  NOT NULL , 
    QRCode            BLOB  NOT NULL , 
    Payment_paymentID VARCHAR2 (5)  NOT NULL 
);

ALTER TABLE QRIS 
    ADD CONSTRAINT QRIS_PK PRIMARY KEY ( NMID );

ALTER TABLE QRIS 
    add constraint Qris_PaymentFK foreign key (Payment_paymentID) 
    references Payments(paymentID) on delete cascade;