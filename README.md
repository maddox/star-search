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

		
		
		
		
		
		
		