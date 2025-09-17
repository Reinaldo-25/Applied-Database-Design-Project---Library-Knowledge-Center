SELECT * FROM Locations;
DESCRIBE Members
DESCRIBE Locations

select * from members
--INSERT TABLE MEMBER
INSERT INTO Members VALUES ('D9438', 'Budi Andika', 'Male', 'budi@binus.ac.id', 'Lecturer', 'Active', 'ALS');
INSERT INTO Members VALUES ('D2379', 'Anisa Sari', 'Female', 'anisa@binus.ac.id', 'Lecturer', 'Active', 'KMG');
INSERT INTO Members VALUES ('D1829', 'Kamila Santoso', 'Female', 'kamila@binus.ac.id', 'Lecturer', 'Active', 'BDG');
INSERT INTO Members VALUES ('2702309648', 'Sarah Amelia', 'Female', 'sarah@binus.ac.id', 'Student', 'Active', 'ALS');
INSERT INTO Members VALUES ('270230192', 'Agnes Jessica', 'Female', 'agnes@binus.ac.id', 'Student', 'Inactive', 'ALS');
INSERT INTO Members VALUES ('2609127817', 'James Lee', 'Male', 'james@binus.ac.id', 'Student', 'Active', 'KMG');
INSERT INTO Members VALUES ('USE0001', 'Timothy Japri', 'Male', 'timothy@binus.ac.id', 'User', 'Active', 'KMG');
INSERT INTO Members VALUES ('USE0002', 'Ilma Nabila', 'Female', 'ilma@binus.ac.id', 'User', 'Inactive', 'BDG');
INSERT INTO Members VALUES ('USE0003', 'Ashfia Hanum', 'Female', 'ashfia@binus.ac.id', 'User', 'Active', 'ALS');

select * from students
--INSERT TABLE STUDENT
INSERT INTO Students VALUES ('2702309648');
INSERT INTO Students VALUES ('270230192');
INSERT INTO Students VALUES ('2609127817');

select * from users
--INSERT TABLE USER
INSERT INTO Users VALUES ('USE0001', 'System Administrator');
INSERT INTO Users VALUES ('USE0002', 'System Administrator');
INSERT INTO Users VALUES ('USE0003', 'Pengolahan');


select * from lecturers
--INSERT TABLE LECTURER
INSERT INTO Lecturers VALUES ('D2379');
INSERT INTO Lecturers VALUES ('D9438');
INSERT INTO Lecturers VALUES ('D1829');


select * from book_acquisitions
--INSERT TABLE BOOKACQUISITION
INSERT INTO Book_Acquisitions VALUES ('D', 'Donation');
INSERT INTO Book_Acquisitions VALUES ('P', 'Purchase');
INSERT INTO Book_Acquisitions VALUES ('PJ', 'Project');
INSERT INTO Book_Acquisitions VALUES ('R', 'Reimburse');


select * from rooms
-- ================================
-- 1. Room
-- ================================
INSERT INTO Rooms (roomID, roomName, roomType, timeSlot, accessories, minMemberBook, maxBookingTime, Location_locationID) VALUES
('ROOM01', 'Mini Theatre A', 'Mini Theatre Room', TO_TIMESTAMP('2025-06-01 08:00','YYYY-MM-DD HH24:MI'), 'Remote', 5, 4, 'ALS');

INSERT INTO Rooms (roomID, roomName, roomType, timeSlot, accessories, minMemberBook, maxBookingTime, Location_locationID) VALUES
('ROOM02', 'Discussion Room B', 'Discussion Room', TO_TIMESTAMP('2025-06-02 09:00','YYYY-MM-DD HH24:MI'), 'Spidol', 4, 2, 'BDG');

INSERT INTO Rooms (roomID, roomName, roomType, timeSlot, accessories, minMemberBook, maxBookingTime, Location_locationID) VALUES
('ROOM03', 'Discussion Room C', 'Discussion Room', TO_TIMESTAMP('2025-06-03 13:00','YYYY-MM-DD HH24:MI'), 'Cable', 4, 3, 'KMG');


select * from mini_theatre_rooms
-- ================================
-- 2. Mini Theatre Room
-- ================================
INSERT INTO Mini_Theatre_Rooms (mtRoomID, projectorNum) VALUES ('ROOM01', 2);


select * from discussion_rooms
-- ================================
-- 3. Discussion Room
-- ================================
INSERT INTO Discussion_Rooms VALUES ('ROOM02', 5, 1, 2);
INSERT INTO Discussion_Rooms VALUES ('ROOM03', 3, 2, 1);


select * from room_reservations
-- ================================
-- 4. Room Reservation
-- ================================
INSERT INTO Room_Reservations (reservationID, reservationDate, reservationTimeSlot, unit, accessories, notes, status, Member_memberCode, Location_locationID, Room_roomID) VALUES
    ('RES0001', TO_DATE('2025-06-10','YYYY-MM-DD'), TO_TIMESTAMP('2025-06-10 10:00','YYYY-MM-DD HH24:MI'), '02', 'Spidol', 'Team Meeting', 'Booked', 'D9438', 'ALS', 'ROOM02');

INSERT INTO Room_Reservations (reservationID, reservationDate, reservationTimeSlot, unit, accessories, notes, status, Member_memberCode, Location_locationID, Room_roomID) VALUES
    ('RES0002', TO_DATE('2025-06-11','YYYY-MM-DD'), TO_TIMESTAMP('2025-06-11 14:00','YYYY-MM-DD HH24:MI'), '01', 'Remote', 'Client Presentation', 'Cancelled', '2702309648', 'KMG', 'ROOM01');

INSERT INTO Room_Reservations (reservationID, reservationDate, reservationTimeSlot, unit, accessories, notes, status, Member_memberCode, Location_locationID, Room_roomID) VALUES
    ('RES0003', TO_DATE('2025-06-12','YYYY-MM-DD'), TO_TIMESTAMP('2025-06-12 09:30','YYYY-MM-DD HH24:MI'), '03', 'Cable', 'Interview', 'Ongoing', '2609127817', 'BDG', 'ROOM03');


select * from penalties
-- ================================
-- 5. Penalty
-- ================================
INSERT INTO Penalties (penaltyID, durations, descriptions, levelPenalty, Room_Reservation_reservationID) VALUES
    ('PEN01',  2, 'Late cancellation fee', 'Low', 'RES0001');

INSERT INTO Penalties (penaltyID, durations, descriptions, levelPenalty, Room_Reservation_reservationID) VALUES
    ('PEN02', 24, 'No-show penalty', 'High', 'RES0002');

INSERT INTO Penalties (penaltyID, durations, descriptions, levelPenalty, Room_Reservation_reservationID) VALUES
    ('PEN03',  4, 'Overtime surcharge', 'Medium', 'RES0003');


select * from locations
-- Location (done)
INSERT INTO locations (locationID, locationName, address) VALUES
    ('ALS', 'LKC Alam Sutera', 'Tangerang')
INSERT INTO locations (locationID, locationName, address) VALUES
    ('KMG', 'LKC Anggrek', 'Jakarta')
INSERT INTO locations (locationID, locationName, address) VALUES
    ('BDG', 'LKC Bandung Pascal', 'Bandung')


select * from books
-- Books
INSERT INTO books (nib, bookType, bookTitle, Location_locationID, Book_Acquisition_acquisitionID) VALUES
    ('B00001', 'Text', 'The Art of Data Science', 'ALS', 'D')
INSERT INTO books (nib, bookType, bookTitle, Location_locationID, Book_Acquisition_acquisitionID) VALUES
    ('B00002', 'Text', 'Introduction to Quantum Computing', 'KMG', 'PJ')
INSERT INTO books (nib, bookType, bookTitle, Location_locationID, Book_Acquisition_acquisitionID) VALUES
    ('B00003', 'Referensi', 'Oxford English Dictionary', 'BDG', 'R')

select * from book_reservations
-- Book Reservations
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK211', TO_DATE('2025-03-05', 'YYYY-MM-DD'), TO_DATE('2025-03-11', 'YYYY-MM-DD'), 'Late', 'D9438', 'ALS', 'B00001')
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK932', TO_DATE('2025-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-13', 'YYYY-MM-DD'), 'Completed', '2702309648', 'KMG', 'B00002')
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK403', TO_DATE('2025-03-11', 'YYYY-MM-DD'), TO_DATE('2025-03-14', 'YYYY-MM-DD'), 'On Going', '270230192', 'BDG', 'B00003')
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK314', TO_DATE('2025-03-14', 'YYYY-MM-DD'), TO_DATE('2025-03-17', 'YYYY-MM-DD'), 'Completed', '2609127817', 'ALS', 'B00002')
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK825', TO_DATE('2025-03-16', 'YYYY-MM-DD'), TO_DATE('2025-03-20', 'YYYY-MM-DD'), 'Late', '2609127817', 'KMG', 'B00001')
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK916', TO_DATE('2025-03-20', 'YYYY-MM-DD'), TO_DATE('2025-03-22', 'YYYY-MM-DD'), 'Completed', 'D2379', 'ALS', 'B00003')
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK127', TO_DATE('2025-03-23', 'YYYY-MM-DD'), TO_DATE('2025-03-23', 'YYYY-MM-DD'), 'On Going', '2702309648', 'BDG', 'B00003')
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK928', TO_DATE('2025-03-25', 'YYYY-MM-DD'), TO_DATE('2025-03-26', 'YYYY-MM-DD'), 'On Going', '270230192', 'BDG', 'B00002')
INSERT INTO book_reservations (bookingID, bookingDate, returnDate, status, Member_memberCode, Location_locationID, Book_NIB) VALUES
    ('BK369', TO_DATE('2025-03-27', 'YYYY-MM-DD'), TO_DATE('2025-03-28', 'YYYY-MM-DD'), 'Late', 'D9438', 'KMG', 'B00001')


select * from fines
-- Fine
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN8283', 'Late', 15000, TO_DATE('2025-03-11', 'YYYY-MM-DD'), 'Late return', 'Paid', 'BK211')
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN2283', 'Damaged Book', 30000, TO_DATE('2025-03-13', 'YYYY-MM-DD'), 'Damaged cover', 'Unpaid', 'BK932')
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN7213', 'Lost Book', 85000, TO_DATE('2025-03-14', 'YYYY-MM-DD'), 'Reported by member', 'Paid', 'BK403')
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN8313', 'Lost Book', 85000, TO_DATE('2025-03-14', 'YYYY-MM-DD'), 'Misplaced', 'Paid', 'BK314')
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN0831', 'Late', 85000, TO_DATE('2025-03-14', 'YYYY-MM-DD'), 'Forgot to return', 'Unpaid', 'BK825')
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN0333', 'Damaged Book', 85000, TO_DATE('2025-03-14', 'YYYY-MM-DD'), 'Damaged three pages', 'Unpaid', 'BK916')
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN9413', 'Lost Book', 85000, TO_DATE('2025-03-14', 'YYYY-MM-DD'), 'Reported by member', 'Paid', 'BK127')
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN4721', 'Damaged Book', 85000, TO_DATE('2025-03-14', 'YYYY-MM-DD'), 'Damaged half paper', 'Unpaid', 'BK928')
INSERT INTO Fines (fineID, fineType, fineAmount, recordDate, notes, status, Book_Reservation_bookingID) VALUES
    ('FN7043', 'Late', 85000, TO_DATE('2025-03-14', 'YYYY-MM-DD'), 'Pastdue over 1 month', 'Paid', 'BK369')

select * from payments
-- Payment
INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY001', TO_DATE('2025-06-01', 'YYYY-MM-DD'), 50000, 'Bank Transfer', 'FN8283');

INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY002', TO_DATE('2025-06-08', 'YYYY-MM-DD'), 35000, 'Flazz', 'FN2283');

INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY003', TO_DATE('2025-06-13', 'YYYY-MM-DD'), 75000, 'QRIS', 'FN7213');

INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY004', TO_DATE('2025-06-13', 'YYYY-MM-DD'), 40000, 'QRIS', 'FN8313');

INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY005', TO_DATE('2025-06-13', 'YYYY-MM-DD'), 100000, 'Bank Transfer', 'FN0831');

INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY006', TO_DATE('2025-06-13', 'YYYY-MM-DD'), 80000, 'Flazz', 'FN0333');

INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY007', TO_DATE('2025-06-13', 'YYYY-MM-DD'), 125000, 'Flazz', 'FN9413');

INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY008', TO_DATE('2025-06-13', 'YYYY-MM-DD'), 45000, 'QRIS', 'FN4721');

INSERT INTO Payments (paymentID, paymentDate, paymentAmount, paymentMethod, fineID)
VALUES ('PY009', TO_DATE('2025-06-13', 'YYYY-MM-DD'), 150000, 'Bank Transfer', 'FN7043');


select * from bank_transfers
-- Bank Transfer
INSERT INTO Bank_Transfers (bankAccountNumber, bankName, Payment_paymentID)
VALUES (283692710836, 'Bank Central Asia', 'PY001');

INSERT INTO Bank_Transfers (bankAccountNumber, bankName, Payment_paymentID)
VALUES (628301837521, 'Bank Central Asia', 'PY005');

INSERT INTO Bank_Transfers (bankAccountNumber, bankName, Payment_paymentID)
VALUES (982100380231, 'Bank Central Asia', 'PY009');


select * from flazz
INSERT INTO Flazz (cardNumber, Payment_paymentID)
VALUES ('FLZ123456789', 'PY002');

INSERT INTO Flazz (cardNumber, Payment_paymentID)
VALUES ('FLZ365173941', 'PY006');

INSERT INTO Flazz (cardNumber, Payment_paymentID)
VALUES ('FLZ387103041', 'PY007');


select * from qris
INSERT INTO QRIS (NMID, QRCode, Payment_paymentID)
VALUES ('NMID1234567890', EMPTY_BLOB(), 'PY003');

INSERT INTO QRIS (NMID, QRCode, Payment_paymentID)
VALUES ('NMID2863519301', EMPTY_BLOB(), 'PY004');

INSERT INTO QRIS (NMID, QRCode, Payment_paymentID)
VALUES ('NMID3618394014', EMPTY_BLOB(), 'PY008');