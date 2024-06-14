

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "hostelAccommodation";

CREATE DATABASE "hostelAccommodation" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE "hostelAccommodation" OWNER TO postgres;

\connect "hostelAccommodation"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: accomodation; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA accomodation;


ALTER SCHEMA accomodation OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: advisor; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.advisor (
    "advisorID" character varying(10) NOT NULL,
    "fullName" character varying(45) NOT NULL,
    department character varying(15) NOT NULL,
    "position" character varying(15) NOT NULL,
    telephone character varying(10) NOT NULL,
    email character varying(30) NOT NULL,
    "roomNumber" character varying(6) NOT NULL
);


ALTER TABLE accomodation.advisor OWNER TO postgres;

--
-- Name: courses; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.courses (
    "courseNumber" character varying(10) NOT NULL,
    "courseTitle" character varying(20) NOT NULL,
    "academicYear" character varying(10) NOT NULL,
    "roomNumber" character varying(5) NOT NULL,
    department character varying(10) NOT NULL
);


ALTER TABLE accomodation.courses OWNER TO postgres;

--
-- Name: flats; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.flats (
    "hallID" character varying(10) NOT NULL,
    "hallName" character varying(10) NOT NULL,
    "numberOfRooms" integer,
    manager_id character varying(10) NOT NULL
);


ALTER TABLE accomodation.flats OWNER TO postgres;

--
-- Name: flats_rooms; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.flats_rooms (
    "roomNumber" character varying(5) NOT NULL,
    "placeNumber" character varying(10) NOT NULL,
    hall_id character varying(10) NOT NULL,
    rent_rate double precision NOT NULL
);


ALTER TABLE accomodation.flats_rooms OWNER TO postgres;

--
-- Name: inspections; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.inspections (
    staff_id character varying(10) NOT NULL,
    hall_id character varying(10),
    inspection_date date NOT NULL,
    condition character varying(30) NOT NULL,
    comments character varying(30) NOT NULL,
    "inspectionID" character varying(10) NOT NULL
);


ALTER TABLE accomodation.inspections OWNER TO postgres;

--
-- Name: instructor; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.instructor (
    "instructorID" character varying(10) NOT NULL,
    "instructorName" character varying(45) NOT NULL,
    telephone character varying(10) NOT NULL,
    email character varying(45) NOT NULL
);


ALTER TABLE accomodation.instructor OWNER TO postgres;

--
-- Name: instructor_courses; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.instructor_courses (
    instructor_id character varying(10) NOT NULL,
    course_id character varying(10) NOT NULL
);


ALTER TABLE accomodation.instructor_courses OWNER TO postgres;

--
-- Name: invoice; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.invoice (
    "invoiceID" integer NOT NULL,
    "leaseNumber" character varying(10) NOT NULL,
    semester character varying(15) NOT NULL,
    "paymentDue" double precision NOT NULL,
    "studentID" character varying(10) NOT NULL,
    "payDate" date NOT NULL
);


ALTER TABLE accomodation.invoice OWNER TO postgres;

--
-- Name: lease; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.lease (
    "leaseID" character varying(10) NOT NULL,
    "leaseDuration" integer NOT NULL,
    "student_ID" character varying(10) NOT NULL,
    "roomNum" character varying(10) NOT NULL,
    "entryDate" date NOT NULL,
    "exitDate" date NOT NULL,
    hallid character varying(10)
);


ALTER TABLE accomodation.lease OWNER TO postgres;

--
-- Name: nextOfKin; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation."nextOfKin" (
    "studentID" character varying(10) NOT NULL,
    "kinName" character varying(45) NOT NULL,
    relationship character varying(10) NOT NULL,
    address character varying(45) NOT NULL,
    "phoneNumber" character varying(10) NOT NULL
);


ALTER TABLE accomodation."nextOfKin" OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.staff (
    "stfNumber" character varying(10) NOT NULL,
    "stfEmail" character varying(45) NOT NULL,
    "stfName" character varying(45) NOT NULL,
    "stfAddress" character varying(45) NOT NULL,
    "stfDOB" date NOT NULL,
    "stfGender" character varying(6) NOT NULL,
    "stfPosition" character varying(30) NOT NULL,
    "stfLocation" character varying(30) NOT NULL,
    telephone character varying(10)
);


ALTER TABLE accomodation.staff OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.student (
    "studentName" character varying(45) NOT NULL,
    address character varying(45) NOT NULL,
    nationality character varying(20) NOT NULL,
    "phoneNumber" character varying(12) NOT NULL,
    category character varying(15) NOT NULL,
    status character varying(10),
    advisor character varying(10),
    "studentBannerNumber" character varying(15) NOT NULL,
    gender character varying(2) NOT NULL,
    email character varying(30) NOT NULL,
    "birthDate" date
);


ALTER TABLE accomodation.student OWNER TO postgres;

--
-- Name: student_courses; Type: TABLE; Schema: accomodation; Owner: postgres
--

CREATE TABLE accomodation.student_courses (
    student_id character varying(10) NOT NULL,
    courses_id character varying(10) NOT NULL
);


ALTER TABLE accomodation.student_courses OWNER TO postgres;

--
-- Data for Name: advisor; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('17-5964743', 'Ginger Baroc', 'Maths', 'Professor', '4695171199', 'gbaroc0@bbb.org', 'rm871');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('17-5234811', 'Constantin Tzarkov', 'Computing', 'Professor', '9247087574', 'ctzarkov1@qq.com', 'rm878');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('33-1489894', 'Kiri Smalman', 'Engineering', 'Professor', '7863204112', 'ksmalman2@blinklist.com', 'rm879');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('89-9134291', 'Law Bride', 'Computing', 'Professor', '8248618050', 'lbride3@geocities.com', 'rm898');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('78-8713028', 'Barnie Karet', 'Engineering', 'Professor', '5321515897', 'bkaret4@weebly.com', 'rm868');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('15-3736688', 'Katharina Rollins', 'Computing', 'Administrator', '3563609809', 'krollins5@lycos.com', 'rm878');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('88-6169663', 'Adrien Penhearow', 'Maths', 'Administrator', '2313970913', 'apenhearow6@cornell.edu', 'rm808');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('82-3919283', 'Robinson Bridge', 'Maths', 'Professor', '6271420664', 'rbridge7@cam.ac.uk', 'rm875');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('25-4480035', 'Leland Thominga', 'Business', 'Administrator', '8729726732', 'lthominga8@booking.com', 'rm873');
INSERT INTO accomodation.advisor ("advisorID", "fullName", department, "position", telephone, email, "roomNumber") VALUES ('35-4412799', 'Dorisa Donet', 'Computing', 'Dean', '6031083344', 'ddonet9@tripadvisor.com', 'rm876');


--
-- Data for Name: courses; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.courses ("courseNumber", "courseTitle", "academicYear", "roomNumber", department) VALUES ('cs123', 'Database', '2021/2022', 'rm123', 'Computing');
INSERT INTO accomodation.courses ("courseNumber", "courseTitle", "academicYear", "roomNumber", department) VALUES ('cs234', 'data Structure', '2020/2021', 'rm234', 'Maths');
INSERT INTO accomodation.courses ("courseNumber", "courseTitle", "academicYear", "roomNumber", department) VALUES ('cs235', 'Algorthms', '2021/2022', 'rm253', 'Computing');
INSERT INTO accomodation.courses ("courseNumber", "courseTitle", "academicYear", "roomNumber", department) VALUES ('math345', 'Linear Algebra', '2021/2022', 'rm345', 'Maths');


--
-- Data for Name: flats; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.flats ("hallID", "hallName", "numberOfRooms", manager_id) VALUES ('hal2', 'hall2', 56, '33-1489894');
INSERT INTO accomodation.flats ("hallID", "hallName", "numberOfRooms", manager_id) VALUES ('hal1', 'hall1', 34, '33-1489894');
INSERT INTO accomodation.flats ("hallID", "hallName", "numberOfRooms", manager_id) VALUES ('hal3', 'hall3', 76, '88-6169663');


--
-- Data for Name: flats_rooms; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.flats_rooms ("roomNumber", "placeNumber", hall_id, rent_rate) VALUES ('rm123', 'pl123', 'hal3', 675);
INSERT INTO accomodation.flats_rooms ("roomNumber", "placeNumber", hall_id, rent_rate) VALUES ('rm453', 'pl234', 'hal2', 500);
INSERT INTO accomodation.flats_rooms ("roomNumber", "placeNumber", hall_id, rent_rate) VALUES ('rm354', 'pl678', 'hal1', 1000);


--
-- Data for Name: inspections; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.inspections (staff_id, hall_id, inspection_date, condition, comments, "inspectionID") VALUES ('33-1489894', 'hal1', '2022-01-18', 'Unsatisfactory', 'Poor', 'ins234');
INSERT INTO accomodation.inspections (staff_id, hall_id, inspection_date, condition, comments, "inspectionID") VALUES ('33-1489894', 'hal1', '2022-01-18', 'Unsatisfactory', 'Poor', 'ins294');
INSERT INTO accomodation.inspections (staff_id, hall_id, inspection_date, condition, comments, "inspectionID") VALUES ('78-8713028', 'hal2', '2022-01-19', 'Satisfactory', 'Poor', 'ins2874');
INSERT INTO accomodation.inspections (staff_id, hall_id, inspection_date, condition, comments, "inspectionID") VALUES ('88-6169663', 'hal3', '2022-01-15', 'Unsatisfactory', 'Good', 'ins2094');


--
-- Data for Name: instructor; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('66-4325483', 'pbrooker0@amazon.com', '77-8434692', '719 219 1235');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('75-8679583', 'dantrim1@pcworld.com', '21-6096492', '162 741 9036');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('89-3925955', 'rhillborne2@japanpost.jp', '76-9975964', '576 321 9382');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('49-0583171', 'cbrewer3@weather.com', '27-0215185', '514 516 2961');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('33-9939701', 'bkepe4@vimeo.com', '34-5909412', '457 525 5069');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('24-6303984', 'dmussetti5@vkontakte.ru', '67-0504887', '178 205 8699');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('14-1417758', 'dbastin6@army.mil', '90-8159272', '538 900 5708');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('62-0393589', 'gcloake7@creativecommons.org', '64-7107527', '959 122 8222');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('20-5822931', 'mwhitford8@istockphoto.com', '01-4472516', '227 960 2387');
INSERT INTO accomodation.instructor ("instructorID", "instructorName", telephone, email) VALUES ('52-9894607', 'toxe9@chron.com', '71-9249652', '867 343 9987');


--
-- Data for Name: instructor_courses; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.instructor_courses (instructor_id, course_id) VALUES ('14-1417758', 'math345');
INSERT INTO accomodation.instructor_courses (instructor_id, course_id) VALUES ('20-5822931', 'cs235');
INSERT INTO accomodation.instructor_courses (instructor_id, course_id) VALUES ('24-6303984', 'cs234');
INSERT INTO accomodation.instructor_courses (instructor_id, course_id) VALUES ('33-9939701', 'cs123');


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.invoice ("invoiceID", "leaseNumber", semester, "paymentDue", "studentID", "payDate") VALUES (123, 'ls123', '2021su', 1000, '33-1489894', '2021-06-05');
INSERT INTO accomodation.invoice ("invoiceID", "leaseNumber", semester, "paymentDue", "studentID", "payDate") VALUES (234, 'ls124', '2022su', 1500, '33-1489894', '2022-08-15');
INSERT INTO accomodation.invoice ("invoiceID", "leaseNumber", semester, "paymentDue", "studentID", "payDate") VALUES (235, 'ls125', '2022su', 700, '15-3736688', '2022-08-10');


--
-- Data for Name: lease; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.lease ("leaseID", "leaseDuration", "student_ID", "roomNum", "entryDate", "exitDate", hallid) VALUES ('ls123', 3, '33-1489894', 'rm123', '2021-06-01', '2021-06-05', 'hal1');
INSERT INTO accomodation.lease ("leaseID", "leaseDuration", "student_ID", "roomNum", "entryDate", "exitDate", hallid) VALUES ('ls124', 2, '15-3736688', 'rm123', '2022-05-01', '2022-08-20', 'hal1');
INSERT INTO accomodation.lease ("leaseID", "leaseDuration", "student_ID", "roomNum", "entryDate", "exitDate", hallid) VALUES ('ls125', 2, '33-1489894', 'rm234', '2022-05-01', '2022-08-20', 'hal2');


--
-- Data for Name: nextOfKin; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--



--
-- Data for Name: staff; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.staff ("stfNumber", "stfEmail", "stfName", "stfAddress", "stfDOB", "stfGender", "stfPosition", "stfLocation", telephone) VALUES ('15-3736688', 'rkermit3@google.co.uk', 'Riane Kermit', '1597 Toban Court', '1997-09-21', 'M', 'Administrative', 'Hall of residence', '8965236987');
INSERT INTO accomodation.staff ("stfNumber", "stfEmail", "stfName", "stfAddress", "stfDOB", "stfGender", "stfPosition", "stfLocation", telephone) VALUES ('33-1489894', 'vbirtley0@canalblog.com', 'Vickie Birtley', '358 Kipling Circle', '1998-04-25', 'F', 'Administrative', 'Hall of residence', '7895412589');
INSERT INTO accomodation.staff ("stfNumber", "stfEmail", "stfName", "stfAddress", "stfDOB", "stfGender", "stfPosition", "stfLocation", telephone) VALUES ('78-8713028', 'kballentime2@google.com.br', 'Karyl Ballentime', '35 Pierstorff Point', '1999-08-04', 'M', 'Administrative', 'Hall of residence', '0236589741');
INSERT INTO accomodation.staff ("stfNumber", "stfEmail", "stfName", "stfAddress", "stfDOB", "stfGender", "stfPosition", "stfLocation", telephone) VALUES ('88-6169663', 'ckidson4@weebly.com', 'Carlo Kidson', '88890 Havey Terrace', '1996-06-10', 'M', 'Administrative', 'Hall of residence', '8523697412');
INSERT INTO accomodation.staff ("stfNumber", "stfEmail", "stfName", "stfAddress", "stfDOB", "stfGender", "stfPosition", "stfLocation", telephone) VALUES ('89-9134291', 'gmclinden1@t-online.de', 'Guillaume McLinden', '87 Loomis Trail', '1999-03-30', 'M', 'Cleaner', 'Hall of residence', '6587495632');


--
-- Data for Name: student; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.student ("studentName", address, nationality, "phoneNumber", category, status, advisor, "studentBannerNumber", gender, email, "birthDate") VALUES ('Vickie Birtley', '358 Kipling Circle', 'Portugal', '241 572 5984', 'postgraduate', 'Waiting', '15-3736688', '33-1489894', 'F', 'vbirtley0@canalblog.com', '1998-04-25');
INSERT INTO accomodation.student ("studentName", address, nationality, "phoneNumber", category, status, advisor, "studentBannerNumber", gender, email, "birthDate") VALUES ('Guillaume McLinden', '87 Loomis Trail', 'Indonesia', '392 141 7336', 'undergraduate', 'Admitted', '17-5234811', '89-9134291', 'M', 'gmclinden1@t-online.de', '1999-03-30');
INSERT INTO accomodation.student ("studentName", address, nationality, "phoneNumber", category, status, advisor, "studentBannerNumber", gender, email, "birthDate") VALUES ('Karyl Ballentime', '35 Pierstorff Point', 'Portugal', '992 713 0143', 'undergraduate', 'Admitted', '17-5964743', '78-8713028', 'M', 'kballentime2@google.com.br', '1999-08-04');
INSERT INTO accomodation.student ("studentName", address, nationality, "phoneNumber", category, status, advisor, "studentBannerNumber", gender, email, "birthDate") VALUES ('Riane Kermit', '1597 Toban Court', 'Indonesia', '347 271 5092', 'undergraduate', 'Admitted', '25-4480035', '15-3736688', 'M', 'rkermit3@google.co.uk', '1997-09-21');
INSERT INTO accomodation.student ("studentName", address, nationality, "phoneNumber", category, status, advisor, "studentBannerNumber", gender, email, "birthDate") VALUES ('Carlo Kidson', '88890 Havey Terrace', 'Saint Kitts', '854 443 0592', 'undergraduate', 'Admitted', '33-1489894', '88-6169663', 'M', 'ckidson4@weebly.com', '1996-06-10');


--
-- Data for Name: student_courses; Type: TABLE DATA; Schema: accomodation; Owner: postgres
--

INSERT INTO accomodation.student_courses (student_id, courses_id) VALUES ('15-3736688', 'cs123');
INSERT INTO accomodation.student_courses (student_id, courses_id) VALUES ('33-1489894', 'cs234');
INSERT INTO accomodation.student_courses (student_id, courses_id) VALUES ('78-8713028', 'cs235');


--
-- Name: advisor advisor_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.advisor
    ADD CONSTRAINT advisor_pkey PRIMARY KEY ("advisorID");


--
-- Name: staff checkgender; Type: CHECK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE accomodation.staff
    ADD CONSTRAINT checkgender CHECK ((("stfGender")::text = ANY (ARRAY[('F'::character varying)::text, ('M'::character varying)::text]))) NOT VALID;


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY ("courseNumber");


--
-- Name: flats flats_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.flats
    ADD CONSTRAINT flats_pkey PRIMARY KEY ("hallID");


--
-- Name: flats_rooms flats_rooms_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.flats_rooms
    ADD CONSTRAINT flats_rooms_pkey PRIMARY KEY ("roomNumber", hall_id);


--
-- Name: instructor_courses instructor_courses_pk; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.instructor_courses
    ADD CONSTRAINT instructor_courses_pk PRIMARY KEY (instructor_id, course_id);


--
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY ("instructorID");


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY ("invoiceID");


--
-- Name: lease lease_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.lease
    ADD CONSTRAINT lease_pkey PRIMARY KEY ("leaseID");


--
-- Name: nextOfKin primarykey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation."nextOfKin"
    ADD CONSTRAINT primarykey PRIMARY KEY ("studentID", "kinName");


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY ("stfNumber");


--
-- Name: student_courses student_courses_pkey; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.student_courses
    ADD CONSTRAINT student_courses_pkey PRIMARY KEY (student_id, courses_id);


--
-- Name: student studentpk; Type: CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.student
    ADD CONSTRAINT studentpk PRIMARY KEY ("studentBannerNumber");


--
-- Name: student adviser_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.student
    ADD CONSTRAINT adviser_fk FOREIGN KEY (advisor) REFERENCES accomodation.advisor("advisorID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: student_courses course_tbl_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.student_courses
    ADD CONSTRAINT course_tbl_fk FOREIGN KEY (courses_id) REFERENCES accomodation.courses("courseNumber");


--
-- Name: instructor_courses courses_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.instructor_courses
    ADD CONSTRAINT courses_fk FOREIGN KEY (course_id) REFERENCES accomodation.courses("courseNumber") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: inspections hall_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.inspections
    ADD CONSTRAINT hall_fk FOREIGN KEY (hall_id) REFERENCES accomodation.flats("hallID") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: flats_rooms hall_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.flats_rooms
    ADD CONSTRAINT hall_fk FOREIGN KEY (hall_id) REFERENCES accomodation.flats("hallID") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: lease hall_id_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.lease
    ADD CONSTRAINT hall_id_fk FOREIGN KEY (hallid) REFERENCES accomodation.flats("hallID");


--
-- Name: instructor_courses instructor_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.instructor_courses
    ADD CONSTRAINT instructor_fk FOREIGN KEY (instructor_id) REFERENCES accomodation.instructor("instructorID") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: invoice lease_id_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.invoice
    ADD CONSTRAINT lease_id_fk FOREIGN KEY ("leaseNumber") REFERENCES accomodation.lease("leaseID") NOT VALID;


--
-- Name: flats mngr_id; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.flats
    ADD CONSTRAINT mngr_id FOREIGN KEY (manager_id) REFERENCES accomodation.staff("stfNumber");


--
-- Name: lease std_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.lease
    ADD CONSTRAINT std_fk FOREIGN KEY ("student_ID") REFERENCES accomodation.student("studentBannerNumber") ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: inspections stf_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.inspections
    ADD CONSTRAINT stf_fk FOREIGN KEY (staff_id) REFERENCES accomodation.staff("stfNumber") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: invoice stud_id_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.invoice
    ADD CONSTRAINT stud_id_fk FOREIGN KEY ("studentID") REFERENCES accomodation.student("studentBannerNumber");


--
-- Name: student_courses student_tbl_fk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation.student_courses
    ADD CONSTRAINT student_tbl_fk FOREIGN KEY (student_id) REFERENCES accomodation.student("studentBannerNumber");


--
-- Name: nextOfKin studentfk; Type: FK CONSTRAINT; Schema: accomodation; Owner: postgres
--

ALTER TABLE ONLY accomodation."nextOfKin"
    ADD CONSTRAINT studentfk FOREIGN KEY ("studentID") REFERENCES accomodation.student("studentBannerNumber") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- PostgreSQL database dump complete
--

