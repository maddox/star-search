$LOAD_PATH.unshift 'lib'
require 'json'
require 'star_search'

get '/stars.json' do
  page = params[:page] || 0
  offset = page.to_i * 50
  
  stars = StarSearch::Star.all(:limit => 50, :offset => offset, :order => 'starred_message_id DESC')

  content_type 'application/json', :charset => 'utf-8'
  {:stars => stars}.to_json
end

get '/search.json' do
  page = params[:page] || 0
  offset = page.to_i * 50

  stars = StarSearch::Star.all({:body => Regexp.new(params[:q], :limit => 50, :offset => offset, :order => 'starred_message_id DESC')})

  content_type 'application/json', :charset => 'utf-8'
  {:stars => stars}.to_json
end
