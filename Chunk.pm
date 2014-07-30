use warnings;
use strict;
package Chunk;

use Morph;

sub new {
  my $class = shift;
  my %args = @_;
  return bless {
    morphs => $args{morphs} // [],
    dst    => $args{dst},
    srcs   => $args{srcs},
  }, $class;
}

sub make_chunk {
  my $class = shift;
  my %args = @_;

  my @morphs;
  foreach my $line ( @{ $args{morphs} } ) {
    push @morphs, Morph->parse_morph( $line );
  }

  return $class->new(
    morphs => @morphs,
    dst    => $args{dst},
    srcs   => $args{scrs},
  );
}

sub is_end_of_sentence {
  my $self = shift;

  foreach my $morph ( @{ $self->{morphs} } ) {
    return 1 if $morph->is_end_of_sentence;
  }
  return 0;
}

sub to_text {
  my $self = shift;
  my $text = "";
  foreach my $morph ( @{ $self->{morphs} } ) {
    if ( ( defined $morph->base ) && ( $morph->pos ne "記号" ) ) {
      $text = $text . $morph->surface;
    }
  }
  return $text;
}

sub has_noun {
  my $self = shift;
  foreach my $morph ( @{ $self->{morphs} } ) {
    return 1 if ( defined $morph->pos ) && ( $morph->pos eq "名詞" );
  }
  return 0;
}

sub has_verb {
  my $self = shift;
  foreach my $morph ( @{ $self->{morphs} } ) {
    return 1 if ( defined $morph->pos ) && ( $morph->pos eq "動詞" );
  }
  return 0;
}

sub has_independent_verb {
  my $self = shift;
  foreach my $morph ( @{ $self->{morphs} } ) {
    return 1 if ( $morph->pos eq "動詞" ) && ( $morph->pos1 eq "自立" );
  }
  return 0;
}

1;
