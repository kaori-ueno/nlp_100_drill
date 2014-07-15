use warnings;
use Data::Dumper qw( Dumper );
use Storable qw( nstore );

open( FP, '../data/inflection.table.txt' );
my %dict;
while ( <FP> ) {
  my @word = split( /\|/, $_ );
  $dict{$word[0]} = [ $word[1], $word[3], $word[6] ];
}

nstore \%dict, "data/inflection.table.txt.dict";
