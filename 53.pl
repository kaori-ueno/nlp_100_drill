#!/usr/bin/perl
use Data::Dumper qw( Dumper );
use Storable qw( nstore );
use Chunk;
use Morph;

open my $read, "<", "data/51.txt";
my @text;
my @sentence;
my @lines;
my %scrs;
while ( <$read> ) {
  chomp $_;
  my ( $astarisk ) = split / /, $_;
  if ( $astarisk eq "*" ) {
    if ( @lines ) {
      my $chunk = make_chunk( @lines );
      @lines = ();
      set_chunk( $chunk );
    }
  }
  push @lines, $_;
}
if ( @lines ) {
  my $chunk = make_chunk( @lines );
  @lines = ();
  set_chunk( $chunk );
}

nstore \@text, "data/53.dat";

sub make_chunk {
  # 係り受けの解析
  my @info = split / /, shift @lines;
  my $self = $info[1];
  my $dst = $info[2];
  $dst =~ s/D//g;
  $scrs{$dst} = [] unless exists $scrs{$dst};
  push @{ $scrs{$dst} }, $self;

  my @morphs;
  foreach my $line ( @lines ) {
    push @morphs, Morph->parse_morph( $line );
  }
  return Chunk->new(
    morphs => \@morphs,
    dst    => $dst,
    srcs   => $scrs{$self} // [],
  );
}

sub set_chunk {
  my $chunk = shift;
  push @sentence, $chunk;
  if ( $chunk->is_end_of_sentence ) {
    push @text, @sentence;
    @sentence = ();
    %scrs = ();
  }
}
