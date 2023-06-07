#The data set is really huge, with approx. 3Lakh rows.
#This has been one of the most challenging Data Analysis projects in terms of ETL
#I have used Dense rank format for the ranking system
# oh table refers to the olympic history details
# Nocr table refers to the region, nationality notes and details
# I have used SQL, Excel and PowerBI for the end to end Data Analysis and Data Visualization
# you can interact with my Live Dashboard too ( Check ReadMe page )

#ETL Process

create table if not exists oh (
        
    id    varchar (600),
    name varchar (600),
    sex varchar (600),
    age  varchar  (600),
    height varchar (600),
    weight  varchar (600),
    team    varchar (600),
    noc     varchar (600),
    games   varchar (600),
    year   varchar (600),
    season  varchar (600),
    city    varchar (600),
    sport   varchar (600),
    event   varchar (600),
    medal   varchar (600)

    );
select * from oh;

LOAD DATA INFILE 'athlete_events.csv' into table oh
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

---------

select * from oh;

use olympics;

Select count(*) from oh;

describe oh;

select * from nocr;

Select count(*) from nocr;

#Data cleaning and Preparation 

#Trim Special and unwanted characters
Update oh set age = TRIM('NA' FROM age)
;
Update oh set weight = TRIM('NA' FROM weight)
;
Update oh set height = TRIM('NA' FROM height)
;

# Change the data type for better mathemetical analysis
ALTER TABLE oh 
MODIFY COLUMN age int;
 
#How many records are there?
select count(*) from  oh;

#How many olympics games have been held?
select count(distinct games) from oh;

#List down all Olympics games held so far.
select games from oh;

#Mention the total no of nations who participated in each olympics game?
select distinct(count(region)) from nocr;

#How many games were held?
select distinct(games) from  oh;

# How many Summer games were held?
select count(games) from oh
where season in ("summer");

# Which Winter games were held?

select distinct(games) from oh
where season in ("winter");

# How many games were played in every sport category in Summers? 

select count(distinct(games)), sport from oh
where season in ("summer")
group by sport
;

#How many different age groups have participated?
select count(distinct(games)) from oh;
select count( distinct age) from oh;

# How many distinct variables are there in the entire Olympics history table? 

Select count(distinct id), count(distinct name),count(distinct sex),
count(distinct age),count(distinct height),count(distinct weight),count(distinct team),
count(distinct noc),count(distinct games),count(distinct year),count(distinct season),
count(distinct city),count(distinct sport),count(distinct event),count(distinct medal)
 from oh;
 
 #For better visualization and clarity you can refer to my Data Visualization Portfolio @sanghmitraSisodiya
 
 # How many distinct variables are there in the entire Noc Region table? 

select count(distinct noc),count(distinct notes),count(distinct region) from nocr;

#Which year saw the highest and lowest no of countries participating in olympics? 1896 -  2016

with cte1 as (
 select year, count(distinct region) as count
 from oh
 join nocr
 on oh.noc =nocr.noc
 group by year),
cte2 as (
 select *, dense_rank () over (order by count desc) as ranking from cte1)
 select * from cte2
 where ranking = 1;
with cte1 as (
 select year, count(distinct region) as count
 from oh
 join nocr
 on oh.noc =nocr.noc
 group by year),
cte2 as (
 select *, dense_rank () over (order by count asc) as ranking from cte1)
 
 select * from cte2 where ranking = 1;


#Which year saw the lowest no of countries participating in olympics? 1896 -  2016

with cte1 as (
 select year, count(distinct region) as count
 from oh
 join nocr
 on oh.noc =nocr.noc
 group by year),
cte2 as (
 select *, dense_rank () over (order by count ) as ranking from cte1)
 select * from cte2
 where ranking = 1;
with cte1 as (
 select year, count(distinct region) as count
 from oh
 join nocr
 on oh.noc =nocr.noc
 group by year),
cte2 as (
 select *, dense_rank () over (order by count asc) as ranking from cte1)
 
 select * from cte2 where ranking = 1;


#Which nation has participated in all of the olympic games?

with cte1 as (
 Select region, count(distinct games) as counting from oh
 join nocr
 on oh.noc= nocr.noc
 group by region)
 
select * from cte1 where counting = 51;

#Identify the sport which was played in all summer olympics.
with cte1 as (
 select count(distinct games)
 from oh
 where season in ("summer")),
 
cte2 as (
 select count(distinct sport), season from oh
 where season in ("summer")),
 
cte3 as (
 select sport, count(distinct games) as counting 
 from oh where season in ("summer") 
 group by sport)
 select * from cte3 
 where counting = 29;

#Which Sports were just played only once in the olympics?

with cte1 as (
 select sport, count(distinct games) as counting
 from oh
 group by sport)
 
select * from cte1 where counting = 1
;

#Fetch the total no of sports played in each olympic games.
select games, count(distinct sport) as counting
from oh
group by games;

#Fetch details of the oldest athletes to win a gold medal.

select max(age) from oh;

#Find the Ratio of male and female athletes participated in all olympic games.  -
 
with cte1 as(
 select sex, count(1) as cnt
 from oh
 group by sex),
 
cte2 as (
  select *, row_number() over(order by cnt) as rn
        	 from cte1),
        min_cnt as
        	(select cnt from cte2	where rn = 1),
        max_cnt as
        	(select cnt from cte2	where rn = 2)
    
select * from cte2;
select concat('1 : ', round(max_cnt.cnt::decimal/min_cnt.cnt, 2)) as ratio
    from min_cnt, max_cnt;
    
Select (74522/196594);
    
#Fetch the top 5 athletes who have won the most gold medals.

with cte1 as
(Select *, CASE
    WHEN Medal like "%Gold%" THEN 1 else 0 end as goldpoints
from oh),
cte2 as (
select id, sum(goldpoints) as totalgold
from cte1
group by id
order by sum(goldpoints) desc)
select * from cte2
having totalgold > 6;

#Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).

with cte1 as 
(select id, count(medal) as TM
from oh
group by id
order by TM desc)
select * from cte1 
having TM > 31;

#Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.

with cte1 as 
(select nocr.region, oh.noc, oh.medal from oh
join nocr
on oh.noc = nocr.noc)
select region, count(medal) as TM
from cte1
group by region
order by TM desc
limit 5;


# 15. List down total gold, silver and broze medals won by each country corresponding to each olympic games.

with cte1 as 
(select nocr.region, oh.noc, oh.medal from oh
join nocr
on oh.noc = nocr.noc)
select region, count(medal) as TM
from cte1
group by region
order by TM desc
limit 5;


#In which Sport/event, India has won highest medals.

with cte1 as 
(select oh.sport, nocr.region, oh.noc, oh.medal from oh
join nocr
on oh.noc = nocr.noc),
cte2 as (select region, sport, count(medal) as TM
from cte1
group by region, sport
order by TM desc
)
select * from cte2
where region in ("India")
order by TM desc
limit 1;

#Break down all olympic games where india has won the highest no. of medals and how many 
medals in each olympic games. 

with cte1 as 
(select oh.games, nocr.region, oh.sport, oh.noc, oh.medal from oh
join nocr
on oh.noc = nocr.noc),
cte2 as (select region, games, sport, count(medal) as TM
from cte1
group by region, games, sport
order by TM desc),
cte3 as (
select * from cte2
where region in ("India")
order by TM desc)
select * from cte3 
where sport in ("Hockey");
------------------------

