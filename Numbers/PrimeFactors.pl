#! /usr/bin/perl

use Getopt::Long;
use Math::Complex;
use strict;

my $n;

GetOptions("prime=i",\$n);

unless($n) { exit(1); }

{
    use integer;
    my $i;
    for ($i = 2; $i <= sqrt($n); $i++) {
        while($n % $i == 0) {
            print $i." ";
            $n /= $i;
        }
    }
    print $n if ($n > 1);
    print "\n";
}
