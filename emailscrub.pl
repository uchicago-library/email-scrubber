#! /usr/bin/perl
@names = ("jmorrison", "bdylan", "dbowie", "kgordon", "kcobain", "jjoplin", "lreed", "rwaters"); 
@addresses = ("sunsetsound.com", "capitolstudios.org", "electricladystudios.net", "motownstudios.com");
@days = ("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"); 
$addr_len = scalar @addresses;
$name_len = scalar @names;
$days_str = join("|", @days);
# `@` before `uchicago` references
# global applies in-line
while(<>) {
	$_ =~ s/(.*@)(\S*)/${1} . $addresses[int(rand($addr_len))]/ge;
	$_ =~ s/(.*ESMPT id )([0-9]*)/${1}12345/gi;
	$_ =~ s/uchicago/musicmail/gi;
	$_ =~ s/($days_str).*?(:\d{2})+(\s\-\d{4})?/Wed, 18 May 2022/g;
	# IP addresses
	print;
}
