my $line = "";
my %dict;
while ( $line = <STDIN> ) {
  chomp $line;
  my ( $_, $str ) = split( /\t/, $line );
  next if length($str) < 2;
  foreach my $i ( 0 .. (length($str)-2) ) {
    my $subst = substr( $str, $i, 2 );
    if ( defined $dict{$subst} ) {
      $dict{$subst}++;
    }
  }
}

my @keys = sort { $dict{$b} <=> $dict{$a} } keys %dict;
foreach my $i ( 0 .. 99 ) {
  my $key = $keys[$i];
  print ( ($i+1) . "\t" . $key . "\t" . $dict{$key} . "\n" );
}
