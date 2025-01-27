## Question 1. Understanding docker first run 

Run docker with the `python:3.12.8` image in an interactive mode, use the entrypoint `bash`.

What's the version of `pip` in the image?

- 24.3.1

## Question 2. Understanding Docker networking and docker-compose

Given the following `docker-compose.yaml`, what is the `hostname` and `port` that **pgadmin** should use to connect to the postgres database?

- postgres:5432

## Question 3. Trip Segmentation Count

During the period of October 1st 2019 (inclusive) and November 1st 2019 (exclusive), how many trips, **respectively**, happened:
1. Up to 1 mile
2. In between 1 (exclusive) and 3 miles (inclusive),
3. In between 3 (exclusive) and 7 miles (inclusive),
4. In between 7 (exclusive) and 10 miles (inclusive),
5. Over 10 miles 

Answers:
- 104,802;  198,924;  109,603;  27,678;  35,189

Sql query command: 
```sql
select
	count(case when trip_distance <= 1 then 1 end) as "up_to_1",
	count(case when trip_distance > 1 and trip_distance <= 3 then 1 end) as "1_to_3",
	count(case when trip_distance > 3 and trip_distance <= 7 then 1 end) as "3_to_7",
	count(case when trip_distance > 7 and trip_distance <= 10 then 1 end) as "7_to_10",
	count(case when trip_distance > 10 then 1 end) as "over_10"
from 
	green_taxi_data
where 
	lpep_dropoff_datetime::DATE >= '2019-10-1' and lpep_dropoff_datetime::DATE < '2019-11-1';
```


## Question 4. Longest trip for each day

Which was the pick up day with the longest trip distance?
Use the pick up time for your calculations.

Tip: For every day, we only care about one single trip with the longest distance. 

- 2019-10-31

Sql query command:
```sql
select
	MAX(trip_distance) as "max_trip_distance",
	lpep_pickup_datetime::DATE as "pickup_day"
from 
	green_taxi_data
group by 
	lpep_pickup_datetime
order by 
	max_trip_distance DESC
```

## Question 5. Three biggest pickup zones

Which were the top pickup locations with over 13,000 in
`total_amount` (across all trips) for 2019-10-18?

Consider only `lpep_pickup_datetime` when filtering by date.
 
- East Harlem North, East Harlem South, Morningside Heights

Sql query command:
```sql
with sum_total_amount as (
select
	g."PULocationID",
	sum(g.total_amount) as sum_total_amount,
	zpu."Zone"
from 
	green_taxi_data g left join zones zpu
	ON g."PULocationID" = zpu."LocationID"
where 
	g."lpep_pickup_datetime"::DATE = '2019-10-18'
group by
	g."PULocationID",
	zpu."Zone"
order by
	sum_total_amount DESC
)
select * from sum_total_amount where sum_total_amount > 13000
```


## Question 6. Largest tip

For the passengers picked up in October 2019 in the zone
named "East Harlem North" which was the drop off zone that had
the largest tip?

Note: it's `tip` , not `trip`

We need the name of the zone, not the ID.

- JFK Airport

Sql query command:
```sql
select
	zdo."Zone" as dropoff_zone,
	max(tip_amount) as max_tip_amount
from 
	green_taxi_data g left join zones zpu
	ON g."PULocationID" = zpu."LocationID"
	left join zones zdo
	ON g."DOLocationID" = zdo."LocationID"
where 
	g.lpep_pickup_datetime::DATE < '2019-11-1'
	and zpu."Zone" = 'East Harlem North'
group by
	1
order by 
	2 DESC
```


## Question 7. Terraform Workflow

Which of the following sequences, **respectively**, describes the workflow for: 
1. Downloading the provider plugins and setting up backend,
2. Generating proposed changes and auto-executing the plan
3. Remove all resources managed by terraform`

Answers:
- terraform init, terraform apply -auto-approve, terraform destroy
