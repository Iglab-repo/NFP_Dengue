#The idea is to generate random fingerprints with less than 0.2 correlation against any known/given antibody fingerprints of a viral panel
#!/usr/bin/perl
use Statistics::RankCorrelation;
use POSIX;
#Basic cut-off values
$numsera=10000;$highcorr_cutoff=0.2;$min_breadth=0.3;$max_breadth=0.98;
$min=0.00001;$max=99.9;
open(IN,"mab_neut_data_dengue_17absVs20strains_27Jul2020.in");
@a=<IN>;
close IN;
#Dimensions of input_file
$num_abs=scalar(@a)-1;
@t=split(/\t/,$a[0]);
$num_strains=scalar(@t)-1;
splice(@a,0,1);
@strain_index=1..20;
#Creating output files with/without transposing values
#open(OUT,">match_unknown_spec_sim_sera-perl.in");
open(OUT1,">match_unknown_spec_sim_sera_notranspose-perl_27Jul2020.in");
for($i=0;$i<10000;)
{
  #print "$i**";
  $spe1=0;
  @nfp=();

#Random number gneration based on number of viral strains
  for($j=0;$j<$num_strains;$j++)
  {
     push(@nfp,sprintf("%.2f",$min+rand($max-$min)));
  }

#Random integer between 1 and the number of viral strains
  $sub=floor((1-($min_breadth+rand($max_breadth-$min_breadth)))*$num_strains);
#Substituting the value 50 using random indexes
  for($k=0;$k<$sub;$k++)
  {
     $nfp[1+int(rand($num_strains))]=100; 
  }
#Correlation between the given antibody fingerprints and generated fingerprints to find the maximum correlation
  for($k=0;$k<scalar(@a);$k++)
  {
    @t=();
    @t=split(/\t/,$a[$k]);
    splice(@t,0,1);
    my $ref = \@t;
    my $ref1= \@nfp;
    $corr2=Statistics::RankCorrelation->new($ref,$ref1);
    $spe=$corr2->spearman;
    if($spe>$spe1) {$spe1=$spe;} 
  }

#Selection of random fingerprints based on max lower correlations
  if($spe1<$highcorr_cutoff)
  {
    $i++;
    #print "$spe1***@nfp\n";
    $,="\t";
    print OUT1 @nfp,"\n";
  } 
}

#close OUT;
close OUT1;
#transposing the generated file and changing the sign of the values to convert it from antibody to serum data. This file is the serum input for generating residual scores for unknow sera.

open(IN,"match_unknown_spec_sim_sera_notranspose-perl_27Jul2020.in");
@tran=<IN>;close IN;
open(OUTM1,">match_unknown_spec_sim_sera_transpose-perl_27Jul2020.in");
for($i=0;$i<$num_strains;$i++)
{
   for($j=0;$j<10000;$j++)
   {
     @t=();@t=split(/\t/,$tran[$j]);
     push(@tran1,"-$t[$i]");
   }
   $,="\t";
   print OUTM1 "@tran1\n";
   @tran1=();
}
close OUTM1;
