#!/usr/bin/perl 

use strict;
use warnings;

use IO::All;
use List::Util "shuffle";

my $unseen = io('/home/mai/unseen_pics.txt');
my $seen = io('/home/mai/seen_pics.txt');

my @raw_unseen = $unseen->slurp;
my @seen = $seen->slurp;

my @unseen = shuffle @raw_unseen;
my $pic = $unseen[0];

$unseen->print(@unseen[1..$#unseen]); 
$seen->print(@seen, $pic);

chomp $pic;

system("dbus-launch gsettings set org.gnome.desktop.background picture-uri file:///home/mai/Pictures/$pic");
