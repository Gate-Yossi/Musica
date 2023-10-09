<?php

require 'vendor/autoload.php';

use SlopeIt\ClockMock\ClockMock;

ClockMock::freeze(new \DateTime('1986-06-05'));

// Code executed in here, until ::reset is called, will use the above date and time as "current"
$nowYmd = date('Y-m-d');

ClockMock::reset();

echo $nowYmd . PHP_EOL;

echo date('Y-m-d') . PHP_EOL;

