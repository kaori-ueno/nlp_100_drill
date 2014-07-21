# perl 47.pl --verb | perl 48.pl

my %dict;
while ( <> ) {
  my @morp = split /\t|,/, $_;
  my $base = $morp[7]; 
  $dict{$base}++;
}

map { print "$dict{$_}\t$_\n" } sort { $dict{$b} <=> $dict{$a} } keys %dict;
