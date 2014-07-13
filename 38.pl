use warnings;
use Data::Dumper qw( Dumper );
use List::Util qw( sum );

my $prev_word = "";
my %syzygy;
while ( <> ) {
  chomp $_;
  my ( $word_in_sentence, $word ) = split /\t/, $_;
  if ( length $word ) {
    $syzygy{$prev_word} = {} unless exists $syzygy{$prev_word}; 
    $syzygy{$prev_word}->{$word}++;
    $prev_word = $word;
  }
}

foreach my $prev_word ( keys %syzygy ) {
  my $count = sum values $syzygy{$prev_word};
  foreach my $word ( keys %{ $syzygy{$prev_word} } ) {
    $syzygy{$prev_word}->{$word} = $syzygy{$prev_word}->{$word} / $count;
  }
}

print Dumper \%syzygy;
