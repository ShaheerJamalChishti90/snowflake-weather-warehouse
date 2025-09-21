USE DATABASE ;
create schema DWHH;
USE SCHEMA DWHH;
USE WAREHOUSE my_wh;

drop schema DWHH;


create or replace table "DIM_CUSTOMER"(
    "customer_id" string primary key,
    "name" string,
    "average_stars" double,
    "fans" number,
    "review_count" number
);

insert into "DIM_CUSTOMER"
select distinct
    "customer_id",
    "name",
    "average_stars",
    "fans",
    "review_count"
from data_design.ODS."CUSTOMER";


-- table dim_temperature

create or replace table "DIM_TEMPERATURE"(
    "date" DATE primary key,
    "min_temp" double,
    "max_temp" double,
    "normal_min" double,
    "normal_max" double
);

insert into "DIM_TEMPERATURE"
select distinct
    "date",
    "min_temp",
    "max_temp",
    "normal_min",
    "normal_max"
from 
    data_design.ODS."TEMPERATURE";

-- table dim_precipitation

create or replace table "DIM_PRECIPITATION"(
    "date" DATE primary key,
    "precipitation" string,
    "precipitation_normal" string
);

insert into "DIM_PRECIPITATION"
select distinct
    "date",
    "precipitation",
    "precipitation_normal"
from 
    data_design.ODS."PRECIPITATION";


-- table dim_business

create or replace table "DIM_BUSINESS"(
    "business_id" string primary key,
    "name" string,
    "is_open" number,
    "stars" double,
    "city" string,
    "state" string,
    "postal_code" string,
    "checkin_dates" string
);


insert into "DIM_BUSINESS"(
    "business_id",
    "name",
    "is_open",
    "stars",
    "city",
    "state",
    "postal_code",
    "checkin_dates"
)
select
    b."business_id",
    b."name",
    b."is_open",
    b."stars",
    g."city",
    g."state",
    g."postal_code",
    ch."date"
from data_design.ODS."BUSINESS" as b 
join data_design.ODS."GEOGRAPHY" as g on b."geography_id" =  g."geography_id"
join data_design.ODS."CHECKIN" as ch on b."business_id" = ch."business_id";

-- table fact

create or replace table "FACT"(
    "fact_id" string primary key,
    "business_id" string references data_design.DWH."DIM_BUSINESS"("business_id"),
    "customer_id" string references data_design.DWH."DIM_CUSTOMER"("customer_id"),
    "date" date references data_design.DWH."DIM_TEMPERATURE"("date" ),
    "stars" double
);

insert into "FACT"
select
    r."review_id",
    r."business_id",
    r."user_id",
    r."date",
    r."stars"
from
    data_design.ODS."REVIEW" as r;