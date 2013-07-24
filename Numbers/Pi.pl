#! /usr/bin/perl

# Pi.pl
# return pi to n digits.
# referenced and translated code from http://www.mathpropress.com/stan/bibliography/spigot.pdf

use Getopt::Long;
use strict;

use integer;

my $n = 10;
GetOptions ("nthdigit=i" => \$n);

my $len = 10*$n/3;
my ($i,$j,$k,$q,$x,$nines,$predigit);
my @a;

for ($j = 1; $j <= $len; $j++) {
    $a[$j] = 2;
} 

$nines = 0;
$predigit = 0;

for ($j = 1; $j <= $n; $j++) {
    $q = 0;
    for ($i = $len; $i >= 1; $i--) {
        $x = 10*$a[$i] + $q*$i;
        $a[$i] = $x % (2*$i-1);
        $q = $x / (2*$i-1);
    }
    $a[1] = $q % 10;
    $q = $q / 10;
    if ($q == 9) { $nines++; }
    elsif ($q == 10) {
        print $predigit+1;
        for ($k = 1; $k <= $nines; $k++) {
            print 0;
        }
        $predigit = 0;
        $nines = 0;
    }
    else {
        print $predigit;
        $predigit = $q;
        if ($nines != 0) {
            for ($k = 1; $k <= $nines; $k++) {
                print 9;
                $nines = 0;
            }
        }
    }
}
print $predigit."\n";
