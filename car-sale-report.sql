select * from road_accident;

----Current Year Total Casualties----
SELECT 
    round(SUM(number_of_casualties)/1000.0,1)||'K' AS YTD_Casualties
FROM road_accident
WHERE DATE_PART('year', accident_date) = 2022 


----Current Year Total Accident----
SELECT 
    round(count(accident_index)/1000.0,1)||'K' AS Total_accident
FROM road_accident
WHERE DATE_PART('year', accident_date) = 2022 


----Current year Fatal Casualties----
SELECT 
    (SUM(number_of_casualties)) AS YTD_Fatal_Casualties
FROM road_accident
WHERE DATE_PART('year', accident_date) = 2022 and accident_severity= 'Fatal'; 


----Current  year Serious Casualties----
SELECT 
    round(SUM(number_of_casualties)/1000.0,1)||'K' AS YTD_Serious_Casualties
FROM road_accident
WHERE DATE_PART('year', accident_date) = 2022 and accident_severity= 'Serious'; 


----Current Year Slight Casualties----
SELECT 
    round(SUM(number_of_casualties)/1000.0,1)||'K' AS YTD_Slight_Casualties
FROM road_accident
WHERE DATE_PART('year', accident_date) = 2022 and accident_severity= 'Slight'; 


----Total Casualties with respect to Vehicle type for Current Year----
select
	case
		when vehicle_type in('Taxi/Private hire car','Car') then 'Cars'
		when vehicle_type in ('Motorcycle over 500cc','Pedal cycle','Motorcycle over 125cc and up to 500cc','Motorcycle 125cc and under','Motorcycle 50cc and under') then 'Bike'
		when vehicle_type in ('Minibus (8 - 16 passenger seats)','Bus or coach (17 or more pass seats)')then 'Bus'
		when vehicle_type in ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t','Van / Goods 3.5 tonnes mgw or under')then 'Van'
		when vehicle_type in ('Agricultural vehicle') then 'Agriculture'
		else 'other'
		end as vehicle_group,
		sum(number_of_casualties) as CY_casualties
		from road_accident
		where date_part('year',accident_date)=2022
		group by
		case
		when vehicle_type in('Taxi/Private hire car','Car') then 'Cars'
		when vehicle_type in ('Motorcycle over 500cc','Pedal cycle','Motorcycle over 125cc and up to 500cc','Motorcycle 125cc and under','Motorcycle 50cc and under') then 'Bike'
		when vehicle_type in ('Minibus (8 - 16 passenger seats)','Bus or coach (17 or more pass seats)')then 'Bus'
		when vehicle_type in ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t','Van / Goods 3.5 tonnes mgw or under')then 'Van'
		when vehicle_type in ('Agricultural vehicle') then 'Agriculture'
		else 'other'
		end;


-----Monthly trend showing comparison of casualties for Current Year and previous year-----
select 
	to_char(accident_date,'Mon')as month_name, 
	sum(number_of_casualties)
from road_accident
where date_part('year',accident_date)=2022
group by 
		to_char(accident_date,'Mon') ,
		date_part('month',accident_date) 
order by  date_part('month',accident_date);


-----Casualties by road type for  current Year----
select  road_type, round(sum(number_of_casualties)/1000.0,1)||'K' as CY_Casualties
from road_accident
where date_part('year',accident_date) =2022
group by road_type
order by sum(number_of_casualties) desc;


-----Current Year Casualties by  urban or rural area-----
select 
	urban_or_rural_area,
	round(
	sum(number_of_casualties)::numeric /
	(select sum(number_of_casualties) 
	from road_accident
	where date_part('year',accident_date) =2022
	)*100,
	2)as CY_Casualties_in_per
from road_accident
where date_part('year',accident_date) =2022
group by urban_or_rural_area;


----Current Year Casualties by Day/light-----
select 
	case 
	when light_conditions in('Darkness - lighting unknown','Darkness - lights lit','Darkness - lights unlit','Darkness - no lighting') then 'Dark'
	when light_conditions in ('Daylight') then 'Light'
	end as light_group,
	round(
	sum(number_of_casualties)::numeric/
	(select sum(number_of_casualties) 
	from road_accident
	where date_part('year',accident_date)=2022
	)*100
	,2)as CY_casualties
	from road_accident
	where date_part('year',accident_date)=2022
	group by
	case 
	when light_conditions in('Darkness - lighting unknown','Darkness - lights lit','Darkness - lights unlit','Darkness - no lighting') then 'Dark'
	when light_conditions in ('Daylight') then 'Light'
	end;


----Top 10 Current Year Casualties by location----
select local_authority,round(sum(number_of_casualties)/1000.0,2) || 'K' as CY_casualties
from road_accident
group by local_authority
order by sum(number_of_casualties) desc
limit 10;


