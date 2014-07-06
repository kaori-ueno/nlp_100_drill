use warnings;
use Data::Dumper qw( Dumper );

open( FP, 'data/inflection.table.txt');
my %dict;
while ( <FP> ) {
  my @word = split( /\|/, $_ );
  $dict{$word[0]} = [ $word[1], $word[3], $word[6] ];
}

print Dumper \%dict;
print "type a word: ";
my $word = <STDIN>;
print Dumper $dict{$word} if defined $dict{$word};
