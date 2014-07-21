open my $file, "<", "data/48.txt";
my $order = 0;
my $same_order = 0;
my $prev_count = -1;
while ( <$file> ) {
  chomp $_;
  my ( $count, $word ) = split /\t/, $_;
  if ( $count == $prev_count ) { 
    $same_order++;
  }
  else {
    print "$order $prev_count\n" if $order > 0;
    $order += $same_order + 1;
    $same_order = 0;
    $prev_count = $count;
  }
}
