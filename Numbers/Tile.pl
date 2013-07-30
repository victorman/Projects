#! /usr/bin/perl

# Tile.pl
# calculate the cost of a WxH floor at cost per tile C.

use Getopt::Long;
use strict;

my ($W, $H, $C);

GetOptions( "Width=i",  \$W,
            "Height=i", \$H);

while(1) {
    print "Enter a cost (Press Ctrl-C to quit):";
    $C = <>;
    if($C =~ /^[\$]?(\d+|\d*\.\d{2})$/) {
        $C =~ s/[\$]//;        
        printf("\$%.2f\n", $W*$H*$C);
    } else {
        print "You did not enter a valid dollar amount.\n";
    }

}
