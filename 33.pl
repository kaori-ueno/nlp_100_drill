use Data::Dumper qw( Dumper );
use Storable qw( retrieve );

my $line = "";
my %dict = retrieve "data/inflection.table.txt.dict";
while ( $line = <> ) {
  chomp $line;
  my ( $str, $_ ) = split( /\t/, $line );
  my $add_text = "\n";
  if ( ( not $str eq "" ) && defined $dict{$str} ) {
    $add_text = "\t" . Dumper( $dict{$str} );
  }
  print $line . $add_text;
}
