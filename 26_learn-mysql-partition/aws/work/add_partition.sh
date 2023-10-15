#!/bin/bash

host='mysql'
user='root'
pass='P@ssw0rd'

db='sample'
tbl='test'

mysql_cmd="mysql -h${host} -u${user} -p${pass} -D${db}"

partition_info=$(${mysql_cmd} -sN <<EOL
SELECT TABLE_SCHEMA
     , PARTITION_NAME
     , PARTITION_ORDINAL_POSITION
     , PARTITION_EXPRESSION
     , PARTITION_DESCRIPTION
     , TABLE_ROWS
  FROM INFORMATION_SCHEMA.PARTITIONS
 WHERE TABLE_NAME =  '${tbl}'
 ORDER BY PARTITION_DESCRIPTION DESC
 LIMIT 1
;
EOL
);

column=$(echo "${partition_info}" | awk '{print $4}')

max_p_name=$(echo "${partition_info}" | awk '{print $2}')

max_cond_date=$(echo "${partition_info}" | awk '{print $5}')
max_cond_date=${max_cond_date/\'/}

add_cond_date=$(date '+%Y-%m-%d' -d "${max_cond_date} 1 day")
add_p_name=p$(date '+%Y%m%d' -d "${max_cond_date}")

${mysql_cmd} <<EOL
ALTER TABLE \`${tbl}\` ADD PARTITION (
    PARTITION ${add_p_name} VALUES LESS THAN ('${add_cond_date} 00:00:00')
);
EOL

cat <<EOL
success !!
$column
MAX : ${max_p_name} ( LESS THAN ${max_cond_date} )
ADD : ${add_p_name} ( LESS THAN ${add_cond_date} )
EOL
