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
	my @next_round = glob "$directory/*";
	s/^$directory\/(.*)$/$1/ for @next_round;
	$"="\n"; $unseen->print("@next_round");
	$directory = "/usr/share/backgrounds/f24/default";
	$pic = "f24.xml";
}

warn "pic: $pic\t";
my $uid = qx'id -u';
my @desktops = ( qw/gnome mate/ );
my ( %schema, %key, %value );
@schema{@desktops} = qw/org.gnome.desktop.background org.mate.background/; 
@key{@desktops} = qw/picture-uri picture-filename/;
@value{@desktops} = ( "file://$directory/$pic", "$directory/$pic");
for my $desktop ( qw/gnome mate/ ) {
	my $pid_list = qx/pgrep -u $ENV{USER} $desktop-session/;
	my @pids = split "\n", $pid_list;
	for my $pid (@pids) {
		warn "desktop: $desktop, pid: $pid, ";
		my $dbus_session_bus_address = qx(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$pid/environ | cut -d= -f2-);
		warn "dbus_session_bus_address: $dbus_session_bus_address\n";
		system("DBUS_SESSION_BUS_ADDRESS=$dbus_session_bus_address gsettings set $schema{$desktop} $key{$desktop} $value{$desktop}");
	}
}
