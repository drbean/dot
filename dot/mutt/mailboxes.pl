#!/usr/bin/perl 

use strict;
use warnings;

my @topMailboxes = @ARGV;
my %topMailboxes;
@topMailboxes{@topMailboxes} = @topMailboxes;

my @allMailboxes = glob("Mail/*");

foreach my $mailbox ( 
			'/var/spool/mail/$HOME', 
			@topMailboxes )
{
	print "$mailbox ";
}

for my $mailbox ( @allMailboxes )
{
	$mailbox =~ s/^ Mail\/ (.*)$/=$1/x;
	print "$mailbox " unless $topMailboxes{$mailbox};
}
