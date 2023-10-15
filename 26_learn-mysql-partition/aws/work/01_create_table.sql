
CREATE TABLE test(
    `id`      INT UNSIGNED AUTO_INCREMENT            COMMENT 'ID'
,   `name`    TEXT                                   COMMENT '名称'
,   `date_at` DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '日付'
,   PRIMARY KEY(`id`, `date_at`)
);
