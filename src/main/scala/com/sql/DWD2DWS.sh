#!/bin/bash
args=$1
dt=
if[${#args1} == 0]
then
dt=`date -d "1 day ago" "+%Y%m%d"`
else
dt=$1
fi
#aaaaaaaaaaa
echo "load dwd hive"
hive -hivevar date_dt=${dt} -f ÎÄ¼şÃû.sql
