
ALTER TABLE `test` PARTITION BY RANGE COLUMNS(`date_at`) (
    PARTITION  p20231015 VALUES LESS THAN ('2023-10-16 00:00:00')
,   PARTITION  p20231016 VALUES LESS THAN ('2023-10-17 00:00:00')
);