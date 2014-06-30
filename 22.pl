my $text = <STDIN>;
$text =~ s/\.\"? \"?([A-Z])/\.\n$1/g;
print $text;
