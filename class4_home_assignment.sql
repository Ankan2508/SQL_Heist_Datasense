//-- Q1. Find missions where:
1.The mission name starts with "A" and is exactly 7 characters long.
2.The mission was launched between 2010 and 2020.
3.The remarks contain the word "mission". --//

SELECT mission_name 
FROM space_missions
WHERE mission_name LIKE 'A______'
	AND launch_date BETWEEN '01-01-2010' AND '31-12-2020'
	AND remarks LIKE '%mission%';
	

//-- Q2. Find missions funded by agencies that:
1.Conducted missions with payloads between 5,000 and 25,000 kg.
2.Were launched before 2000 or had a crew count greater than 3 --//

SELECT mission_name 
FROM space_missions
WHERE payload_kg BETWEEN 5000 and 25000
	AND (launch_date < '01-01-2000'
		 OR crew_count > 3);
		 
//-- Q3. Find missions that:
1.Are not reusable.
2.Were launched from a site that is either "Kennedy Space Center" or
"Satish Dhawan Space Centre".
3.Were unsuccessful or had remarks containing the word "failure --//

SELECT mission_name 
FROM space_missions
WHERE is_reusable = FALSE
AND launch_site IN ('Kennedy Space Center', 'Satish Dhawan Space Centre')
AND (is_successful = FALSE 
	 OR remarks LIKE '%failure%');

//--Q4. Find missions with:
1.A name containing a % or _ as a literal character.
2.Remarks that start with the word "First".--//

SELECT mission_name 
FROM space_missions
WHERE (mission_name LIKE '%/%%' OR mission_name LIKE '%/_%')
AND remarks LIKE 'First%';

//--Q5. Find missions:
1.Where the remarks are NULL.
2.The payload is less than 10,000 kg or the total cost is NULL.
3.Launched after 2015.--//

SELECT mission_name 
FROM space_missions
WHERE (payload_kg < 10000 
	OR total_cost_usd IS NULL)
AND launch_date > '31-12-2015';
