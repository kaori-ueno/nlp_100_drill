use Data::Dumper qw( Dumper );
use Storable qw( retrieve );

my $line = "";
my %dict = retrieve "data/inflection.table.txt.dict";
while ( $line = <> ) {
  chomp $line;
  my ( $str, $_ ) = split( /\t/, $line );
  if ( not $str eq "" ) {
    print $str . "\n" unless defined $dict{$str};
  }
}
