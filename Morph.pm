package Morph;

sub new {
  my $class = shift;
  my %args = @_;
  return bless {
    surface => $args{surface},
    base    => $args{base},
    pos     => $args{pos},
    pos1    => $args{pos1},
  }, "Morph";
}

sub surface { return shift->{surface}; }
sub base    { return shift->{base}; }
sub pos     { return shift->{pos}; }
sub pos1    { return shift->{pos1}; }

sub parse_morph {
  my $class = shift;
  my $line = shift;
  my @infos = split /\t|,/, $line;
  return $morph = $class->new(
    surface => $infos[0],
    base    => $infos[7],
    pos     => $infos[1],
    pos1    => $infos[2],
  );

}

sub to_text {
  my $self = shift;
  my %args = @_;
  return "surface:$self->{surface}, base:$self->{base}, pos:$self->{pos}, pos1:$self->{pos1}\n";
}

sub is_end_of_sentence {
  my $self = shift;
  return ( $self->{surface} eq "EOS" );
}

1;
