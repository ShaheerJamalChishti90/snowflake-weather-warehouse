-- Create a new database
-- CREATE DATABASE data_design;

-- Switch to the newly created database
USE DATABASE data_design;

-- Create a schema for staging data
-- CREATE SCHEMA staging;

-- Switch to the staging schema
USE SCHEMA staging;

-- Create a file format for JSON files
create or replace file format jsonformat type='JSON' strip_outer_array=true;

-- Create a stage for JSON files using the defined format
create or replace stage json_stage file_format = jsonformat;

list @json_stage;
--REMOVE @json_stage;

create or replace table yelp_academic_dataset_business(recordjson variant);
create or replace table yelp_academic_dataset_checkin(recordjson variant);
create or replace table yelp_academic_dataset_covid_features(recordjson variant);
create or replace table yelp_academic_dataset_review(recordjson variant);
create or replace table yelp_academic_dataset_tip(recordjson variant);
create or replace table yelp_academic_dataset_user(recordjson variant);

-- truncate table yelp_academic_dataset_checkin;
USE WAREHOUSE my_wh;

-- Load business data
COPY INTO yelp_academic_dataset_business
FROM @json_stage/yelp_academic_dataset_business.json.gz
FILE_FORMAT = (FORMAT_NAME = jsonformat);

-- Load checkin data
COPY INTO yelp_academic_dataset_checkin
FROM @json_stage/yelp_academic_dataset_checkin.json.gz
FILE_FORMAT = (FORMAT_NAME = jsonformat);

-- Load covid features data
COPY INTO yelp_academic_dataset_covid_features
FROM @json_stage/yelp_academic_dataset_covid_features.json.gz
FILE_FORMAT = (FORMAT_NAME = jsonformat);

-- Load review data
COPY INTO yelp_academic_dataset_review
FROM @json_stage/yelp_academic_dataset_review.json.gz
FILE_FORMAT = (FORMAT_NAME = jsonformat);

-- Load tip data
COPY INTO yelp_academic_dataset_tip
FROM @json_stage/yelp_academic_dataset_tip.json.gz
FILE_FORMAT = (FORMAT_NAME = jsonformat);

-- Load user data
COPY INTO yelp_academic_dataset_user
FROM @json_stage/yelp_academic_dataset_user.json.gz
FILE_FORMAT = (FORMAT_NAME = jsonformat);

select * from yelp_academic_dataset_business
limit 50;


SELECT
  recordjson:"business_id"::STRING        AS business_id,
  recordjson:"name"::STRING               AS name,
  recordjson:"address"::STRING            AS address,
  recordjson:"city"::STRING               AS city,
  recordjson:"state"::STRING              AS state,
  recordjson:"postal_code"::STRING        AS postal_code,
  recordjson:"latitude"::FLOAT            AS latitude,
  recordjson:"longitude"::FLOAT           AS longitude,
  recordjson:"stars"::FLOAT               AS stars,
  recordjson:"review_count"::INT          AS review_count,
  recordjson:"is_open"::INT               AS is_open,
  recordjson:"categories"::STRING         AS categories,
  recordjson:"attributes":"ByAppointmentOnly"::STRING AS by_appointment_only
FROM yelp_academic_dataset_business
limit 1;

