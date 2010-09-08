# Star Search!

Star Search allows you to scrape the stars from your Campfire room.

Star Search stores the stars in MongoDB and provides API end points to retrieve them.

## Requirements

* MongoDB
* MongoMapper
* Sinatra
* Mechanize

## How Do I Do It?

Download Star Search and edit config.yaml to enter the details of your Campfire room.

Star Search provides 2 simple rake tasks to get your stars.

	rake update # gets that last few stars, run this every so often to keep up to date
	rake backfill # this will get all of your stars at one time

## API

### Star Feed
	/stars.json => returns a feed of stars

#### Options
	page: page number (results are in increments of 30)		

#### Example
	domain.com/stars.json?page=2 => JSON
		
### Search
	/search.json => returns a feed of stars matching your query

#### Required
	q: query

#### Options
	page: page number (results are in increments of 30)		

#### Example
	domain.com/search.json?q=blue%20drink&page=2 => JSON

### By Author
	/author/:author.json => returns a feed of stars from inputted author

#### Options
	page: page number (results are in increments of 30)		

#### Example
	domain.com/authors/maddox.json?page=2 => JSON

		
		
## Resource

Heres the format of the JSON that is returned

	{
	  "stars": [
	    {
	      "author": "maddox",
	      "body": "guess how that would really go down. it wouldn't be pretty",
	      "id": "4c87354de0395a44d100000d",
	      "type": "text",
	      "email": "jon@mustacheinc.com",
	      "posted_at": "2010/09/07 22:05:00 +0000",
	      "starred_message_id": "255012243"
	    },
	    {
	      "author": "maddox",
	      "body": "then walks away",
	      "id": "4c87354de0395a44d100000c",
	      "type": "text",
	      "email": "jon@mustacheinc.com",
	      "posted_at": "2010/09/07 22:57:00 +0000",
	      "starred_message_id": "255012225"
	    },
	    {
	      "author": "maddox",
	      "body": "remember when she's with that mexican gang, trapped, and dances for them",
	      "id": "4c87354de0395a44d100000b",
	      "type": "text",
	      "email": "jon@mustacheinc.com",
	      "posted_at": "2010/09/07 22:55:00 +0000",
	      "starred_message_id": "255012221"
	    }...
	}
		
		
		
		
MMMMMMMMMMMMMMMMMMMMMMMMMMMDMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMOMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMM8$OMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMN8$ZNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMM8$7$ZMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMO$$Z$DMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMM8?~=~=+MM+MMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMM~+I$7Z=+OM+MMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMM~==$777O~=Z??MMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMM:=OO777ZI+O?==?MMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMM:~$D7777$O$O++NMM$=+7MZ?D8MMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMM,~MO7$O8OZ78=?$M=IMMMM~=?+MMMMMM87MMMMMMM
MMMMMMMMMMMMMMMMMMMO~=~~~~~~==$+7$=+MD+M:M~7MNMMMM=+?MMMMMMM
MDD88888O8OOOOOOOZZ$ZZ$$$$7Z====7Z+=:==+O~+$=888Z=+88D8O7MMM
MMM$7777777O~~~~~~~~=I7$7IIO:+?~~==7???+?$Z7??Z~++77IIOMMMMM
MMMMM7777O~==Z777O===Z:I$IZ~=??Z7+===~=====+?O~+7??INMMMMMMM
MMMMMMMO:~~Z7777$I==,?I7O+==?=~~~=~~~=7Z?+=7$+=7?IMMMMMMMMMM
MMMMMMO~~?$7777$O==7~~:~~+$??=+$==~=?O=7+?Z~=$:==MMMMMMMMMMM
MMMMM7~:DMMM$$Z8~+IIIOZ$??$=~~~?:7~?O:+~=$:==M~$MMMMMMMMMMMM
MMMM?~~+MMMMMMOZZIIII$$+?$~?Z+7=$:=Z,:I$$~?MN=?M:MMMMMMMMMMM
MMMM==~MMMMMMMMMN7?$7=I:O~?Z:~?=I,::7=:=MMMMMIIMMMMMMMMMMMMM
MMMN+++MMMMMMMMN8$$Z:7,7?:I.:,+::::,,:$$MMMMMMMMMMMMMMMMMMMM
MMMMI?+=?+:,,,,,,,I::$77:,,=~~,,,,,,,:~$MMMMMMMMMMMMMMMMMMMM
MMMMM8$$Z8MMMMMD::I=,,,=~~::,,,,,,,,,,:IZMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMM::I++II=~~::,,,,,,,,,,,::7$MMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMM$::7++===~::,::==:,,,,,,,,::$MMMMMMMMMMMMMMMMMM
MMMMMMMMMMM8::~I??++=~~,,+II77=~:,,,,,,,:IZMMMMMMMMMMMMMMMMM
MMDO$$$7?=:,DO77??++~:~II$ODDO$I?::,,,,,::$ZMMMMMMMMMMMMMMMM
MMMMD88NMMMMM777I+=~I77Z8MMMMMM8Z7I~:,,,,:=ZNMMMMMMMMMMMMMMM
MMMMMMMMMMMM$$7II77$ZDNMMMMMMMMMMM8Z7I,,,,:7ZMMMMMMMMMMMMMMM
MMMMMMMMMMMN$$7$$Z8DMMMMMMMMMMMMMMMMD8Z7~:::$OMMMMMMMMMMMMMM
MMMMMMMMMMM$ZZO8NMMMMMMMMMMMMMMMMMMMMMMN8Z7:=ZNMMMMMMMMMMMMM
MMMMMMMMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMDOZZMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
