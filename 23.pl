my $line = "";
my $text = "";
while ( $line = <STDIN> ) {
  $line =~ s/ /\n/g;
  $text = $text . $line . "\n";
}
print $text;
