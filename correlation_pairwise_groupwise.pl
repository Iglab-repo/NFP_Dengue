#!/usr/bin/perl
#This script is used to compute the pairwise correlation based on ID50 values for each group seperately: Group 1 (S1 to S10), Group 2 (S11 to S20) and Group 3 (S21 to S30)
#Using these data, figures were generated in the excel files
use Data::Dumper qw(Dumper);
use Statistics::RankCorrelation;

open(IN,"30serum_20strains_data_14APr2020.in");
@a=<IN>;
close IN;

open(OUT,">pairwise_correlation_strainwise_group1.txt");
open(OUT1,">pairwise_correlation_strainwise_group2.txt");
open(OUT2,">pairwise_correlation_strainwise_group3.txt");

for($i=1;$i<scalar(@a);$i++)
{
   chomp $a[$i];
   @t=();
   @t=split(/\t/,$a[$i]);
   print "@t\n";
   $ser=splice @t,0,1;
   @g1=@g2=@g3=();
   @g1=splice(@t,0,10);
   @g2=splice(@t,0,10);
   @g3=splice(@t,0,10); 
   print OUT "$ser,";print OUT1 "$ser,";print OUT2 "$ser,";
   my $ref_g1 = \@g1;my $ref_g2 = \@g2;my $ref_g3 = \@g3;
   for($j=1;$j<scalar(@a);$j++)
   {
        chomp $a[$j];
        @t1=();
        @t1=split(/\t/,$a[$j]);
        $ser1=splice @t1,0,1;
        @g1_c=@g2_c=@g3_c=();
        @g1_c=splice(@t1,0,10);
        @g2_c=splice(@t1,0,10);
        @g3_c=splice(@t1,0,10); 
        my $ref_g1_c = \@g1_c;my $ref_g2_c = \@g2_c;my $ref_g3_c = \@g3_c;
        $spe_g1=$spe_g2=$spe_g3=0;
#For group1
        $corr2_g1=Statistics::RankCorrelation->new($ref_g1,$ref_g1_c);
        $spe_g1=$corr2_g1->spearman;
        print OUT "$spe_g1,";  
#for group2
        $corr2_g2=Statistics::RankCorrelation->new($ref_g2,$ref_g2_c);
        $spe_g2=$corr2_g2->spearman;
        print OUT1 "$spe_g2,";
#for group3
        $corr2_g3=Statistics::RankCorrelation->new($ref_g3,$ref_g3_c);
        $spe_g3=$corr2_g3->spearman;
        print OUT2 "$spe_g3,";
  }
  print OUT "\n";print OUT1 "\n";print OUT2 "\n";
}
close OUT;close OUT1;close OUT2;

