


--(a) Present a report listing the Manager’s name and telephone number for each--
--hall of residence.--

select "stfName", "telephone" from accomodation.staff, accomodation.flats where 
"stfNumber" = "manager_id"
order by "stfNumber";

--(b) Present a report listing the names and banner numbers of students with the--
--details of their lease agreements.--

SELECT "leaseID", "leaseDuration", "student_ID", "roomNum", "entryDate", "exitDate", "hallid", "studentName"
FROM accomodation.lease, accomodation.student
where "student_ID" = "studentBannerNumber"
order by "studentName"

--(c) Display the details of lease agreements that include the summer semester.--

SELECT *
	FROM accomodation.lease
    where "exitDate" between '2022-06-01' and '2022-08-31';

--(d) Display the details of the total rent paid by a given student. --
SELECT "studentBannerNumber", "studentName", sum("paymentDue")

	FROM accomodation.invoice, accomodation.student
    where "studentBannerNumber" = "studentID"
    group by "studentBannerNumber";


-- (e) Present a report on students who have not paid their invoices by a given date. --

SELECT "studentBannerNumber", "studentName"
	FROM accomodation.invoice, accomodation.student
    where "payDate" > '2022-08-05'
    group by "studentBannerNumber";

-- (f) Display the details of apartment inspections where the property was found to--
-- be in an unsatisfactory condition. --

SELECT *
	FROM accomodation.inspections
    where "condition" = 'Unsatisfactory';


-- g) Display the name and internal telephone number of the Adviser for a particular
student. ----

SELECT "fullName", "advisor"."telephone"
	FROM accomodation.advisor, accomodation.student
    where "advisorID" = "advisor"
    and "studentName"= 'Vickie Birtley';

-- (h) Present a report listing the details of all students currently on the waiting list
for accommodation; that is; who were not placed. --

SELECT*
FROM accomodation.student

where "status" = 'Waiting'
group by "studentBannerNumber";

-- (i) Display the total number of students in each student category. --

SELECT "category", count("category")
FROM accomodation.student
group by "category";

--(j) Display the total number of places in each residence hall. --

SELECT "hallName", "numberOfRooms" FROM accomodation.flats
ORDER BY "hallID" 