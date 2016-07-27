#!/usr/bin/perl 

use strict;
use warnings;

use IO::All;
use List::Util "shuffle";

my $unseen = io("/home/$ENV{USER}/unseen_pics.txt");
my $seen = io("/home/$ENV{USER}/seen_pics.txt");

my @raw_unseen = $unseen->slurp;
my @seen = $seen->slurp;

my @unseen = shuffle @raw_unseen;
my $pic = $unseen[0];

$unseen->print(@unseen[1..$#unseen]); 
$seen->print(@seen, $pic);

chomp $pic;
$pic =~ s/ /\\ /g;

my $directory = "/home/$ENV{USER}/画像";

# my $PID=system("pgrep -u $ENV{USER} gnome-session");
# my $BUS_ADDRESS=system("/usr/bin/grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-");

unless ( $pic ) {
	$directory = "/usr/share/backgrounds/f24/default";
	$pic = "f24.xml";
}

my $uid = qx'id -u';
if ( $ENV{USER} eq 'mai' ) {
	system("DBUS_SESSION_BUS_ADDRESS=\"unix:path=/run/user/1001/bus\" gsettings set org.gnome.desktop.background picture-uri file://$directory/$pic");
}
elsif ( $ENV{USER} eq 'drbean' ) {
	system("DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/1000/bus' gsettings set org.mate.background picture-filename $directory/$pic");
}
else {
	warn "$uid: ??";
}
