my $line = "";
while ( $line = <STDIN> ) {
  chomp $line;
  my ( $_, $str ) = split( /\t/, $line );
  print $str . "\n" if $str =~/ness|ly/;
}
