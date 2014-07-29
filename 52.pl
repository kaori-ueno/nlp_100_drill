#!/usr/bin/perl

open my $read, "<", "data/51.txt";
my @text;
my @sentence;
while ( <$read> ) {
  chomp $_;
  my ( $astarisk ) = split / /, $_;
  next if $astarisk eq "*";
  my @infos = split /\t|,/, $_;
  my $morph = Morph->new(
    surface => $infos[0],
    base    => $infos[7],
    pos     => $infos[1],
    pos1    => $infos[2],
  );
  push @sentence, $morph;
  if ( $morph->is_end_of_sentence ) {
    push @text, [ @sentence ];
    @sentence = ();
  }
}

package Morph;

sub new {
  my $class = shift;
  my %args = @_;
  return bless {
    surface => $args{surface},
    base    => $args{base},
    pos     => $args{pos},
    pos1    => $args{pos1},
  }, $class;
}

sub print {
  my $self = shift;
  my %args = @_;
  print "surface:$self->{surface}, base:$self->{base}, pos:$self->{pos}, pos1:$self->{pos1}\n";
}

sub is_end_of_sentence {
  my $self = shift;
  return ( $self->{surface} eq "EOS" );
}
