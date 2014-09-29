/* 09 Exercises: SQL Queries
For these exercises you should use the Hotel database you already worked on in lesson number 7: “07 Exercises - Database Modeling: Relationships”
Hotel (hotelNo, hotelName, city)
Room (roomNo, hotelNo, type, price)
Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo)
Guest (guestNo, guestName, guestAddress)
To do these exercises it is not necessary to have any data in the tables, but if it helps you, you are welcome to fill it in.

Simple queries

7 List full details of all hotels.
8 List full details of all hotels in London.
9 List the names and addresses of all guests living in London, alphabetically ordered by name.
10 List all double or family rooms with a price below £40.00 per night, in ascending order of price.
11 List the bookings for which no dateTo has been specified.
*/

SELECT * FROM hotel;

SELECT * FROM hotel WHERE city = 'London';

SELECT guestName, guestAddress FROM guest WHERE guestAddress LIKE '%LONDON%' ORDER BY guestName;

SELECT type, price FROM Room WHERE price < 40 ORDER BY price ASC;

SELECT * FROM booking WHERE dateTO IS NULL;

-- 12 How many hotels are there?
-- 13 What is the average price of a room?
-- 14 What is the total revenue per night from all double rooms?
-- 15 How many different guests have made bookings for August?
-- 22 List the number of rooms in each hotel.
-- 23 List the number of rooms in each hotel in London.
-- 27 Insert a row into a table.
-- 28 Update the price of all rooms by 5%.
-- 29 Delete a row in a table

-- 12 How many hotels are there?
SELECT COUNT(hotelNo) FROM hotel;

-- 13 What is the average price of a room?
SELECT AVG(price) AS AVGPRice FROM Room;

-- 14 What is the total revenue per night from all double rooms?
SELECT SUM(price) FROM Room WHERE type = 'D';

-- 15 How many different guests have made bookings for August?
SELECT DISTINCT COUNT(guestNo) FROM booking
WHERE dateFrom
LIKE '20__-08%'  -- 2010-08- any day
OR
dateTo
LIKE '20__-08%';

-- 22 List the number of rooms in each hotel
SELECT hotelNo, COUNT(roomNo) AS countRoomNo
FROM Room
GROUP BY hotelNo;

-- 23 List the number of rooms in each hotel in London.
SELECT COUNT(room.roomNo) AS NrOfRooms 
FROM room
WHERE hotelNo IN (SELECT hotelNo FROM hotel WHERE city LIKE 'London');

-- 27 Insert a row into a table.
INSERT INTO Hotel (hotelNo, hotelName)
VALUES ('8', 'Ritz'); 

-- 28 Update the price of all rooms by 5%.
UPDATE Room SET price = price*1.05;

-- 29 Delete a row in a table
DELETE FROM Room WHERE RoomNo = 1;