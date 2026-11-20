USE g_16test;

DELETE FROM Booking;
DELETE FROM HealthSession;
DELETE FROM Patient;
DELETE FROM SessionType;

INSERT INTO SessionType (type_id, type_name) VALUES
(1, 'Cardiometabolic Screening'),
(2, 'Blood Pressure Screening'),
(3, 'Nutrition Talk'),
(4, 'Influenza Vaccination'),
(5, 'Stretching Class'),
(6, 'Diabetes Workshop');

INSERT INTO Patient (patient_id, first_name, last_name, date_of_birth, phone_number, email) VALUES
(1, 'Tai Man', 'Chan', '1960-03-15', '91234567', 'taiman@mail.com'),
(2, 'Siu Ling', 'Wong', '1985-07-22', '92345678', 'siuling@mail.com'),
(3, 'Ka Ho', 'Lee', '1999-01-05', NULL, 'kaho@mail.com'),
(4, 'Mei Yee', 'Cheung', '1972-11-30', '93456789', 'meiyee@mail.com'),
(5, 'Chi Keung', 'Lau', '1955-05-18', '94567890', 'chikeung@mail.com'),
(6, 'Wing Sze', 'Ho', '2001-09-09', NULL, 'wingsze@mail.com'),
(7, 'Kwok Wai', 'Ng', '1968-02-14', '95678901', 'kwokwai@mail.com'),
(8, 'Hoi Yan', 'Yip', '1990-12-01', '96789012', 'hoiyan@mail.com'),
(9, 'Man Kit', 'Tsang', '1980-04-25', '97890123', 'mankit@mail.com'),
(10, 'Pui Shan', 'Leung', '1995-08-17', '98901234', 'puishan@mail.com');

INSERT INTO HealthSession (session_id, type_id, session_date, start_time, end_time, capacity) VALUES
(1, 1, '2026-10-10', '10:00', '11:00', 3),
(2, 2, '2026-10-12', '14:00', '15:00', 5),
(3, 3, '2026-10-15', '09:00', '10:30', 10),
(4, 1, '2026-11-27', '10:00', '11:00', 3),
(5, 4, '2026-11-28', '15:00', '16:00', 6),
(6, 5, '2026-11-30', '18:00', '19:00', 8),
(7, 2, '2026-12-02', '11:00', '12:00', 5),
(8, 3, '2026-12-05', '14:00', '15:30', 10),
(9, 4, '2026-10-20', '10:00', '11:00', 5);

INSERT INTO Booking (booking_id, patient_id, session_id, status, requested_at) VALUES
(1, 1, 1, 'Completed', '2026-10-01 09:00:00'),
(2, 2, 1, 'Completed', '2026-10-02 10:00:00'),
(3, 3, 2, 'Completed', '2026-10-03 11:00:00'),
(4, 4, 2, 'Completed', '2026-10-04 14:00:00'),
(5, 5, 3, 'Completed', '2026-10-05 09:00:00'),
(6, 6, 3, 'Completed', '2026-10-06 15:00:00'),
(7, 1, 4, 'Confirmed', '2026-10-15 09:00:00'),
(8, 2, 4, 'Confirmed', '2026-10-15 10:00:00'),
(9, 3, 4, 'Confirmed', '2026-10-16 09:00:00'),
(10, 4, 4, 'Waitlisted', '2026-10-18 10:00:00'),
(11, 5, 4, 'Waitlisted', '2026-10-18 10:00:00'),
(12, 6, 5, 'Confirmed', '2026-10-17 14:00:00'),
(13, 6, 6, 'Confirmed', '2026-10-17 15:00:00'),
(14, 7, 7, 'Cancelled', '2026-10-16 11:00:00'),
(15, 7, 7, 'Confirmed', '2026-10-19 09:00:00'),
(16, 8, 5, 'Confirmed', '2026-10-18 13:00:00'),
(17, 9, 6, 'Confirmed', '2026-10-18 16:00:00'),
(18, 10, 7, 'Confirmed', '2026-10-19 10:00:00'),
(19, 4, 9, 'Completed', '2026-10-07 09:00:00'),
(20, 1, 9, 'Completed', '2026-10-07 10:00:00'),
(21, 8, 9, 'Confirmed', '2026-10-07 11:00:00'),
(22, 10, 1, 'Completed', '2026-10-07 12:00:00'),
(23, 9, 1, 'Waitlisted', '2026-10-07 13:00:00');