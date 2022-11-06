#!/usr/bin/perl
#This script is used to compute the pairwise correlation based on ID50 values in two ways: serumwise, strainwise
use Data::Dumper qw(Dumper);
use Statistics::RankCorrelation;

open(IN,"20strains_30serum_data_14APr2020.in");
#open(IN,"30serum_20strains_data_14APr2020.in");
@a=<IN>;
close IN;

open(OUT,">pairwise_correlation_serumwise.txt");
#open(OUT,">pairwise_correlation_strainwise.txt");

for($i=1;$i<scalar(@a);$i++)
{
   chomp $a[$i];
   @t=();
   @t=split(/\t/,$a[$i]);
   $ser=splice @t,0,1;
   print OUT "$ser,";
   my $ref = \@t;
   for($j=1;$j<scalar(@a);$j++)
   {
        chomp $a[$j];
        @t1=();
        @t1=split(/\t/,$a[$j]);
        $ser1=splice @t1,0,1;
        my $ref1 = \@t1;
        $spe=0;
        $corr2=Statistics::RankCorrelation->new($ref,$ref1);
        $spe=$corr2->spearman;
        print OUT "$spe,";  

  }
  print OUT "\n";
}
close OUT;

