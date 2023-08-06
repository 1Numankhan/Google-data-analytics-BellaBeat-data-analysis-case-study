# Google-data-analytics-BellaBeat-data-analysis-case-study
This is a Google data analytics Bellabeat data analysis case study. assume that I will be working for Bellabeat as a junior data analyst.
As a junior data analyst, I will be performing many real-world tasks.
## This case study will follow the six data analysis processes. 

1. Ask 
2. Prepare
3. Process
4. Analyze 
5. Share 
6. Act
   
# Background
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
1. Reliable: data is not reliable, it only has 30 users.
2. Original: The data is not  original. it is from a third-party provider(amazon mechanical Turk)
3. Comprehensive: The data has all the pieces of information that we are looking for. The small sample size was recorded on certain days of the week. some dataset has millions of rows.
4. Current: the is from March 2016 to May 2016 which is not current.
5. Cited: citation is unknown.


# Prepare
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
   


   
   





