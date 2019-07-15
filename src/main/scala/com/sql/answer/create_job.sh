#!/bin/bash
source /etc/profile
sqoop job --create sales_source_customer -- import \
--connect jdbc:mysql://192.168.116.191:3306/sales_source?dontTrackOpenResources=true\&defaultFetchSize=1000\&useCursorFetch=true \
--driver com.mysql.jdbc.Driver \
--username root \
--password 123456 \
--table customer \
--delete-target-dir \
--target-dir /qfpj/exam1/sqoop \
--fields-terminated-by '\001'
#aaaa
sqoop job --create sales_source_product -- import \
--connect jdbc:mysql://192.168.116.191:3306/sales_source?dontTrackOpenResources=true\&defaultFetchSize=1000\&useCursorFetch=true \
--driver com.mysql.jdbc.Driver \
--username root \
--password 123456 \
--table product \
--delete-target-dir \
--target-dir /qfpj/exam1/sqoop \
--fields-terminated-by '\001'
#aaaa
sqoop job --create sales_source_sales_order -- import \
--connect jdbc:mysql://192.168.116.191:3306/sales_source?dontTrackOpenResources=true\&defaultFetchSize=1000\&useCursorFetch=true \
--driver com.mysql.jdbc.Driver \
--username root \
--password 123456 \
--table sales_order \
--delete-target-dir \
--target-dir /qfpj/exam1/sqoop \
--fields-terminated-by '\001'
#aaaa
sqoop job --create sales_source_customer_append -- import \
--connect jdbc:mysql://192.168.116.191:3306/sales_source?dontTrackOpenResources=true\&defaultFetchSize=1000\&useCursorFetch=true \
--driver com.mysql.jdbc.Driver \
--username root \
--password 123456 \
--table customer \
--target-dir /qfpj/exam1/sqoop \
--fields-terminated-by '\001' \
--check-column customer_number \
--incremental append \
--last-value 0
#aaaa
sqoop job --create sales_source_product_append -- import \
--connect jdbc:mysql://192.168.116.191:3306/sales_source?dontTrackOpenResources=true\&defaultFetchSize=1000\&useCursorFetch=true \
--driver com.mysql.jdbc.Driver \
--username root \
--password 123456 \
--table product \
--target-dir /qfpj/exam1/sqoop \
--fields-terminated-by '\001' \
--check-column product_code \
--incremental append \
--last-value 0
#aaaa
sqoop job --create sales_source_sales_order_append -- import \
--connect jdbc:mysql://192.168.116.191:3306/sales_source?dontTrackOpenResources=true\&defaultFetchSize=1000\&useCursorFetch=true \
--driver com.mysql.jdbc.Driver \
--username root \
--password 123456 \
--table sales_order \
--target-dir /qfpj/exam1/sqoop \
--fields-terminated-by '\001' \
--check-column order_number \
--incremental append \
--last-value 0
#aaaa