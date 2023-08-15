<?php

require_once "vendor/autoload.php";

$container = new DI\Container();
$userManager = $container->get('UserManager');

$userManager->register('dummy@mail.com', 'password');
