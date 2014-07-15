use Lingua::Stem qw(stem);

my $line = "";
my %dict;
print "before while";
while ( $line = <STDIN> ) {
  print "in while";
  chomp $line;
  my ( $str, $_ ) = split( /\t/, $line );
  my ( $stemmed_str ) = @{ stem( $str ) } if defined $str;
  print <STDOUT>, $line . "\t" . $stemmed_str . "\n";
}
