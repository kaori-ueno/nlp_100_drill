my $line = "";
my $text = "";
while ( $line = <STDIN> ) {
  chomp $line;
  $text = $text . $line . "\t" . ( lc $line ) . "\n";
}
print $text;
