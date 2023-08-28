

# FInd total unique users ID from the  dataset that has been used for this case study


SELECT count (DISTINCT Id) as Totalid   #users = 33 
 FROM `bellabeat-case-study-395108.fitbit_data.daily_activity_merged` LIMIT 1000;

 SELECT COUNT(DISTInCT Id ) as UNIQUEid
 FROM `bellabeat-case-study-395108.fitbit_data.heartrate_seconds_merged_2`;

SELECT COUNT(DISTINCT Id) AS TOTAL_UNIQUE_USERS
FROM `bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_modified`;

SELECT COUNT(DISTINCT Id) AS totalID
FROM `bellabeat-case-study-395108.fitbit_data.minuteSleep_merged`;

SELECT COUNT(DISTINCT Id) AS TotalID 
FROM `bellabeat-case-study-395108.fitbit_data.sleepDay_merged`;

SELECT COUNT(DISTINCT Id) as uniqueusers
FROM `bellabeat-case-study-395108.fitbit_data.sleepDay_merged`;

SELECT COUNT(DISTINCT Id) AS uniqueID
FROM `bellabeat-case-study-395108.fitbit_data.weightLogInfo_merged`;


# checking dates(start and end) for the tabe Daily_activity_merged

SELECT
MIN(ActivityDate) AS start_date,
MAX(ActivityDate) AS end_date
FROM 
`bellabeat-case-study-395108.fitbit_data.daily_activity_merged`  ; # start 2016-04-12 and end 2016-05-12

# checking dates(start and end ) for the table sleepday

SELECT
MIN(SleepDay) AS start_date,

MAX(SleepDay) AS end_date
FROM
`bellabeat-case-study-395108.fitbit_data.sleepDay`; #  start 2016-04-12 end 2016-05-12

# checking date for the table weightLogInfo_merged

SELECT  
MIN(Date) as start_date,
MAX(Date) as end_dae
FROM
`bellabeat-case-study-395108.fitbit_data.weightLogInfo_merged`; # start    2016-04-12 end 2016-05-12


# NOW check the time span (days for each table)
SELECT
COUNT(distinct ActivityDate) AS number_of_days 
FROM `bellabeat-case-study-395108.fitbit_data.daily_activity_merged` ; # number of days is 31 


# checked the time span for the big datasets

SELECT
COUNT(DISTINCT ActivityMinute ) AS num_Of_day
FROM
`bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_modified`
; 
# its show the days in minutes  (44160)

# it show me in minutes I convert the minutes into days 

SELECT
    COUNT(DISTINCT ActivityDateTime) / 1440.0 AS num_of_days
FROM
    `bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_modified`; # num_of_days = 30.6666 which is 31 

    # the date is almost same in all the table 





#checking datatype the date has a string datetype I want to convert it into a date

CREATE OR REPLACE TABLE `bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_modified`
AS
SELECT 
    Id,
    PARSE_DATETIME("%m/%d/%Y %l:%M:%S %p", ActivityMinute) AS ActivityDateTime,
    METs
FROM 
    `bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_merged`;




#changed datatype of heartrate_seconds_merged
# before changing the datatypes of the date from string I checked  its date and time format. to use in parse_datetime function

  CREATE OR REPLACE TABLE `bellabeat-case-study-395108.fitbit_data.heartrate_seconds_merged_2`
AS
SELECT 
  Id,
  PARSE_DATETIME("%m/%d/%Y %H:%M", Time) AS date_time,
  Value
FROM 
  `bellabeat-case-study-395108.fitbit_data.heartrate_seconds_merged`;

 
 # hourlyintensities


CREATE OR REPLACE TABLE `bellabeat-case-study-395108.fitbit_data.NEW_hourlyIntensities`
AS 
SELECT 
Id,
PARSE_DATETIME("%m/%d/%Y %l:%M:%S %p", ActivityHour) AS Activitytime,
TotalIntensity,
AverageIntensity
FROM
`bellabeat-case-study-395108.fitbit_data.hourlyIntensities`;
 

 #hourlysteps
CREATE OR REPLACE TABLE `bellabeat-case-study-395108.fitbit_data.hourlyStepsParsed` AS
SELECT 
  Id,
  PARSE_DATETIME('%m/%d/%Y %I:%M:%S %p', ActivityHour) AS Datetime,
  StepTotal
FROM
  `bellabeat-case-study-395108.fitbit_data.hourlySteps`;


      #changed the datatypes of the table hourly_calories

CREATE OR REPLACE TABLE `bellabeat-case-study-395108.fitbit_data.new_hourlyCalories`
AS
SELECT
Id,
PARSE_DATETIME("%m/%d/%Y %l:%M:%S %p", ActivityHour) AS ActivityTime,
TCalories

FROM
`bellabeat-case-study-395108.fitbit_data.hourlyCalories`;


-- now I convert all the datatypes from string to date I changed most of these in BigQuery but some of datasets 
-- I changed it in Excel and then uploaded them to bigquery 


-- next step is remove dulipcate and check null value due to the fact I see alot of 0 in the datasets 
-- we need to work on them 

#Finding duplicates of each row
SELECT
  Id,
  ActivityDate,
  Count(*) as num_of_duplicates
FROM
  `bellabeat-case-study-395108.fitbit_data.daily_activity_merged` # There is no duplications
GROUP BY
  Id, ActivityDate
Having num_of_duplicates >1;



--for 
SELECT
Id,
SleepDay,
TotalMinutesAsleep,
Count(*) as num_of_duplicates
FROM `bellabeat-case-study-395108.fitbit_data.sleepDay`
GROUP BY
Id, SleepDay,TotalMinutesAsleep
HAVING
num_of_duplicates >1;

-- so there is not duplications in the tables as I removed it in excel 

-- In some columns in the tables there is zero digits in it so I removed all the unsuitable data from it.

-- daily_activity_merged
SELECT * 
FROM `bellabeat-case-study-395108.fitbit_data.daily_activity_merged` 
WHERE Id IS NULL;

--there is no data to dislplay
SELECT
*
FROM `bellabeat-case-study-395108.fitbit_data.sleepDay`
WHERE Id is null;
--there is no data to dislplay

SELECT
*
FROM
`bellabeat-case-study-395108.fitbit_data.weightLogInfo_merged`
where Id is Null;


--unsuitable data there is alot of zeros in the tables
SELECT COUNT(*) AS num_zero_steps
FROM `bellabeat-case-study-395108.fitbit_data.daily_activity_merged`
where 
TotalSteps = 0
Group by Id
order by num_zero_steps;

-- 15 ids with 0 steps
-- we can't delete it directly so I created a new table for it.
CREATE TABLE new_daily_activity
As sELECT *
FROM `bellabeat-case-study-395108.fitbit_data.daily_activity_merged`;

DELETE FROM `bellabeat-case-study-395108.fitbit_data.daily_activity_merged`
where TotalSteps = 0

