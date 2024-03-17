<?php
// router.php
if (preg_match('/\.(?:png|jpg|jpeg|gif)$/', $_SERVER["REQUEST_URI"])) {
    return false;    // リクエストされたリソースをそのままの形式で扱います。
} elseif (preg_match('/info\.php$/', $_SERVER["REQUEST_URI"])) {
    return false;    // リクエストされたリソースをそのままの形式で扱います。
} else { 
    echo "<p>Welcome to PHP</p>";
}
