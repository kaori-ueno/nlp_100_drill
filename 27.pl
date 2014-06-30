my $line = "";
my %dict;
while ( $line = <STDIN> ) {
  chomp $line;
  my ( $_, $str ) = split( /\t/, $line );
  next if $str eq "";
  if ( defined $dict{$str} ) {
    $dict{$str}++;
  }
  else {
    $dict{$str} = 1;
  }
}

my @keys = sort { $dict{$b} <=> $dict{$a} } keys %dict;
foreach my $i ( 0 .. 99 ) {
  my $key = $keys[$i];
  print ( ($i+1) . "\t" . $key . "\t" . $dict{$key} . "\n" );
}
