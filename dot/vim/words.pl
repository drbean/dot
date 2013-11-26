#!/usr/bin/perl 

my @text = (

"Tokyo's Shinagawa train station is one of the most crowded places on earth. Close to a million commuters will transit here on an average day. ",

"Not your usual location for a clothing shop. But the proprietor is no       ordinary Japanese apparel maker. ",

"True to its name, Fast Retailing and its Uniqlo stores are on a             breathtaking dash to the top. With their conventional stores already saturating the country, the company is now chasing potential customers too busy to visit a regular shop, selling cheap undergarments to busy commuters, just like          newspapers and candy. ",

"Craft: Uniqlo is a retailing legend here in Japan, its no-nonsense, low-    cost socks and shirts a mainstay of Japanese closets. Now the company has vowed to make itself as much a household name overseas as it is here in Japan. ",

);

	my ( %words, %tokens, @lines );
	for my $line ( @text ) {
		chomp $line;
		my @words = map { lc } split / /, $line;
		for my $word ( @words ) {
			$word =~ s/\W$//;
			$words{$word}++;
		}
	}
	for my $word ( keys %words ) {
		my $letter = substr( $word, 0, 1 );
		my $Letter = uc $letter;
		my $tokens = $tokens{$Letter};
		push @{ $tokens{$Letter} }, $word;
	}
	my @tokens;
	# my @tokens = map { $_ . ( join( '', @{ $tokens{$_} } ) || 'None' ) } sort keys %tokens;
	for my $token ( sort keys %tokens ) {
		my $tokenarray = $tokens{$token};
		my $alphabeticgroup = "$token: " . join ' ', sort @$tokenarray;
		push @tokens, $alphabeticgroup;
	}

	print @tokens;
