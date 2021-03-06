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

warn "next pic: $pic";
my $uid = qx'id -u';
my @desktops = ( qw/gnome mate/ );
my ( %schema, %key, %value );
@schema{@desktops} = qw/org.gnome.desktop.background org.mate.background/; 
@key{@desktops} = qw/picture-uri picture-filename/;
my $warn;
my $machineid = io("/var/lib/dbus/machine-id")->slurp;
chomp $machineid;
my $display = substr $ENV{DISPLAY}, -1;
my $dbusfile = "/home/$ENV{USER}/.dbus/session-bus/$machineid-$display";
@value{@desktops} = ( "file://$directory/$pic", "$directory/$pic");
my $id = qx/id --user $ENV{USER}/;
chomp $id;
my $dbus_session_bus_address = "unix:path=/run/$id/bus";
my $dbusinfo = "# by picture_uri.pl for gsettings\nDBUS_SESSION_BUS_ADDRESS=$dbus_session_bus_address\n";
for my $desktop ( @desktops ) {
	my %gsettings;
	$gsettings{before} = qx/gsettings get $schema{$desktop} $key{$desktop}/;
	chomp $gsettings{before};
	my $pid_list = qx/pgrep -u $ENV{USER} $desktop-session/;
	my @pids = split "\n", $pid_list;
	for my $pid (@pids) {
		$dbusinfo .= "DBUS_SESSION_BUS_PID=$pid\n";
		io($dbusfile)->perms('666')->print($dbusinfo);
	}
	system("dbus-launch", "gsettings", "set", "$schema{$desktop}", "$key{$desktop}", "'$value{$desktop}'");
	$gsettings{after} = qx/dbus-launch gsettings get $schema{$desktop} $key{$desktop}/;
	my $warning = "gsettings: $gsettings{before} -> $gsettings{after}\n";
	$warning .= "desktop: $desktop,\tdbus_session_bus_address: '$dbus_session_bus_address'\n";
	$warn->{$desktop} = $warning;
}
for my $desktop ( keys %$warn ) {
	io('=')->print( "desktop: $desktop:\n" );
	io("=")->print( "\t\t$warn->{$desktop}" );
}
