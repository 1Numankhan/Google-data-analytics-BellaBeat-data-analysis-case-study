# Google-data-analytics-BellaBeat-data-analysis-case-study
This is a Google data analytics Bellabeat data analysis case study assume that I will be working for Bellabeat as a junior data analyst.
As a junior data analyst, I will be performing many real-world tasks.
## This case study will follow the six data analysis processes. 

-  **Ask**
-  **Prepare**
-  **Process**
-  **Analyze** 
-   **Share**
-   **Act**

   
# BackGround
   Urška Sršen and Sando Mur founded Bellabeat, a high-tech company that manufactures health-focused smart products.
Sršen used her background as an artist to develop beautifully designed technology that informs and inspires women
around the world. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower
women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and
quickly positioned itself as a tech-driven wellness company for women.

By 2016, Bellabeat had opened offices around the world and launched multiple products. Bellabeat products became
available through a growing number of online retailers in addition to their own e-commerce channel on their website. The
company has invested in traditional advertising media, such as radio, out-of-home billboards, print, and television, but focuses
on digital marketing extensively. Bellabeat invests year-round in Google Search, maintaining active Facebook and Instagram
pages, and consistently engages consumers on Twitter. Additionally, Bellabeat runs video ads on Youtube and display ads on
the Google Display Network to support campaigns around key marketing dates.
# Scenerio
I am assuming to be a junior data analyst in the marketing analyst team at Bellabeat, a high-tech manufacturer of
health-focused products for women. Bellabeat is a successful small company, but they have the potential to become a larger
player in the global smart device market. I will be analyzing the dataset to gain insight to help Bellabeat to be a world player in the smart devices market.

# Stakeholders
Urška Sršen: Bellabeat’s co-founder and Chief Creative Officer
Sando Mur: Mathematician and Bellabeat’s cofounder; a key member of the Bellabeat executive team
Bellabeat marketing analytics team: I’m a member of this team.

   
# 1. ASK
### Business task: 
Analyze the data in order to help Bellabeat guide marketing strategy and analyze their smart devices and how the customer used Bellabeat products and devices
### ANALYSIS QUESTION
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat's marketing strategy?

# 2. PREPARE
Data source: <https://www.kaggle.com/arashnic/fitbit> 
we will be using them for this case study which has a total of 18 datasets.
The data follow a ROC approach.
1. Reliable: data is reliable, it only has 30 users and is vetted by different individuals in Medium and kaggle.
2. Original: The data is not  original. it is from a third-party provider(amazon mechanical Turk)
3. Comprehensive: The data has all the pieces of information that we are looking for. The small sample size was recorded on certain days of the week. some dataset has millions of rows.
4. Current: the is from March 2016 to May 2016 which is not current.
5. Cited: citation is unknown.

# Data organization and storage
There are 18 datasets in **FITBIT data**. every dataset represents different aspects of the Fitbit data. The data is long and wide and some dataset has Rows up to 2 million, I upload all the necessary datasets into **big query** under the project **bellabeat_case_study** with the dataset names.


# 3. Process phase
Excel is used to merge the various data set and clean it. especially the small data set. some dataset has millions of  rows which will be analyzed in Bigquery

# Data preparation process
**Power query in Excel to merge data**
I used MS Excel for a small dataset. like hourly_steps, hourly_intenseties, and hourly_calories and merged them using power query to create a new sheet hourly_activity. <br>

**Remove Duplicates**

  - removed 542 duplicates from minute_sleep_merged.
  - removed 3 duplicates from the sleepDay_merged dataset which has 410 unique values.
  - using the **split function** to organize the data in different columns, especially the data and time.

   ## Data Exploration
   for further data exploration  BigQuery will be used to find any inconsistencies in data.

   ### Import and clean data on SQL using the big query
   There are some big dataset which has millions of row so it's impossible to work on the data in Excel.
   The following datasets will be loaded into **bigQuery** which are, heartrate_seconds_merged, minuteCaloriesNarrow_merged, minuteIntensitiesNarrow_merged, minuteMETsNarrow_merged, and minuteStepsNarrow_merged when uploading the dataset to the bigquery I face some difficulties and error due inconsistencies in data and time which is a timestamp, this is due to the **auto-correct schema**. These  resources [kaggle](https://www.kaggle.com/datasets/arashnic/fitbit/discussion/265899) help me in that regard.
   
   
   
   
   ![carbon (1)](https://github.com/1Numankhan/Google-data-analytics-BellaBeat-data-analysis-case-study/assets/138983077/89742e0c-ba19-4b37-95b2-2ee121edb448)`<BR>


   

   ## Check unique users in the datasets
   after uploading the datasets into **bigquery** I found all the individual users that participated. 

   | Data Set Name          | Format | Total Unique Users |
|------------------------|--------|--------------------|
| daily_activity_merged  | CSV    | 33                 |
| heartrate_seconds_merged | CSV  | 33                 |
| minuteMETSnarrow_merged | CSV   | 33                 |
| minuteSleep_merged     | CSV    | 24                 |
| sleepDay_merged        | CSV    | 24                 |
| weightLogInfo_merged   | CSV    | 8                  |

## uploaded datasets to big QUery
| Dataset Name                | Description                                      |
|-------------------------------|--------------------------------------------------|
| dailyCalories_merged         | Daily calorie information                       |
| dailyIntensities             | Daily activity intensities                      |
| dailySteps                   | Daily step count                                 |
| daily_activity_merged        | Merged daily activity data                      |
| heartrate_seconds_merged     | Merged heart rate data in seconds               |
| hourlyCalories              | Hourly calorie information                      |
| hourlyIntensities            | Hourly activity intensities                     |
| hourlySteps                  | Hourly step count                                |
| minuteMETsNarrow_merged      | Merged minute METs data (narrow)                |
| minuteSleep_merged          | Merged minute-level sleep data                  |
| sleepDay                    | Daily sleep information                         |
| sleepDay_merged             | Merged daily sleep data                         |
| weightLogInfo_merged         | Merged weight log information                  |


## checking start and end of the date
checking starting and end of the date. This is the example of one table individual date set. I do it to check when the specific activity starts and ends.
## Querying Date Range Using SQL

You can use SQL to find the start and end dates within a specified date range. Here's an example using the `daily_activity_merged` table:

```sql
SELECT
  MIN(ActivityDate) AS start_date,
  MAX(ActivityDate) AS end_date
FROM 
  `bellabeat-case-study-395108.fitbit_data.daily_activity_merged`
WHERE
  ActivityDate BETWEEN '2016-04-12' AND '2016-05-12';
```
## Count the time span for totals number of days
I checked the total time span in days for the table 
the following example showed the time span of the following activity in days. 


## Time Span Analysis

You can use SQL to analyze the time span for each table and calculate the number of days. The following example is just for the two table **daily_activity_meregd** and **minuteMETSNarrow_Merged**. Later I altered the datatypes for this table.

```sql
-- `daily_activity_merged` Table
SELECT
    COUNT(distinct ActivityDate) AS number_of_days
FROM `bellabeat-case-study-395108.fitbit_data.daily_activity_merged`;

-- `minuteMETsNarrow_merged` Table
SELECT
    COUNT(DISTINCT ActivityMinute) AS num_Of_day
FROM
    `bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_merged`;

-- Convert minutes into days
SELECT
    COUNT(DISTINCT ActivityDateTime) / 1440.0 AS num_of_days
FROM
    `bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_modified`;
```

## Checking Data Types

Some tables have the correct columns of datatype. These tables have the correct datatype of Timestamp like **daily_activity**, **daily_steps**, **daily_calories**, and **daily_intensities**.

Tables other than these have columns that indicate a time as a string datatype; these will be changed into a date. Here's an example for one table:

## Checking and Converting Data Type

If a column that should represent a date is stored as a string, you can convert it to a date data type using SQL.

### `minuteMETsNarrow_modified` Table

In this example, we'll convert the `ActivityMinute` column from a string to a date data type and create a modified table `minuteMETsNarrow_modified`.

```sql
-- Create a modified table with the correct data type
CREATE OR REPLACE TABLE `bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_modified`
AS
SELECT 
    Id,
    PARSE_DATETIME("%m/%d/%Y %l:%M:%S %p", ActivityMinute) AS ActivityDateTime,
    METs
FROM 
    `bellabeat-case-study-395108.fitbit_data.minuteMETsNarrow_merged`;
```
## Remove Duplicates in BigQuery
To remove Duplicated values I used Excel for that process. But I perform this operation in BigQuery to enhance my SQL skill. So as I already remove duplicates in Excel I found no duplicates in the tables.
-- Daily_activity_merged
```sql
SELECT
  Id,
  ActivityDate,
  Count(*) as num_of_ids
FROM
  `bellabeat-case-study-395108.fitbit_data.daily_activity_merged`
GROUP BY
  Id, ActivityDate
HAVING
  num_of_ids > 1;
```
for sleepday table, we found no duplicates in the data.

```sql
SELECT
  Id,
  SleepDay,
  Count(*) as num_of_ids
FROM
  `bellabeat-case-study-395108.fitbit_data.sleepDay`
GROUP BY
  Id, SleepDay
HAVING
  num_of_ids > 1;
```
There is no data to display meaning this no duplicates all are unique.

## Checking Null Values in the Tables
checked for the nulls values in the table but I can't find it.
```sql
-- daily_activity_merged
SELECT * 
FROM `bellabeat-case-study-395108.fitbit_data.daily_activity_merged` 
WHERE Id IS NULL;

--there is no data to display
SELECT
*
FROM `bellabeat-case-study-395108.fitbit_data.sleepDay`
WHERE Id is null;
--there is no data to dislplay


--there is no data to display
```
## ANALYZE
This step from the data analysis process is done in RStudio Cloud for better statistical analysis and to enhance my **R programming** skill

### **install and load libraries**
```{r}
install.packages('tidyverse')
install.packages('ggplot2')
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyr)
```


## Attaching core tidyverse packages

The following core tidyverse packages are attached:

- dplyr 1.1.2
- readr 2.1.4
- forcats 1.0.0
- stringr 1.5.0
- ggplot2 3.4.3
- tibble 3.2.1
- lubridate 1.9.2
- tidyr 1.3.0
- purrr 1.0.2


## Summaries of the datasets 

let's have a look at the summary of the datasets. The following summary R script is just for one instance. I uploaded the R script file into the repository.


**summary of dailyActivity**

```{r}
dailyactivity <- dailyActivity_merged
dailyactivity %>%  
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes, Calories) %>%
  summary()
```
|               | Min.  | 1st Qu. | Median | Mean   | 3rd Qu. | Max.   |
|:--------------|:------|:--------|:-------|:-------|:--------|:-------|
| TotalSteps    | 0     | 3790    | 7406   | 7638   | 10727   | 36019  |
| TotalDistance | 0.000 | 2.620   | 5.245  | 5.490  | 7.713   | 28.030 |
| SedentaryMin. | 0.0   | 729.8   | 1057.5 | 991.2  | 1229.5  | 1440.0 |


 **daily activity**
|                    | Min.  | 1st Qu. | Median | Mean   | 3rd Qu. | Max.  |
|:-------------------|:------|:--------|:-------|:-------|:--------|:------|
| VeryActiveMinutes  | 0.00  | 0.00    | 4.00   | 21.16  | 32.00   | 210.00|
| FairlyActiveMinutes| 0.00  | 0.00    | 6.00   | 13.56  | 19.00   | 143.00|
| LightlyActiveMin. | 0.0   | 127.0   | 199.0  | 192.8  | 264.0   | 518.0 |


**summary of hourlycalories**

|         | Min. | 1st Qu. | Median | Mean | 3rd Qu. | Max.  |
|:--------|:-----|:--------|:-------|:-----|:--------|:------|
| Calories| 42.00| 63.00   | 83.00  | 97.39| 108.00  | 948.00|
 

 **summary of the sleepday**
|                | Min. | 1st Qu. | Median | Mean | 3rd Qu. | Max. |
|:---------------|:-----|:--------|:-------|:-----|:--------|:-----|
| TotalSleepRec. | 1.00 | 1.00    | 1.00   | 1.12 | 1.00    | 3.00 |
| TotalMinAsleep | 58.0 | 361.0   | 432.5  | 419.2| 490.0   | 796.0|
| TotalTimeInBed | 61.0 | 403.8   | 463.0  | 458.5| 526.0   | 961.0|


 **Summary of the weight**

|      | Min. | 1st Qu. | Median | Mean  | 3rd Qu. | Max.  |
|:-----|:-----|:--------|:-------|:------|:--------|:------|
| WeightKg| 52.60| 61.40   | 62.50  | 72.04 | 85.05   | 133.50|
| BMI    | 21.45| 23.96   | 24.39  | 25.19 | 25.56   | 47.54 |
## Summary Key finding 
- On average each user takes 7638 per day. which is lower than recommended.
- On average each user spends 991.2 min which is 16.52 hours on being inactive in the day which is approximately 68.83% of a day.
- On average each user sleeps  419.2 min a day which  is 6.9866667 in hours.

# Calculate the Average steps, Distance, and Calories Burned per day 
```r
dailyActivity_merged <- read.csv("/cloud/project/dailyActivity_merged.csv")


average_summary <- dailyActivity_merged %>%
  summarize(
    AVGsteps = mean(TotalSteps),
    AVGdistance = mean(TotalDistance),
    AvgCalories = mean(Calories)
  )

# Assign the modified dataset back to the same variable
dailyActivity_merged <- average_summary

# Print the summary
print(average_summary)

```
**Output**
|     | AVGsteps | AVGdistance | AvgCalories |
| --- | -------- | ----------- | ----------- |
| 1   | 7637.911 | 5.489702    | 2303.61     |


## user and their average sleep
```{r}
data <- read.csv("/cloud/project/sleepDay_merged.csv")

data <- data %>%
  group_by(Id) %>%
  summarise(
    no_sleep_days = n_distinct(Id),
    daily_sleep_min = sum(TotalMinutesAsleep)
  ) %>%
  mutate(
    avg_sleep_min = round(daily_sleep_min / no_sleep_days, 2),
    sleep_type = case_when(
      avg_sleep_min >= 540 ~ "Oversleeping",
      avg_sleep_min >= 420 ~ "Healthy Sleep",
      avg_sleep_min >= 210 ~ "Unhealthy Sleep",
      TRUE ~ "Nap"
    )
  )

result <- data %>%
  group_by(sleep_type) %>%
  summarise(
    no_of_users = n()
  )

print(result)
```
| Sleep Type    | No. of Users |
|---------------|--------------|
| Nap           | 2            |
| Oversleeping  | 22           |
- oversleeping:  22 users  more than 9 hours(9hr = 540 min).
- Nap: 2 users Sleeping less than 3.5 hours.

## Total steps 
```{r}
ggplot(data = hourlySteps_merged) +
  geom_bar(mapping = aes(x = ActivityHour, y = StepTotal, fill = ActivityHour), stat = "identity") +
  labs(title = "active user Hourly Steps",caption= "analyze and visualize by Numan khan")


```
![000016](https://github.com/1Numankhan/Google-data-analytics-BellaBeat-data-analysis-case-study/assets/138983077/5ec47083-c4f9-4dce-b825-78409b416246)
- The bar graph illustrates how the  user is active in an hourly manner.
- Between 16:00 to 20:00 Time the user is very active 
## Steps vs. Active minutes 
![Steps vs active_minutes](https://github.com/1Numankhan/Google-data-analytics-BellaBeat-data-analysis-case-study/assets/138983077/2ac7c62a-3978-4002-b288-db9bd5ebe531)

- Comparing the four active levels to the Total steps (the sedentary, lightly_active, fairly active and very active )
- From the plot we can see that the concentration is mainly on the steps between 5000 to 15000.
- Where the users spend of the time on sedentary 8 t0 13. 5 hours in lightly active, and 1 to 2 hours for fairly and very active.

