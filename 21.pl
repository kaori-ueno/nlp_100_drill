my $text = <STDIN>;
$text =~ s/\. /\.\n/g;
print $text;
