<?php

$numbers = [4, 2, 1, 3];

usort($numbers, function($a, $b) {
    if ($a == $b) {
        return 0;
    }
    return ($a < $b) ? -1 : 1;
});

print_r($numbers);
