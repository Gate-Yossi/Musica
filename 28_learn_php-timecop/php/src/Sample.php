<?php

function demo()
{
    if ( ! function_exists('timecop_freeze') ) {
        printf('Dose not exist timecop_freeze function'.PHP_EOL);
        return;
    }

    $freezeUnixtimestamp = (new \DateTime('2023-12-01 12:00:00'))->format('U');

    printf('---'.PHP_EOL);
    printf('timecop_freeze() before'.PHP_EOL);

    printDate();

    // 日時を固定
    timecop_freeze($freezeUnixtimestamp);

    printf('---'.PHP_EOL);
    printf('timecop_freeze() after'.PHP_EOL);

    printDate();

    printf('wait 10s'.PHP_EOL);

    sleep(10);

    printDate();

    // 日時へ変更
    timecop_travel($freezeUnixtimestamp);

    printf('---'.PHP_EOL);
    printf('timecop_travel() after'.PHP_EOL);

    printDate();

    printf('wait 10s'.PHP_EOL);

    sleep(10);

    printDate();

    // 日時を戻す
    timecop_return();

    printf('---'.PHP_EOL);
    printf('timecop_return() after'.PHP_EOL);

    printDate();
}

function printDate()
{
    printf('Datetime : %s '.PHP_EOL, (new \DateTime())->format('Y-m-d H:i:s'));
    printf('date     : %s '.PHP_EOL, date('Y-m-d H:i:s'));
}

demo();
