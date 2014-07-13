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

my @sentences = (
  "this paper is organized as follows",
  "is this paper organized as follows",
);

foreach my $sentence ( @sentences ) {
  my @words = split / /, $sentence;
  print "$sentence\n";
  my $prob = 1;
  foreach my $i ( 0 .. ( $#words - 1 ) ) {
    $prob = $prob * ( $syzygy{ $words[$i] }->{ $words[$i+1] } // 0 );
    print "$prob\n";
  }
}
