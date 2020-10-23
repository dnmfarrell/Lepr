#!/usr/bin/perl
use strict;
use warnings;
use File::Find 'find';
use Test::More;

my $LEPR_PATH = 'lepr';
my $TEST_PATH = 't';

find({
  no_chdir => 1,
  wanted   => sub {
    return unless $File::Find::name =~ /\.lr$/;
    test_file($File::Find::name);
  }
}, $TEST_PATH);

done_testing;

sub test_file {
  my $filepath = shift;;
  open my $fh, '<', $filepath or die "Couldn't open $filepath $!";
  my $expected = '';
  my $test_content = '';
  while (my $line = <$fh>) {
    $test_content .= $line;
    $expected .= $1 if $line =~ qr{; expect (.+)$}s;
  }
  my $output = join '', `$^X -Ilib $LEPR_PATH $filepath`;
  is($output, $expected, "Got expected output for $filepath");
}
