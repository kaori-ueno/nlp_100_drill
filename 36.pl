my $prev_word = "";
while ( <> ) {
  chomp $_;
  my ( $word_in_sentence, $word ) = split /\t/, $_;
  if ( length $word ) {
    print "$prev_word\t$word\n" if length $prev_word;
    $prev_word = $word;
  }
}
