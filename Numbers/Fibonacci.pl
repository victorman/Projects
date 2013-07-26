#! /usr/bin/perl

use Getopt::Long;
use strict;

my @f;
my $target;

GetOptions ("target=i", \$target);

$f[0] = 0;
$f[1] = 1;

sub fib{
    my $n = shift;

    unless($f[$n]) {
        $f[$n] = $f[$n-1] + $f[$n-2];
    }

    if($n == $target) {
        return $f[$n];
    } else {
        return fib(++$n);
    }
}

print fib(2)."\n";
