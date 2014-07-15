use TokyoCabinet;
use strict;
use warnings;

my $hdb = TokyoCabinet::HDB->new();

# open the database
if(!$hdb->open("data/hash.tch", $hdb->OWRITER | $hdb->OCREAT)){
    my $ecode = $hdb->ecode();
    printf STDERR ("open error: %s\n", $hdb->errmsg($ecode));
}

# close the database
if(!$hdb->close()){
    my $ecode = $hdb->ecode();
    printf STDERR ("close error: %s\n", $hdb->errmsg($ecode));
}

