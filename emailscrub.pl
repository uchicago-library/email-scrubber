#! /usr/bin/perl
@names = ("Jim Morrison", "Bob Dylan", "David Bowie", "Janis Joplin", 
	"Lou Reed", "Roger Waters");

@users = ("jmorrison", "bdylan", "dbowie", "jjoplin", "lreed", "rwaters");
@handles = ("sunsetstudios.com", "thevillagestudios.org", 
	"paramountstudios.net", "capitalstudios.org", "goldstarstudios.net", 
	"hensonstudios.com");
@subjects = ("Album Collab", "Tour Dates", "Demo Tape");

@email_names = ();
@days = ("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"); 
@dates = ("Thu, 18 May 1967", "Mon, 10 Jul 1967", "Sat, 28 Aug 1966");
$name_len = scalar @names;
$date_len = scalar @dates;
$sub_len = scalar @subjects;
$days_str = join("|", @days);
# `@` before `uchicago` references
# global applies in-line
$rand_index = rand(int($sub_len));
sub find_name {
	$name = pop(@_);
	my($index) = 0;
	for(@email_names) {
		return ($index % $name_len) if ($_ eq $name);
		$index++;
	}
	push(@email_names, $name);
	return ($index % $name_len);
}
while(<>) {
	$_ =~ s/[\w_\-.]+.(edu|org|com|net|gov)/fakemusicmail.org/g;
	$_ =~ s/(To:\s|From:\s|CC:\s|Reply-To:\s)?(.*?)(\s<?)([\w_\-.:]+)@([\w_\-.]+)/
	   $index = find_name($4);
	   if ($1 ne '') {
	   	${1} . $names[$index] . ${3} . 
		$users[$index] . "@" . $handles[$index];
	   }
	   else {
	   	${2} . ${3} . 
		$users[$index] . "@" . $handles[$index];
	   }
	   /ge;
	$_ =~ s/(Subject:\s).*/${1} . $subjects[$rand_index]/ge;
	$_ =~ s/(Thread-Topic:\s).*/${1}Production Work/gi;
	$_ =~ s/(Thread-Index:\s).*/${1}Gd7542shb490PLfgRapL23FrtQwPl30hgFdX/g;
	$_ =~ s/(Message-ID:\s).*/${1}<ABCD1234%fakemusicmail.org>/g;
	$_ =~ s/(iamunique-)\d+/${1}516290765/g;
	$_ =~ s/(\sid\s)[\w\.]*/${1}ABC123/gi;
	$_ =~ s/($days_str).*?(\s\d{2}:\d{2}:\d{2})(\s(?:\-|\+)\d{4})?(\s\([A-Z]+\))?/
		$dates[$rand_index] . ${2} . " -0800 (PST)"/ge;
	$_ =~ s/(\d{1,3}\.\d{1,3})/int(rand(13)) . "." . int(rand(13))/ge;
	$_ =~ s/(X-Spam-Score:\s).*/${1}undef - relay 8.24.129.13 marked with skip_spam_scan/g;
	$_ =~ s/(X-CanIt-Geo:\s).*/${1}No geolocation information available for 8.24.129.13/g;
	$_ =~ s/(SYMANTEC;)\d+/${1}716342980/g;
	if ((scalar @email_names) > 0) {
		$email_names_str = join("|", @email_names);
		$_ =~ s/($email_names_str)/
			$index = find_name($1);
	   		$users[$index];
	   	       /ge;

	}
	print;
}
