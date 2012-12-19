#! /usr/bin/perl
use warnings;
use strict;

my $input_matrix = "results_random_family.txt";
open(OUT,">"."stats.txt");
open (LIST, $input_matrix) or die $!;
my ($line,@temp,@C2H2,@HD,@NHR,@other,$x,%value,$percent,$zprime);
$line=$x=$percent=$zprime=0;
while($line = <LIST>){ 
    # Chop off new line character, skip the comments and empty lines.                 
    chomp($line); 
   @temp = split(/\t/, $line);
	$zprime=$temp[0];
	$value{$zprime}++;

}

foreach $zprime ( keys %value ) {
	my $amount = $value{$zprime}; 	
		print "$zprime\t$amount\n";


}

close(OUT);
close(LIST);