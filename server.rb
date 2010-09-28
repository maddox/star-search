$LOAD_PATH.unshift 'lib'
require 'json'
require 'star_search'
require 'rubyrss'


get '/stars.json' do
  @stars = StarSearch::Star.paginated(page).all
  publish_stars
end

get '/search.json' do
  @stars = StarSearch::Star.search(params[:q]).paginated(page).default_order
  publish_stars
end

get '/authors/:author.json' do
  @stars = StarSearch::Star.by_author(params[:author]).paginated(page)
  publish_stars
end

get '/stars.xml' do
  @stars = StarSearch::Star.paginated(page).all
  
  version = "2.0"
  
  feed = RubyRSS.new
  feed.title = "The Danger Room"
  feed.link = "http://stars.newzcache.com/stars.xml"
  feed.desc = "Stars for The Danger Room"
  
  @stars.each do |star|
    next if star.body =~ /github\.campfirenow\.com/
    
    i = RubyRSS::Item.new
    i.title = "A Star"
    i.author = star.author
    i.link = "http://stars.newzcache.com/stars/#{star.starred_message_id}"
    i.date = star.posted_at

    case star.type
    when /image/
      i.desc = %{<img src="#{star.body}" />}
    when /link/
      i.desc = %{<a href="#{star.body}" />#{star.body}</a>}
    else
      i.desc = star.body
    end

    feed.items << i
  end
  
  content_type 'application/rss+xml', :charset => 'utf-8'
  feed.generate
end



def page
  the_page = 0
  the_page = params[:page].to_i - 1 if params[:page].to_i > 0
  the_page
end

def publish_stars
  content_type 'application/json', :charset => 'utf-8'
  {:stars => @stars}.to_json
end