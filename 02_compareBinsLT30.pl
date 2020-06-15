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

#open a file and read in all lines into an array
open  (INFILE, "$in") or die $!;   


$length{"rl10"} = $varnts{"rl10"} = $length{"rl11"} = $varnts{"rl11"} = $length{"rl12"} = $varnts{"rl12"} = $length{"rl13"} = $varnts{"rl13"} = $length{"rl14"} = $varnts{"rl14"} = $length{"rl15"} = $varnts{"rl15"} = $length{"rl16"} = $varnts{"rl16"} = $length{"rl17"} = $varnts{"rl17"} = $length{"rl18"} = $varnts{"rl18"} = $length{"rl19"} = $varnts{"rl19"} = $length{"rl20"} = $varnts{"rl20"} = $length{"rl21"} = $varnts{"rl21"} = $length{"rl22"} = $varnts{"rl22"} = $length{"rl23"} = $varnts{"rl23"} = $length{"rl24"} = $varnts{"rl24"} = $length{"rl25"} = $varnts{"rl25"} = $length{"rl26"} = $varnts{"rl26"} = $length{"rl27"} = $varnts{"rl27"} = $length{"rl28"} = $varnts{"rl28"} = $length{"rl29"} = $varnts{"rl29"} = $length{"rl30"} = $varnts{"rl30"} = $length{"rl31"} = $varnts{"rl31"} = $length{"rl32"} = $varnts{"rl32"} = $length{"rl33"} = $varnts{"rl33"} = $length{"rl34"} = $varnts{"rl34"} = $length{"rl35"} = $varnts{"rl35"} = $length{"rl40"} = $varnts{"rl40"} = $length{"rl45"} = $varnts{"rl45"} = $length{"rl50"} = $varnts{"rl50"} = $length{"rl55"} = $varnts{"rl55"} = $length{"rl60"} = $varnts{"rl60"} =  0;  

while (my $line = <INFILE>) {
    chomp($line);
    my @lineArray = split("\t", $line);
    my $length = $lineArray[0];
    my $varnts = $lineArray[1];    
    
       if ($length == 10) {  if ($length{"rl10"}<$thresh) { $length{"rl10"}  += $length ;   $varnts{"rl10"}  += $varnts ;} } 
    elsif ($length == 11) {  if ($length{"rl11"}<$thresh) { $length{"rl11"}  += $length ;   $varnts{"rl11"}  += $varnts ;} } 
    elsif ($length == 12) {  if ($length{"rl12"}<$thresh) { $length{"rl12"}  += $length ;   $varnts{"rl12"}  += $varnts ;} }    
    elsif ($length == 13) {  if ($length{"rl13"}<$thresh) { $length{"rl13"}  += $length ;   $varnts{"rl13"}  += $varnts ;} } 
    elsif ($length == 14) {  if ($length{"rl14"}<$thresh) { $length{"rl14"}  += $length ;   $varnts{"rl14"}  += $varnts ;} }    
    elsif ($length == 15) {  if ($length{"rl15"}<$thresh) { $length{"rl15"}  += $length ;   $varnts{"rl15"}  += $varnts ;} } 
    elsif ($length == 16) {  if ($length{"rl16"}<$thresh) { $length{"rl16"}  += $length ;   $varnts{"rl16"}  += $varnts ;} }    
    elsif ($length == 17) {  if ($length{"rl17"}<$thresh) { $length{"rl17"}  += $length ;   $varnts{"rl17"}  += $varnts ;} } 
    elsif ($length == 18) {  if ($length{"rl18"}<$thresh) { $length{"rl18"}  += $length ;   $varnts{"rl18"}  += $varnts ;} }    
    elsif ($length == 19) {  if ($length{"rl19"}<$thresh) { $length{"rl19"}  += $length ;   $varnts{"rl19"}  += $varnts ;} } 
    elsif ($length == 20) {  if ($length{"rl20"}<$thresh) { $length{"rl20"}  += $length ;   $varnts{"rl20"}  += $varnts ;} }    
    elsif ($length == 21) {  if ($length{"rl21"}<$thresh) { $length{"rl21"}  += $length ;   $varnts{"rl21"}  += $varnts ;} } 
    elsif ($length == 22) {  if ($length{"rl22"}<$thresh) { $length{"rl22"}  += $length ;   $varnts{"rl22"}  += $varnts ;} }    
    elsif ($length == 23) {  if ($length{"rl23"}<$thresh) { $length{"rl23"}  += $length ;   $varnts{"rl23"}  += $varnts ;} } 
    elsif ($length == 24) {  if ($length{"rl24"}<$thresh) { $length{"rl24"}  += $length ;   $varnts{"rl24"}  += $varnts ;} }    
    elsif ($length == 25) {  if ($length{"rl25"}<$thresh) { $length{"rl25"}  += $length ;   $varnts{"rl25"}  += $varnts ;} } 
    elsif ($length == 26) {  if ($length{"rl26"}<$thresh) { $length{"rl26"}  += $length ;   $varnts{"rl26"}  += $varnts ;} }    
    elsif ($length == 27) {  if ($length{"rl27"}<$thresh) { $length{"rl27"}  += $length ;   $varnts{"rl27"}  += $varnts ;} } 
    elsif ($length == 28) {  if ($length{"rl28"}<$thresh) { $length{"rl28"}  += $length ;   $varnts{"rl28"}  += $varnts ;} }    
    elsif ($length == 29) {  if ($length{"rl29"}<$thresh) { $length{"rl29"}  += $length ;   $varnts{"rl29"}  += $varnts ;} } 
    elsif ($length == 30) {  if ($length{"rl30"}<$thresh) { $length{"rl30"}  += $length ;   $varnts{"rl30"}  += $varnts ;} }    
    elsif ($length == 31) {  if ($length{"rl31"}<$thresh) { $length{"rl31"}  += $length ;   $varnts{"rl31"}  += $varnts ;} } 
    elsif ($length == 32) {  if ($length{"rl32"}<$thresh) { $length{"rl32"}  += $length ;   $varnts{"rl32"}  += $varnts ;} }    
    elsif ($length == 33) {  if ($length{"rl33"}<$thresh) { $length{"rl33"}  += $length ;   $varnts{"rl33"}  += $varnts ;} } 
    elsif ($length == 34) {  if ($length{"rl34"}<$thresh) { $length{"rl34"}  += $length ;   $varnts{"rl34"}  += $varnts ;} }    
    elsif ($length == 35) {  if ($length{"rl35"}<$thresh) { $length{"rl35"}  += $length ;   $varnts{"rl35"}  += $varnts ;} } 
    elsif ($length == 40) {  if ($length{"rl40"}<$thresh) { $length{"rl40"}  += $length ;   $varnts{"rl40"}  += $varnts ;} } 
    elsif ($length == 45) {  if ($length{"rl45"}<$thresh) { $length{"rl45"}  += $length ;   $varnts{"rl45"}  += $varnts ;} } 
    elsif ($length == 50) {  if ($length{"rl50"}<$thresh) { $length{"rl50"}  += $length ;   $varnts{"rl50"}  += $varnts ;} } 
    elsif ($length == 55) {  if ($length{"rl55"}<$thresh) { $length{"rl55"}  += $length ;   $varnts{"rl55"}  += $varnts ;} } 
    elsif ($length == 60) {  if ($length{"rl60"}<$thresh) { $length{"rl60"}  += $length ;   $varnts{"rl60"}  += $varnts ;} } 
    
}

print "bin\tlngth\tvars\n"; 
foreach my $key (sort keys %varnts) {
    print "$key\t"; 
    print "$length{$key}\t";
    print "$varnts{$key}\n";
}

print "\n\n"; 




