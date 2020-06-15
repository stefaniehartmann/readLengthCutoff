#!/usr/bin/perl -w

use strict;
use Data::Dumper;

my $in  = $ARGV[0]; 
my $out = $ARGV[1]; 

print "\n------------------------------------------\nprocessing $in\n";

my ($st10, $st20, $st30, $st40, $st50, $st60, $st70, $st80, $st90, $st100, $st110, $st120, $st130, $st140, $st150, $st15, $st25, $st35, $st45, $st55, $st65, $st75, $st85, $st95, $st105, $st115, $st125, $st135, $st145); 
$st10 = $st20 = $st30 = $st40 = $st50 = $st60 = $st70 = $st80 = $st90 = $st100 = $st110 = $st120 = $st130 = $st140 = $st150 = $st15 = $st25 = $st35 = $st45 = $st55 = $st65 = $st75 = $st85 = $st95 = $st105 = $st115 = $st125 = $st135 = $st145 = 0; 
open  (OUT, ">$out") or die $! ;

my $noNMtag = 0; 
open  (INFILE, $in) or die $!;   
while (my $line = <INFILE>) {
    unless ($line =~ /^@/) {
        my @lineArray = split("\t", $line); 
        my $read  = $lineArray[9];  
        my $length = length($read); 
        my $NMtag;
        if ($line =~ /\t(NM:i:[0-9]+)\t/) {
            $NMtag = $1; 
            $NMtag =~ s/NM:i://;
        }
        
        if (defined $NMtag) { 
           # all is well; 
           print OUT "$length\t$NMtag\n"; 
           if ($length < 10 ) {$st10  += $NMtag; }    if ($length < 15 ) {$st15  += $NMtag; }
           if ($length < 20 ) {$st20  += $NMtag; }    if ($length < 25 ) {$st25  += $NMtag; }
           if ($length < 30 ) {$st30  += $NMtag; }    if ($length < 35 ) {$st35  += $NMtag; }
           if ($length < 40 ) {$st40  += $NMtag; }    if ($length < 45 ) {$st45  += $NMtag; }
           if ($length < 50 ) {$st50  += $NMtag; }    if ($length < 55 ) {$st55  += $NMtag; }
           if ($length < 60 ) {$st60  += $NMtag; }    if ($length < 65 ) {$st65  += $NMtag; }
           if ($length < 70 ) {$st70  += $NMtag; }    if ($length < 75 ) {$st75  += $NMtag; }
           if ($length < 80 ) {$st80  += $NMtag; }    if ($length < 85 ) {$st85  += $NMtag; }
           if ($length < 90 ) {$st90  += $NMtag; }    if ($length < 95 ) {$st95  += $NMtag; }
           if ($length < 100) {$st100 += $NMtag; }    if ($length < 105) {$st105 += $NMtag; }
           if ($length < 110) {$st110 += $NMtag; }    if ($length < 115) {$st115 += $NMtag; }
           if ($length < 120) {$st120 += $NMtag; }    if ($length < 125) {$st125 += $NMtag; }
           if ($length < 130) {$st130 += $NMtag; }    if ($length < 135) {$st135 += $NMtag; }
           if ($length < 140) {$st140 += $NMtag; }    if ($length < 145) {$st145 += $NMtag; }
           if ($length < 150) {$st150 += $NMtag; }
            
        } else {
            $noNMtag++; 
        }
    }
        
}
print "$noNMtag without NMtag!\n";    


 


