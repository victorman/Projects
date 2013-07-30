#! /usr/bin/perl

# Primes.pl
# return primes at user prompt until exit.

use Math::Complex;
use strict;

my @primes;
my $input;

sub gen_primes {
    use integer;
    my $max = shift;
    my ($i,$j);
    for ($i = 0; $i < $max; $i++) { $primes[$i] = 1; }
    for ($i = 2; $i <= sqrt($max); $i++) {
        if ($primes[$i]) {
            for($j=$i;$j*$i<$max;$j++) { $primes[$i*$j] = 0; }
        }
    }
}

my $n = 2;
my $m = 2;
my $len = 1000;
gen_primes($len);
while(1) {
    print "Press enter for next prime. (Ctrl-C to quit)";
    <>;
    
    while(!$primes[$n]) {
        if($n == $len-1) {
            $len*=$m++;
            gen_primes($len);
        }
        $n++;
    }

    print $n."\n";
    $n++;
}
