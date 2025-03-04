### Quiz Questions
1) Within the execution for `Yellow` Taxi data for the year `2020` and month `12`: what is the uncompressed file size (i.e. the output file `yellow_tripdata_2020-12.csv` of the `extract` task)?
- 128.3 MB

2) What is the value of the variable `file` when the inputs `taxi` is set to `green`, `year` is set to `2020`, and `month` is set to `04` during execution?
- `green_tripdata_2020-04.csv`


3) How many rows are there for the `Yellow` Taxi data for the year 2020?
- 24,648,499

```sql
SELECT
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_01`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_02`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_03`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_04`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_05`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_06`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_07`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_08`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_09`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_10`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_11`) +
      (SELECT COUNT(*) FROM `de-zoomcamp-449017.zoomcamp.yellow_tripdata_2020_12`) AS total_rows;
```

4) How many rows are there for the `Green` Taxi data for the year 2020?
- 1,734,051


5) How many rows are there for the `Yellow` Taxi data for March 2021?
- 1,925,152

6) How would you configure the timezone to New York in a Schedule trigger?
- Add a `timezone` property set to `America/New_York` in the `Schedule` trigger configuration

