#! /usr/bin/perl
use warnings;
use strict;

my $x;
for($x = 0;$x < 10000;$x++){
	my $matrix_name = $ARGV[0];
	my $amount = $ARGV[1];

	my $myPval = `Rscript random_family.r $matrix_name $amount`;
	chomp $myPval;

	#$myPval = (split(/\s+/, $myPval))[1];
	#print "$myPval";

	open TOY, "result.txt" or die $!;

	my ($line,$i,$k,$j,$element,$l,$C2H2,$C2H2_or_HD,$HD,$NHR,$other,$C2H2_count,$C2H2_or_HD_count,$HD_count,$NHR_count,$other_count,$C2H2_p,$C2H2_or_HD_p,$HD_p,$NHR_p,$other_p);
	my (@main_2D_array,@row_array);
	$line=$i=$k=$j=$element=$l=$C2H2_count=$C2H2_or_HD_count=$HD_count=$NHR_count=$other_count=$C2H2_p=$C2H2_or_HD_p=$HD_p=$NHR_p=$other_p= 0;
	$C2H2 = 1;
	$C2H2_or_HD = 2;
	$HD = 3;
	$NHR = 4;
	$other = 5;

	while($line = <TOY>){ 
		# Chop off new line character, skip the comments and empty lines.                 
		chomp($line); 
		@row_array = split(/\t/, $line);
	   $j=0;
		foreach $element (@row_array){
			$main_2D_array[$i] =$element;
			
			if(($main_2D_array[$i] == $C2H2) or ($main_2D_array[$i] == $C2H2_or_HD)){
				$C2H2_count++;
			}
			elsif(($main_2D_array[$i] == $HD) or ($main_2D_array[$i] == $C2H2_or_HD)){
				$HD_count++;
			}
			elsif($main_2D_array[$i] == $NHR){
				$NHR_count++;
			}
			else{
				$other_count++;
			}
		}
		$i++;
	}


	$C2H2_p=($C2H2_count *100) / $i;
	$HD_p= ($HD_count *100) / $i;
	$NHR_p= ($NHR_count *100) / $i;
	$other_p= ($other_count *100) / $i;
	open(OUT,">>"."results_random_family.txt");
	print "$x";
	print OUT "$C2H2_p\t$HD_p\t$NHR_p\t$other_p\n";
	close OUT;

}
