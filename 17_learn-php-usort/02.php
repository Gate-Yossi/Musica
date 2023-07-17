<?php

$order = ['A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5];

$goods = ['E', 'B', 'D', 'C', 'A'];

usort($goods, function($a, $b) use($order) {
    $oa = $order[$a];
    $ob = $order[$b];
    if ($oa == $ob) {
        return 0;
    }
    return ($oa < $ob) ? -1 : 1;
});

print_r($goods);
