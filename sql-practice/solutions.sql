/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

SELECT name
FROM Facilities
WHERE membercost > 0.0;

/* Q2: How many facilities do not charge a fee to members? */


SELECT COUNT( * ) 
FROM Facilities
WHERE membercost = 0.0;

/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT facid, name, membercost, monthlymaintenance
FROM Facilities
WHERE membercost / monthlymaintenance > 0.0
AND membercost / monthlymaintenance < .2;

/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

SELECT *
FROM Facilities
WHERE facid in (1,5);

/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

SELECT name, monthlymaintenance, 
CASE WHEN monthlymaintenance <=100
THEN  'cheap'
ELSE  'expensive'
END AS maintenance_description
FROM Facilities;

/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */


SELECT surname, firstname
FROM Members
WHERE joindate = ( SELECT MAX( joindate ) 
				   FROM Members 
			);

/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */
		
SELECT DISTINCT F.name, M.firstname, M.surname
FROM Facilities as F
JOIN Bookings as B
	ON F.facid = B.facid
	AND F.name LIKE '%Tennis Court%' 
JOIN Members as M
	ON M.memid = B.memid
ORDER BY M.firstname, M.surname;


