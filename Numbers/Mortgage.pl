#! /usr/bin/perl

# Mortgage.pl
# calculate menthly payments on fixed term mortgage

use Getopt::Long;
use strict;

my ($P, $N, $r);

# returns '' if not a valid money amount
#sub isMoney($) {
#    my $c = shift;
#
#    if($c =~ /^[\$]?(\d+|\d*\.\d{2})$/) {
#        $c =~ s/[\$]//;
#        return $c;
        #printf("\$%.2f\n", $W*$H*$c);
#    } else {
#        return '';
        #print "You did not enter a valid dollar amount.\n";
#    }
#}

#sub isPercent($) {
#    my $p = shift;

#    if($p =~ /^(\d+|\d*\.\d+)%?$/) {
#        $p =~ s/%//;
#        return $p;
#    } else {
#        return '';
#    }
#}

GetOptions( "cost=f" =>  \$P,
            "years=i" => \$N,
            "rate=f" =>  \$r);

#print "$P $N $r\n";
#print isMoney($P)."\n";
#print isPercent($r)."\n";

#unless ($P = isMoney($P)) {
#    print "You did not enter a valid dollar amount.\n";
#    exit(1);
#}

#unless ($r = isPercent($r)) {
#    print "remember to provide the rate as a percentage.\n";
#    exit(1);
#}

#if ($N =~ /\d+/) {
#    $N *= 12;
#} else {
#    print "you did not enter a year amount for the term length.\n";
#}

$r = $r/100/12;

my $payment = $r / (1 - (1 + $r)**((-12)*$N));
$payment *= $P;

printf("\$%.2f\n", $payment);
