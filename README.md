# Star Search!

## What is it?

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
		
		
		
		
		