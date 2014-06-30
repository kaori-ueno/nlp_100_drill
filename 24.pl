my $line = "";
my $text = "";
while ( $line = <STDIN> ) {
  $line =~ s/ /\n/g;
  $line =~ s/([\.\,])/\n$1/g;
  $text = $text . $line . "\n";
}
print $text;
