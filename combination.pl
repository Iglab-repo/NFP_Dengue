#!/usr/bin/perl

use strict; use warnings;
use Algorithm::Combinatorics qw(combinations);
open(OUT,">combinations_panel18.txt");
my $strings = [qw(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25)];

my $iter = combinations($strings, 18);
$,="\t";
while (my $c = $iter->next) {
    print OUT "@$c\n";
}

close OUT;

