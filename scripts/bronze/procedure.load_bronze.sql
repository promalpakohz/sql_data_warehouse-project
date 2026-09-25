CREATE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
begin
raise notice '===================================================';
raise notice 'Loading bronze layer';
raise notice '====================================================';

raise notice '=====================================================';
raise notice 'Loading CRM Tables';
raise notice '=====================================================';

raise notice '>>Truncating the table';
truncate bronze.crm_cust_info;
COPY bronze.crm_cust_info FROM 
'C:\data warehouse\datasets\source_crm\cust_info.csv'
WITH(
  FORMAT 'csv',
  HEADER 'true',
  DELIMITER ',',
  ENCODING 'utf8'
);

truncate bronze.crm_prd_info;
COPY bronze.crm_prd_info FROM
'C:\data warehouse\datasets\source_crm\prd_info.csv'
WITH(
  FORMAT 'csv',
  HEADER 'true',
  DELIMITER ',',
  ENCODING 'utf8'
  );
  
  TRUNCATE  bronze.crm_sales_details;
 COPY bronze.crm_sales_details FROM
'C:\data warehouse\datasets\source_crm\sales_details.csv'
WITH(
  FORMAT 'csv',
  HEADER 'true',
  DELIMITER ',',
  ENCODING 'utf8'
  );
  
 TRUNCATE "bronze"."erp_CUST_AZ12"; 
COPY bronze."erp_CUST_AZ12" FROM
'C:\data warehouse\datasets\source_erp\CUST_AZ12.csv'
WITH(
  FORMAT 'csv',
  HEADER 'true',
  DELIMITER ',',
  ENCODING 'utf8'
  );

TRUNCATE  "bronze"."erp_LOC_A101";  
COPY bronze."erp_LOC_A101" FROM
'C:\data warehouse\datasets\source_erp\LOC_A101.csv'
WITH(
  FORMAT 'csv',
  HEADER 'true',
  DELIMITER ',',
  ENCODING 'utf8'
  );
  truncate "bronze"."erp_PX_CAT_G1V2";
 COPY bronze."erp_PX_CAT_G1V2" FROM
'C:\data warehouse\datasets\source_erp\PX_CAT_G1V2.csv'
WITH(
  FORMAT 'csv',
  HEADER 'true',
  DELIMITER ',',
  ENCODING 'utf8'
  );
  end;
  $$
