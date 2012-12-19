#! /usr/bin/perl
use warnings;
use strict;

my $input_matrix = "list_to_check.txt";
open(OUT,">>"."results_10_10.txt");
open (LIST, $input_matrix) or die $!;
my ($line,@temp,@C2H2,@HD,@NHR,@other,$x,$nameA,$nameB,$value);
$line=$x=$nameA=$nameB=$value=0;


while($line = <LIST>){ 
	# Chop off new line character, skip the comments and empty lines.                 
    chomp($line); 
	@temp = split(/\t/, $line);

	$nameA = $temp[0];
	$nameB = $temp[1];
	$value=$temp[2];
	if($nameB eq 'C39E6.4'){
		print OUT "$nameA\t$nameB\t$value\n";
	
	}

}

