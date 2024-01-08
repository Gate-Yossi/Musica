<?php

require "Sample.php";

use PHPUnit\Framework\TestCase;

class SampleTest extends TestCase
{
    public function testHello()
    {
        $this->assertSame('Hello, World!!', hello());
    }
}

