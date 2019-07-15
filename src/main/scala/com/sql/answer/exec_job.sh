#!/bin/bash
source /etc/profile
#1. run sqoop job
echo "load full data by sqoop.starting...."
sqoop job -exec sales_source_customer
sqoop job -exec sales_source_product
sqoop job -exec sales_source_sales_order
sqoop job -exec sales_source_customer_append
sqoop job -exec sales_source_product_append
sqoop job -exec sales_source_sales_order_append
echo "load full data by sqoop.ended...."
#2. load data statments.
echo "run hive load data."
hive -e "load data inpath '/qfpj/exam1/sqoop' into table sales_source.customer"
hive -e "load data inpath '/qfpj/exam1/sqoop' into table sales_source.product"
hive -e "load data inpath '/qfpj/exam1/sqoop' into table sales_source.sales_order"
hive -e "load data inpath '/qfpj/exam1/sqoop' into table sales_source.customer_append partition(dt=20190712)"
hive -e "load data inpath '/qfpj/exam1/sqoop' into table sales_source.product_append partition(dt=20190712)"
hive -e "load data inpath '/qfpj/exam1/sqoop' into table sales_source.sales_order_append partition(dt=20190712)"
echo "run hive load data end."