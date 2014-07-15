use warnings;
use Data::Dumper qw( Dumper );
use List::Util qw( sum );

my %syzygy;
my $count = 0;
while ( <> ) {
  chomp $_;
  my ( $word, $next_word, $prob ) = split /\t/, $_;
  if ( length $word ) {
    $syzygy{$word} = {} unless exists $syzygy{$word};
    $syzygy{$word}->{$next_word} = $prob;
  }
}

foreach my $word ( keys %syzygy ) {
  my $total_prob = sum values %{ $syzygy{$word} };
  foreach my $next_word ( keys %{ $syzygy{$word} } ) {
    my $new_prob = $syzygy{$word}->{$next_word} / $total_prob;
    print "${word}\t${next_word}\t${new_prob}\n";
  }
}
