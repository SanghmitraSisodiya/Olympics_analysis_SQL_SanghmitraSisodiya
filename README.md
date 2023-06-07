# 120 Years Olympics History - Data Analysis with SQL 
 
### 📊 Data Analysis Project 📈 - by Sanghmitra Sisodiya [LinkedIn](https://in.linkedin.com/in/sanghmitra-sisodiya-229986173) | [Github](https://github.com/SanghmitraSisodiya) | [Live Dashboard](https://www.novypro.com/profile_projects/sanghmitrasisodiya)
![Screenshot of Olympic Games.](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Olympic_flag.svg/2560px-Olympic_flag.svg.png)

### [Data Source - Kaggle Data Sets](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results)

### [Link to Interactive Dashboard](https://www.novypro.com/profile_projects/sanghmitrasisodiya)

## About the Dataset
### Context

This is a historical dataset on the modern Olympic Games, including all the Games from Athens 1896 to Rio 2016. Before uploading on Kaggle, this was scraped from www.sports-reference.com in May 2018. The R code was used to scrape and wrangle the data. 

## Objective 
To understand and analyse about how the Olympics have evolved over time by using SQL  (You can see my live dashboard Here, I have used [Power BI](https://www.novypro.com/profile_projects/sanghmitrasisodiya) ), 
including questions about the participation and performance of women, different nations, and different sports and events.

## Note :- 
The data set is really huge, with approx. 3Lakh rows.

This has been one of the most challenging Data Analysis projects in terms of ETL

I have used Dense rank format for the ranking system

oh table refers to the olympic history details

Nocr table refers to the region, nationality notes and details

I have used SQL, Excel and PowerBI for the end to end Data Analysis and Data Visualization

you can interact with my Live Dashboard too ( Check ReadMe page )

# Problem Statements and Queries Executed

ETL Process

create table structure

Load Data Infile Method

---------

Data cleaning and Preparation 

Trim Special and unwanted characters

Change the data type for better mathemetical analysis

How many records are there?

How many olympics games have been held?


List down all Olympics games held so far.

Mention the total no of nations who participated in each olympics game?

How many games were held?

How many Summer games were held?

Which Winter games were held?

How many games were played in every sport category in Summers? 

How many different age groups have participated?

How many distinct variables are there in the entire Olympics history table? 

For better visualization and clarity you can refer to my Data Visualization Portfolio @sanghmitraSisodiya
 
How many distinct variables are there in the entire Noc Region table? 

Which year saw the highest and lowest no of countries participating in olympics? 1896 -  2016

Which year saw the lowest no of countries participating in olympics? 1896 -  2016

Which nation has participated in all of the olympic games?

Identify the sport which was played in all summer olympics.

Which Sports were just played only once in the olympics?

Fetch the total no of sports played in each olympic games.

Fetch details of the oldest athletes to win a gold medal.

Find the Ratio of male and female athletes participated in all olympic games.  -
    
Fetch the top 5 athletes who have won the most gold medals.

Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).

Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.

List down total gold, silver and broze medals won by each country corresponding to each olympic games.

In which Sport/event, India has won highest medals.

Break down all olympic games where india has won the highest no. of medals and how many medals in each olympic games. 

------------------------


### Content
The file athlete_events.csv contains 271116 rows and 15 columns. Each row corresponds to an individual athlete competing in an individual Olympic event (athlete-events). The columns are:

ID - Unique number for each athlete

Name - Athlete's name

Sex - M or F

Age - Integer

Height - In centimeters

Weight - In kilograms

Team - Team name

NOC - National Olympic Committee 3-letter code

Games - Year and season

Year - Integer

Season - Summer or Winter

City - Host city

Sport - Sport

Event - Event

Medal - Gold, Silver, Bronze, or NA

## Some Important Insights - 
### 1. The first Event of the Olympics had no participation of female athletes. 
### 2. The female participation increased significantly in late 1950's and saw big increase in 1980's.
### 3. The participation rate of athletes keeps increasing in Winter games.
### 4. 1916, 1940 & 1944 summer Olympic games and 1940 & 1944 winter Olympic games didn't happen.
### 5. World War was the reason for this.  
### 6. Winter and Summer Games were held in the same year up until 1992. 
### 7. Summer Games have more participations than Winter Games
### 8. However, the rate of participation of athletes in Summer Games have become stagnant recently. 


### Feel free to go through the dataset and project, and also connect with me on [Linkedin](https://in.linkedin.com/in/sanghmitra-sisodiya-229986173) or [email me](@sanghmitrasisodiya222gmail.com)
