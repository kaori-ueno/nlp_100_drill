my $line = "";
my $text = "";
while ( $line = <STDIN> ) {
  $line =~ s/ /\n/g;
  $line =~ s/([^A-Za-z0-9])/\n$1/g;
  $text = $text . $line . "\n";
}
print $text;
