use Getopt::Long;

my $opt_verb = 0;
my $opt_app  = 0;
my $opt_suru = 0;
my $opt_anob = 0;
my $opt_link = 0;
GetOptions(
  "verb" => \$opt_verb,
  "base" => \$opt_app,
  "suru" => \$opt_suru, 
  "anob" => \$opt_anob,
  "link" => \$opt_link,
);

# mecabの解析情報の取得
my @text = `mecab data/japanese.txt`;
my @text_morpheme;
foreach my $line ( @text ) {
  chomp $line;
  my @morpheme = split /\t|,/, $line;
  my $map = {
    surface => @morpheme[0],
    pos     => @morpheme[1],
    pos1    => @morpheme[2],
    app     => @morpheme[6],
    base    => @morpheme[7],
    line    => "$line\n",
  };
  push @text_morpheme, $map;
}

# 各オプションごとの処理
if ( $opt_verb ) {
  map { print $_->{line} }
    grep { $_->{pos} eq "動詞" } @text_morpheme;
}
elsif ( $opt_app ) {
  map { print $_->{line} }
    grep { ( $_->{pos} eq "動詞" ) && ( $_->{app} eq "基本形" ) }
    @text_morpheme; 
}
elsif ( $opt_suru ) {
  map { print $_->{line} }
    grep { $_->{pos1} eq "サ変接続" } @text_morpheme; 
}
elsif ( $opt_anob ) { 
  my $anob = 0;
  my @lines = [ "", "" ];
  foreach my $morp ( @text_morpheme ) {
    if ( ( $anob == 2 ) && ( $morp->{pos} eq "名詞" ) ) {
      print "$lines[0]$lines[1]$morp->{line}\n";
      $anob = 1;
    } 
    elsif ( $morp->{pos} eq "名詞" ) {
      $anob = 1;
    }
    elsif ( ( $anob == 1 ) && ( $morp->{surface} eq "の" ) ) {
      $anob = 2;
    }
    else {
      $anob = 0;
    }
    $lines[0] = $lines[1];
    $lines[1] = $morp->{line};
  }
}
elsif ( $opt_link ) {
  my $noun = 0;
  foreach my $morp ( @text_morpheme ) {
    if ( $morp->{pos} eq "名詞" ) {
      print "\n" unless $noun;
      print $morp->{line};
      $noun = 1;
    }
    else {
      $noun = 0;
    }
  }
}
