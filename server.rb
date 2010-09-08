$LOAD_PATH.unshift 'lib'
require 'json'
require 'star_search'


get '/stars.json' do
  @stars = StarSearch::Star.all(:limit => 30, :offset => offset).paginated(page)
  publish_stars
end

get '/search.json' do
  @stars = StarSearch::Star.search(params[:q]).paginated(page)
  publish_stars
end

get '/authors/:author.json' do
  @stars = StarSearch::Star.by_author(params[:author]).paginated(page)
  publish_stars
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