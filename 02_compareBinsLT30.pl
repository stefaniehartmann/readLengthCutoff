#!/usr/bin/perl -w

use strict;
use Data::Dumper;

my $in     = $ARGV[0]; 
my $thresh = $ARGV[1];

print "-----------------------------------\n$in\n"; 

# lengths
my %length;
my %varnts;
my %totals;
my @arr = (10..35, 40, 45, 50, 55, 60);

#open a file and read in all lines into an array
open  (INFILE, "$in") or die $!;   

for (@arr){
    $length{"rl$_"} = $varnts{"rl$_"} = 0;
}


while (my $line = <INFILE>) {
    chomp($line);
    my @lineArray = split("\t", $line);
    my $length = $lineArray[0];
    my $varnts = $lineArray[1];    

    for (@arr){
        if ($length == $_) {
            if ($length{"rl$_"}<$thresh) {
                $length{"rl$_"}  += $length ;
                $varnts{"rl$_"}  += $varnts ;
            }
        }
    }
}

print "bin\tlngth\tvars\n"; 
foreach my $key (sort keys %varnts) {
    print "$key\t"; 
    print "$length{$key}\t";
    print "$varnts{$key}\n";
}

print "\n\n"; 




