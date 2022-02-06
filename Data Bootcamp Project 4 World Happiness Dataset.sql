		-- TOP 10 COUNTRIES WITH HIGHEST SCORES vs Bottom 10 Countries with lowest scores
Select * from world_happiness_report.happiness_data_2019;
Select * from world_happiness_report.happiness_data_2020;

		-- top 10 countries in 2019 with highest happiness score
	--  Here, in the year 2019, the top ten countries with the highest scores are listed out here and Finland (7.769) and Denmark (7.6) were at the top of the list
select country_or_region as "Country", 
		round((score),3) as "2019 Top 10 Countries"
from world_happiness_report.happiness_data_2019
order by score desc
limit 10;

		-- top 10 countries in 2020 with highest happiness score
	--  Here, in the year 2020, the top ten countries with the highest scores are listed out here; Finland (7.809) and Denmark (7.646) for the second time in a row remained at the top of the list
select regional_indicator as "Global Region",
		country_name as "Country", 
		round((ladder_score),3) as "2020 Top 10 Countries"
from world_happiness_report.happiness_data_2020
order by ladder_score desc
limit 10;

		-- bottom 10 countries in 2019 with least happiness score
	-- In 2019, South Sudan (2.853) and Central African Republic (3.083) had the least scores
select country_or_region as "Country", 
		round((score),3) as "2019 Bottom 10 Countries"
from world_happiness_report.happiness_data_2019
order by score asc
limit 10;

		-- bottom 10 countries in 2020 with least happiness score
	-- In 2020, Afghanistan (2.567) and South Sudan (2.817) had the least scores
select regional_indicator as "Global Region",
		country_name as "Country", 
		round((ladder_score),3) as "2020 Bottom 10 Countries"
from world_happiness_report.happiness_data_2020
order by ladder_score asc
limit 10;

		-- comparing results from 2019 and 2020 for top 10 countries with highest scores
	-- this outlines the countries that had the highest scores in 2019 and 2020; Norway and Canada had reduced scores from 2019 to 2020. The rest countries had increased scores from 2019 to 2020
select tb2.regional_indicator as "Global Region",
		tb1.country_or_region as "Country", 
		round((tb1.score), 3) as "2019 Happiness scores", 
        round((tb2.ladder_score),3) as "2020 Happiness Scores"
from world_happiness_report.happiness_data_2019 tb1
inner join  world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
order by score desc
limit 10;

		-- comparing results from 2019 and 2020 for bottom 10 countries with least happiness scores
	-- South Sudan, Afghanistan, Rwanda, Bostwanan, and Zimbabwe all had reduced scores from 2019 to 2020 while the rest countries had increased scores over the year
select tb2.regional_indicator as "Global Region",
		tb1.country_or_region as "Country", 
		round((tb1.score), 3) as "2019 Happiness scores", 
        round((tb2.ladder_score),3) as "2020 Happiness Scores"
from world_happiness_report.happiness_data_2019 tb1
inner join  world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
order by score asc
limit 10;        

			-- AVERAGE SCORE OF EACH VARIABLE BY REGION AND YEAR
Select * from world_happiness_report.happiness_data_2019;
Select * from world_happiness_report.happiness_data_2020;

	-- 2019 average score for each variable by country
-- Here, the average score for each varaible in 2019 are listed out

select country_or_region as "Country", 
		round(avg(score),3) as "AVG Score", 
		round(avg(GDP_per_capita),3) as "AVG GDP per Capita", 
		round(avg(social_support),3) as "AVG Social Support", 
		round(avg(healthy_life_expectancy),3) as "AVG Healthy Life Expectancy",
		round(avg(freedom_to_make_life_choices),3) as "AVG Freedom to make life choices", 
		round(avg(generosity),3) as "AVG Generosity",
		round(avg(perceptions_of_corruption),3) as "AVG Perceptions of Corruption"    
from world_happiness_report.happiness_data_2019
group by country_or_region
order by healthy_life_expectancy desc;


		-- 2020 average score for each variable by country
	-- Here, the average score for each varaible in 2020 are listed out
select regional_indicator as "Global Region",
		country_name as "Country",
		round(avg(ladder_score),3) as "AVG Score", 
		round(avg(explained_by_Log_GDP_per_capita),3) as "AVG GDP per Capita", 
		round(avg(Explained_by_social_support),3) as "AVG Social Support", 
		round(avg(Explained_by_Healthy_life_expectancy),3) as "AVG Healthy Life Expectancy",
		round(avg(Explained_by_Freedom_to_make_life_choices),3) as "AVG Freedom to make life choices", 
		round(avg(Explained_by_generosity),3) as "AVG Generosity",
		round(avg(Explained_by_Perceptions_of_corruption),3) as "AVG Perceptions of Corruption"
from world_happiness_report.happiness_data_2020
group by country_name
order by Explained_by_Healthy_life_expectancy desc;

		-- 2020 average score for each variable by region
	-- Here, the the average score for each varaible by region in 2020 are listed out
select regional_indicator as "Global Region",
		round(avg(ladder_score),3) as "AVG Score", 
		round(avg(explained_by_Log_GDP_per_capita),3) as "AVG GDP per Capita", 
		round(avg(Explained_by_social_support),3) as "AVG Social Support", 
		round(avg(Explained_by_Healthy_life_expectancy),3) as "AVG Healthy Life Expectancy",
		round(avg(Explained_by_Freedom_to_make_life_choices),3) as "AVG Freedom to make life choices", 
		round(avg(Explained_by_generosity),3) as "AVG Generosity",
		round(avg(Explained_by_Perceptions_of_corruption),3) as "AVG Perceptions of Corruption"
from world_happiness_report.happiness_data_2020
group by regional_indicator
order by Explained_by_Healthy_life_expectancy desc;

	-- compare results from 2019 and 2020
-- Here, the average score for each varaible by year, country and region are outlined
Select tb2.regional_indicator as "Global Region", 
		tb2.country_name as "Country", 
		round(avg(tb2.ladder_score),3) as "2020 AVG Score", 
        round(avg(tb1.score),3) as "2019 AVG Score", 
		round(avg(tb2.explained_by_Log_GDP_per_capita),3) as "2020 AVG GDP per Capita", 
        round(avg(tb1.GDP_per_capita),3) as "2019 AVG GDP per Capita", 
		round(avg(tb2.Explained_by_social_support),3) as "2020 AVG Social Support", 
        round(avg(tb1.social_support),3) as "2019 AVG Social Support", 
		round(avg(tb2.Explained_by_Healthy_life_expectancy),3) as "2020 AVG Healthy Life Expectancy", 
        round(avg(tb1.healthy_life_expectancy),3) as "2019 AVG Healthy Life Expectancy",
		round(avg(tb2.Explained_by_Freedom_to_make_life_choices),3) as "2020 AVG Freedom to make life choices", 
        round(avg(tb1.freedom_to_make_life_choices),3) as "2019 AVG Freedom to make life choices", 
		round(avg(tb2.Explained_by_generosity),3) as "2020 AVG Generosity", 
        round(avg(tb1.generosity),3) as "2019 AVG Generosity",
		round(avg(tb2.Explained_by_Perceptions_of_corruption),3) as "2020 AVG Perceptions of Corruption", 
        round(avg(tb1.perceptions_of_corruption),3) as "2019 AVG Perceptions of Corruption" 
from world_happiness_report.happiness_data_2019 tb1
inner join  world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
group by tb2.regional_indicator, tb2.country_name
order by score asc; 


		-- JOIN BOTH TABLES TOGETHER & FILTER FOR ONE SPECIFIC COUNTRY OF YOUR CHOICE & LOOK AT HOW THE DATA HAS CHANGED YEAR ON YEAR 
	-- Here happiness results 2019 and 2020 for Venezuela was compared
	-- An increase was observed in score, freedom to make life choices, generosity, and perceptions of corruption
	-- A decrease was seen in GDP per capita, social support, and healthy life expectancy 
select tb2.regional_indicator as "Global Region", tb2.country_name as "Country", 
	round((tb2.ladder_score),3) as "2020 Score", round((tb1.score),3) as "2019 Score", 
    round((tb2.explained_by_Log_GDP_per_capita),3) as "2020  GDP per Capita", round((tb1.GDP_per_capita),3) as "2019 GDP per Capita", 
    round((tb2.Explained_by_social_support),3) as "2020 Social Support", round((tb1.social_support),3) as "2019 Social Support", 
    round((tb2.Explained_by_Healthy_life_expectancy),3) as "2020 Healthy Life Expectancy", round((tb1.healthy_life_expectancy),3) as "2019 Healthy Life Expectancy",
    round((tb2.Explained_by_Freedom_to_make_life_choices),3) as "2020 Freedom to make life choices", round((tb1.freedom_to_make_life_choices),3) as "2019 Freedom to make life choices", 
    round((tb2.Explained_by_generosity),3) as "2020 Generosity", round((tb1.generosity),3) as "2019 AVG Generosity",
    round((tb2.Explained_by_Perceptions_of_corruption),3) as "2020 Perceptions of Corruption", round((tb1.perceptions_of_corruption),3) as "2019 Perceptions of Corruption"
from world_happiness_report.happiness_data_2019 tb1
inner join world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
where country_name like '%uel%';
        
			-- WHICH COUNTRIES HAVE THE MAXIMUM & MINIMUM SCORES FOR EACH VARIABLE. 
Select * from world_happiness_report.happiness_data_2019;
Select * from world_happiness_report.happiness_data_2020;

		-- min and max scores for each variable by region and country in 2019 and 2019
	-- score 
select tb2.regional_indicator as "Global Region", 
		tb1.country_or_region as "Country", 
		round(min(tb1.score),3) as "2019 MIN Score", 
		round(max(tb1.score),3) as "2019 MAX Score",
		round(min(tb2.ladder_score),3) as "2020 MIN Score", 
		round(max(tb2.ladder_score),3) as "2020 MAX Score"
from world_happiness_report.happiness_data_2019 tb1
inner join world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
group by tb2.regional_indicator, tb1.country_or_region
order by tb2.ladder_score desc;

	-- GDP per capital
select tb2.regional_indicator as "Global Region", 
		tb1.country_or_region as "Country", 
		round(min(tb1.GDP_per_capita),3) as "2019 MIN GDP per Capita", 
		round(max(tb1.GDP_per_capita),3) as "2019 MAX GDP per Capita",
		round(min(tb2.explained_by_Log_GDP_per_capita),3) as "2020 MIN GDP per Capita", 
		round(max(tb2.explained_by_Log_GDP_per_capita),3) as "2020 MAX GDP per Capita"
from world_happiness_report.happiness_data_2019 tb1
inner join world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
group by tb2.regional_indicator, tb1.country_or_region
order by tb2.explained_by_Log_GDP_per_capita desc;
 
	-- Social Support
select tb2.regional_indicator as "Global Region", 
		tb1.country_or_region as "Country", 
		round(min(tb1.social_support),3) as "2019 MIN Social Support", 
		round(max(tb1.social_support),3) as "2019 MAX Social Support",
		round(min(tb2.Explained_by_social_support),3) as "2020 MIN Social Support", 
		round(max(tb2.Explained_by_social_support),3) as "2020 MAX Social Support"
from world_happiness_report.happiness_data_2019 tb1
inner join world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
group by tb2.regional_indicator, tb1.country_or_region
order by tb2.explained_by_social_support desc;

	-- Healthy Life Expectancy
select tb2.regional_indicator as "Global Region", 
		tb1.country_or_region as "Country", 
		round(min(tb1.healthy_life_expectancy),3) as "2019 MIN Healthy Life Expectancy", 
		round(max(tb1.healthy_life_expectancy),3) as "2019 MAX Healthy Life Expectancy",
		round(min(Explained_by_Healthy_life_expectancy),3) as "2020 MIN Healthy Life Expectancy", 
		round(max(Explained_by_Healthy_life_expectancy),3) as "2020 MAX Healthy Life Expectancy"
from world_happiness_report.happiness_data_2019 tb1
inner join world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
group by tb2.regional_indicator, tb1.country_or_region
order by tb2.explained_by_Healthy_life_expectancy desc;

-- Freedom to make life choices
select tb2.regional_indicator as "Global Region", 
		tb1.country_or_region as "Country", 
		round(min(tb1.freedom_to_make_life_choices),3) as "2019 MIN Freedom to make life choices", 
		round(max(tb1.freedom_to_make_life_choices),3) as "2019 MAX Freedom to make life choices",
		round(min(Explained_by_Freedom_to_make_life_choices),3) as "2020 MIN Freedom to make life choices", 
		round(max(Explained_by_Freedom_to_make_life_choices),3) as "2020 MAX Freedom to make life choices"
from world_happiness_report.happiness_data_2019 tb1
inner join world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
group by tb2.regional_indicator, tb1.country_or_region
order by tb2.explained_by_Freedom_to_make_life_choices desc;

   -- Generosity
select tb2.regional_indicator as "Global Region", 
		tb1.country_or_region as "Country", 
		round(min(tb1.generosity),3) as "2019 MIN Generosity", 
		round(max(tb1.generosity),3) as "2019 MAX Generosity",
		round(min(Explained_by_generosity),3) as "2020 MIN Generosity", 
		round(max(Explained_by_generosity),3) as "2020 MAX Generosity"
from world_happiness_report.happiness_data_2019 tb1
inner join world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
group by tb2.regional_indicator, tb1.country_or_region
order by tb2.Explained_by_generosity desc;

	-- Perceptions of corruption
select tb2.regional_indicator as "Global Region", 
		tb1.country_or_region as "Country", 
		round(min(tb1.perceptions_of_corruption),3) as "2019 MIN Perceptions of Corruption", 
		round(max(tb1.perceptions_of_corruption),3) as "2019 MAX Perceptions of Corruption",
		round(min(Explained_by_Perceptions_of_corruption),3) as "2020 MIN Perceptions of Corruption", 
		round(max(Explained_by_Perceptions_of_corruption),3) as "2020 MAX Perception of Corruption"
from world_happiness_report.happiness_data_2019 tb1
inner join world_happiness_report.happiness_data_2020 tb2
on tb1.country_or_region = tb2.country_name
group by tb2.regional_indicator, tb1.country_or_region
order by tb2.Explained_by_Perceptions_of_Corruption desc;

			-- COUNT HOW MANY COUNTRIES HAVE A SCORE BELOW 3 & ABOVE 7 - HOW DOES THIS RELATE TO EACH REGION
Select * from world_happiness_report.happiness_data_2019;
Select * from world_happiness_report.happiness_data_2020;

	-- 2019 score
select country_or_region as "Country",  
case when score > 7 then "Greater than 7"
	 when score < 3 then "Less than 3"
else "Between 3 and 7" end as "Score Range"
from world_happiness_report.happiness_data_2019;

	-- this gives a count of 16 out of 156
select count(country_or_region) from world_happiness_report.happiness_data_2019
where score > 7;

	-- this gives a count of 1 out of 156
select count(country_or_region) from world_happiness_report.happiness_data_2019
where score < 3;

	-- 2020 Score
select regional_indicator as "Global Region",
		country_name as "Country",		
case when ladder_score > 7 then "Above 7"
	 when ladder_score < 3 then "Below 3"
else "Between 3 and 7" end as "Score Range"
from world_happiness_report.happiness_data_2020;

-- this gives 17 out of 153 countries
select count(country_name) from world_happiness_report.happiness_data_2020
where ladder_score > 7;

-- this gives 2 out of 153 countries
select count(country_name) from world_happiness_report.happiness_data_2020
where ladder_score < 3;