my @raw_text = `mecab data/japanese.txt`;

my @text;
my @sentence;
foreach my $line ( @raw_text ) {
  chomp $line;
  my @morpheme = split /\t|,/, $line;
  my $map = {
    surface => @morpheme[0],
    pos     => @morpheme[1],
    pos1    => @morpheme[2],
    base    => @morpheme[7],
  };
  push @sentence, $map;
  if ( $map->{surface} eq "。" ) {
    push @text, [ @sentence ];
    @sentence = ();
  }
}
