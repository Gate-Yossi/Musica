<?php declare(strict_types=1);
use PHPUnit\Framework\Attributes\Depends;
use PHPUnit\Framework\TestCase;

final class MultipleDependenciesTest extends TestCase
{
    public function testA(): string
    {
        $value = 'A';
        $this->assertEquals('A', $value);

        return $value;
    }

    public function testB(): string
    {
        $value = 'B';
        $this->assertEquals('B', $value);

        return $value;
    }

    #[Depends('testA')]
    #[Depends('testB')]
    public function testC(string $valueA, string $valueB): void
    {
        $this->assertEquals('A', $valueA);
        $this->assertEquals('B', $valueB);
    }
}