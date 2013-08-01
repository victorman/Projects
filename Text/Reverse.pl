#! /usr/bin/perl

# Reverse.pl

use Getopt::Long;
use strict;

my $str;

GetOptions( "string=s" => \$str);

print( scalar reverse( $str ), "\n");
