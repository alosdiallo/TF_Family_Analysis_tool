#! /usr/bin/perl
use warnings;
use strict;

my $input_matrix = "results_random_family.txt";
open(OUT,">"."stats.txt");
open (LIST, $input_matrix) or die $!;
my ($line,@temp,@C2H2,@HD,@NHR,@other,$x);
$line=$x=0;
while($line = <LIST>){ 
    # Chop off new line character, skip the comments and empty lines.                 
    chomp($line); 
   @temp = split(/\t/, $line);

	$C2H2[$x]=$temp[0];
	$HD[$x]=$temp[1];
	$NHR[$x]=$temp[2];
	$other[$x]=$temp[3];
	print OUT "$temp[2]\n";
	$x++;
}
print "\n";

close(OUT);
close(LIST);