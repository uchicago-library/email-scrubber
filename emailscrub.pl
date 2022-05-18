#! /usr/bin/perl
@names = ("jmorrison", "bdylan", "dbowie", "jjoplin", "lreed", "rwaters"); 
@addresses = ("sunsetsound.com", "capitolstudios.org", "electricladystudios.net", "motownstudios.com");
@days = ("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"); 
@dates = ("Thu, 18 May 1967", "Mon, 10 Jul 1967", "Sat, 28 Aug 1966");
$addr_len = scalar @addresses;
$date_len = scalar @dates;
$name_len = scalar @names;
$days_str = join("|", @days);
# `@` before `uchicago` references
# global applies in-line
while(<>) {
	$_ =~ s/(.*@)(\S*)/${1} . $addresses[int(rand($addr_len))]/ge;
	$_ =~ s/(.*ESMPT id )([0-9]*)/${1}ABC123456/gi;
	$_ =~ s/uchicago/musicmail/gi;
	$_ =~ s/($days_str).*?(:\d{2})+(\s\-\d{4})?(\s\([A-Z]+\))?/
		$dates[int(rand($date_len))] . " -0800 (PST)"/ge;
	$_ =~ s/(\d{1,3}\.)+\d{1,3}/12.34.567.8/g;
	print;
}
