#!/usr/bin/perl

use strict;

my @mailboxes = glob("Mail/*");

foreach my $mailbox ( 
			# '/var/spool/mail/$HOME', 
			@mailboxes )
{
	$mailbox =~ s/^ Mail\/ (.*)$/=$1/x;
	print qq{folder-hook $mailbox 'macro index h <change-folder>?<tab><search>$mailbox<enter>'\n};
}
