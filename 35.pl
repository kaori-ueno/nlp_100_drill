use Data::Dumper qw( Dumper );
use Storable qw( retrieve );

my $line = "";
my %dict = retrieve "data/inflection.table.txt.dict";
my %appear_dict;
while ( $line = <> ) {
  chomp $line;
  my ( $str, $_ ) = split( /\t/, $line );
  $appear_dict{$str}++ if $str ne "" && exists $dict{$str};
}

foreach my $str ( keys %appear_dict ) {
  print $str . "\n" if $appear_dict{$str} > 2;
}
