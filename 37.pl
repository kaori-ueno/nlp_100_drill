my %syzygy;
my $count = 0;
while ( <> ) {
  chomp $_;
  my ( $word, $next_word ) = split /\t/, $_;
  if ( length $word ) {
    $syzygy{$word} = {} unless exists $syzygy{$word};
    $syzygy{$word}->{$next_word}++;
    $count++;
  }
}

foreach my $word ( keys %syzygy ) {
  foreach my $next_word ( keys %{ $syzygy{$word} } ) {
    my $prob = $syzygy{$word}->{$next_word} / $count;
    print "${word}\t${next_word}\t${prob}\n";
  }
}

