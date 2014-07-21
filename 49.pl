open my $file, "<", "data/48.txt";
my %dict;
while ( <$file> ) {
  chomp $_;
  my ( $count, $word ) = split /\t/, $_;
  $dict{$count}++;
}

map { print "$_ $dict{$_}\n" } sort { $a <=> $b } keys %dict;
