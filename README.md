# Sales_care_datepipeline

<h1 align="center">ETL Pipeline with stitch,dbt, postgresql,s3 </h1>

<p align="center">
  <a href="#about">About</a> •
  <a href="#prerequisites">Prerequisites</a> •
  <a href="#design">Design</a> •
  <a href="#Data_setup">Data_setup</a> •
  <a href="#Integration_setup">Integration_setup</a> •
  <a href="#Tranformation_setup">Tranformation_setup</a> •
  <a href="#Schedule_and_monitor">Schedule_and_monitor</a> •
  <a href="#Utilized_resources">Utilized_resources</a>
</p>

## About

In order to answer sanity sales care and marketing business questions, the datapipeline has to be designed using  data sources  marketing costs, Google Analytics website transactions, Google Analytics website usage and Shopify website orders.  

An AWS s3 bucket is used as a Data Lake in which given csv files are stored.Here i assumed customer drops csv files to s3 bucket as i received source in csv form. Using stitch integration data loaded to postgresql where further transformations are performed by dbt.

## Prerequisites

1. Stitch account
2. DBT cloud account
3. AWS account and AWS S3 bucket 
4. AWS RDS Postgres 
5. pgcli
6. csv files

## Design

<p align="center"><img src=https://user-images.githubusercontent.com/65566187/137636529-d1ec81db-35d7-4451-9082-20283bd58834.png></p>

## Data_setup

1. Upload all csv files to s3 bucket 
2. After setting up postgres instance use pgcli to create schema salesdata and tables( marketing_costs,google_analytics_webusuage,google_analytics_transcations and shopify_data). 

## Integration_setup

Perform extract and load using stitch

EL for s3 to datawarehouse (postgres)

1. Source S3 path and the file delimiter.Add details of replication frequency and scheduler details.
2. data warehouse connection details (endpoint, port, username, password and database name)
3. the destination data warehouse schema name as salesdata and tables are marketing_costs,google_analytics_webusuage,google_analytics_transcations and shopify_data.
4. set the run frequency

## Tranformation_setup

1.set up a dbt projects sales_care_datapipeline
2.set up database connection to postgres database.
3.set up a repository using github or gitlab and initialize the project repo
4. create the model. as part of this task i created four staging models which can be found models folder. and sources.yml has configuration and quality check details.
5. sources.yml file specifies the testing.If any of the test cases fail it will stop the pipeline.
6. Final model is created in data mart folder.Added some quality checks in schema.yml
7. commit and save file

## Schedule_and_monitor

1) create new environment with production deployment type and postgres datawarehouse.
2) create a job for this new environment and schedule frequency as needed.
3) monitor runs in UI.After every run use pgcli to check datawarehouse.


## Utilized_resources

https://blog.rittmananalytics.com/how-rittman-analytics-does-analytics-modern-bi-stack-operational-analytics-using-looker-stitch-c5ea3df31d23
https://www.startdataengineering.com/post/build-a-simple-data-engineering-platform/
https://pythonrepo.com/repo/renatootescu-ETL-pipeline-python-science-and-data-analysis

