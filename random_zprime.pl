#! /usr/bin/perl
use warnings;
use strict;
open(OUT,">>"."results_random_family.txt");
my $x;
for($x = 0;$x < 10000;$x++){
	my $matrix_name = $ARGV[0];
	my $amount = $ARGV[1];

	my $myPval = `Rscript random_family.r $matrix_name $amount`;
	chomp $myPval;

	#$myPval = (split(/\s+/, $myPval))[1];
	#print "$myPval";

	open TOY, "result.txt" or die $!;

	my ($line,$total,$i,$k,$j,$element,$l,$C2H2,$C2H2_or_HD,$HD,$NHR,$other,$C2H2_count,$C2H2_or_HD_count,$HD_count,$NHR_count,$other_count,$C2H2_p,$C2H2_or_HD_p,$HD_p,$NHR_p,$other_p);
	my (@main_2D_array,@row_array);
	$line=$i=$k=$total=$j=$element=$l=$C2H2_count=$C2H2_or_HD_count=$HD_count=$NHR_count=$other_count=$C2H2_p=$C2H2_or_HD_p=$HD_p=$NHR_p=$other_p= 0;

my %zprime=();
	while($line = <TOY>){ 
		# Chop off new line character, skip the comments and empty lines.                 
		chomp($line); 
		@row_array = split(/\t/, $line);
	   $j=0;
		foreach $element (@row_array){
			$element = sprintf "%.1f", $element;
			$total = $total + $element
			#$zprime{$element}++;
		}
		$i++;
	}
	my $average = ($total / $i);
	$average = sprintf "%.1f", $average;
	print OUT "$average\n";
	# my $holder = 0;
	# my $precent = 0;
	
	# foreach $element ( keys %zprime ) {	
		# $holder = $zprime{$element};
		# $precent = ($holder * 100) / $i;
		# $precent = sprintf "%.1f", $precent;
		# print OUT "$element\t$precent";
	
	# }
	# print OUT "\n";
	print "$x";



}
	close OUT;