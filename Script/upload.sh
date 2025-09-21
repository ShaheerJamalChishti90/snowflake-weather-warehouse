-- put data into stage

PUT 'file:///E:/1 CDE/CDE Repos/Snowflake-Data-Warehousing/Dataset/Yelp-JSON/Yelp JSON/yelp_dataset/yelp_academic_dataset_business.json'
  @json_stage
  AUTO_COMPRESS=TRUE;
 
PUT 'file:///E:/1 CDE/CDE Repos/Snowflake-Data-Warehousing/Dataset/Yelp-JSON/Yelp JSON/yelp_dataset/yelp_academic_dataset_checkin.json'
  @json_stage
  AUTO_COMPRESS=TRUE;

PUT 'file:///E:/1 CDE/CDE Repos/Snowflake-Data-Warehousing/Dataset/Yelp-JSON/Yelp JSON/yelp_dataset/yelp_academic_dataset_review.json'
  @json_stage
  AUTO_COMPRESS=TRUE;

  
PUT 'file:///E:/1 CDE/CDE Repos/Snowflake-Data-Warehousing/Dataset/Yelp-JSON/Yelp JSON/yelp_dataset/yelp_academic_dataset_tip.json'
  @json_stage
  AUTO_COMPRESS=TRUE;

PUT 'file:///E:/1 CDE/CDE Repos/Snowflake-Data-Warehousing/Dataset/Yelp-JSON/Yelp JSON/yelp_dataset/yelp_academic_dataset_user.json'
  @json_stage
  AUTO_COMPRESS=TRUE;
  

PUT 'file:///E:/1 CDE/CDE Repos/Snowflake-Data-Warehousing/Dataset/archive/yelp_academic_dataset_covid_features.json'
  @json_stage
  AUTO_COMPRESS=TRUE;
  
 
----------- CSV -----------
  
PUT 'file:///E:/1 CDE/CDE Repos/Snowflake-Data-Warehousing/Dataset/USW00093134-LOS_ANGELES_DOWNTOWN_USC-precipitation-inch.csv'
  @csv_stage
  AUTO_COMPRESS=TRUE;
  
PUT 'file:///E:/1 CDE/CDE Repos/Snowflake-Data-Warehousing/Dataset/USW00093134-temperature-degreeF.csv'
  @csv_stage
  AUTO_COMPRESS=TRUE;
  