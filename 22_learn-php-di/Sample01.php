<?php

require_once "vendor/autoload.php";

$mailer = new Mailer();
$userManager = new UserManager($mailer);

$userManager->register('dummy@mail.com', 'password');
