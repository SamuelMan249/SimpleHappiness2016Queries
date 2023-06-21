
 --Simple Queries on a 2016 happiness dataset --


-- Retrieve all rows from happiness 2016 dataset --

select *
From world_happiness_2016

-- Regional Level Queries -- 

-- Find number of countries per region -- 

Select region, COUNT(Region) AS 'Countries of regions'
From world_happiness_2016
Group by Region
Order by COUNT(Region) DESC

-- Average happiness in each region --

Select Region, AVG(Happiness_Score) AS 'Average Happiness', AVG(Happiness_Rank) AS 'Average Happiness Rank'
From world_happiness_2016
Group by Region
Order by 'Average Happiness' DESC  

-- Regions with Largest Families 

Select Region, AVG(Family) AS 'Family Size'
From world_happiness_2016
Group by Region
Order by 'Family Size' DESC  

-- Country Level Queries --

-- TOP 5 happiest countries --

Select top 5 *
From world_happiness_2016 
Where Happiness_Rank <= 5
Order by  Happiness_Rank

-- Most Unhappiest countries --

Select top 10 *
From world_happiness_2016 
Order by  Happiness_Rank DESC

-- Does Higher GDP_per_Capita mean a greater Happiness_rank --

Select top 30 GDP_per_Capita, Country, Region, Happiness_Rank
From world_happiness_2016 
Order by GDP_per_Capita DESC

-- Does Higher Freedom mean a greater Happiness_rank --

Select top 30 Freedom, Country, Region, Happiness_Rank
From world_happiness_2016 
Order by Freedom DESC

-- What country has the largest discrepancy in the happiness score --

Select  country, (Upper_Confidence_Interval - Lower_Confidence_Interval) AS 'Discrepancy in Happiness', Happiness_Rank
From world_happiness_2016 
Order by 'Discrepancy in Happiness' DESC


-- Are more trusted governments correlated with less dystopian and happy countries

Select country, Happiness_Rank, Trust_Government_Corruption, Dystopia_Residual
From world_happiness_2016 
Order by Trust_Government_Corruption DESC