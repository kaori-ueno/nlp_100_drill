use Chunk;
use Morph;
use Storable qw( retrieve );

my @text = retrieve "data/53.dat";
foreach my $sentence ( @text ) {
  foreach my $chunk ( @{ $sentence } ) {
    if ( $chunk->has_noun ) {
      foreach my $src ( @{ $chunk->{srcs} } ) {
        next if $sentence->[$src]->has_noun;
        my $moto = $sentence->[$src]->to_text;
        my $saki = $chunk->to_text;
        print "$moto\t$saki\n";
      }
    }
  }
}
