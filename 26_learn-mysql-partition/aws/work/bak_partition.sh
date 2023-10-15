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
 ORDER BY PARTITION_DESCRIPTION ASC
 LIMIT 1
;
EOL
);

column=$(echo "${partition_info}" | awk '{print $4}')

min_p_name=$(echo "${partition_info}" | awk '{print $2}')

min_cond_date=$(echo "${partition_info}" | awk '{print $5}')
min_cond_date=${min_cond_date/\'/}

bak=${tbl}_${min_p_name}.sql

mysqldump -h${host} -u${user} -p${pass} ${db} ${tbl} \
  --default-character-set=utf8 \
  --complete-insert \
  --no-create-info \
  --where="${column}<'${min_cond_date} 00:00:00'" \
> "${bak}"

cat <<EOL
success !!
$column
BAK : ${min_p_name} ( LESS THAN ${min_cond_date} )
${bak}
EOL
