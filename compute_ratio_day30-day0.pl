#!/usr/bin/perl

open(IN,"30serum_20strains_data_14APr2020_forscatterplot.in");@a=<IN>;close IN;
open(OUT,">ratio_day30-day0_heatmap.txt");
for($i=1;$i<scalar(@a);$i++)
{
   @t=();@t=split(/\t/,$a[$i]);
   print OUT "$t[0]\t$t[1]\t";
   for($j=12;$j<22;$j++)
   {
     $ratio=0;$ratio=$t[$j+10]/$t[$j]; 
     print OUT "\t$ratio";
   }
   print OUT "\n";
}
close OUT;


