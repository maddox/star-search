$LOAD_PATH.unshift 'lib'
require 'rubygems'
require 'mongo_mapper'
require 'mechanize'

require 'star_search/fetcher'
require 'star_search/star'


module StarSearch
  extend self
  
  def campfire_url
    config["campfire_url"]
  end
  
  def campfire_username
    config["campfire_username"]
  end
  
  def campfire_password
    config["campfire_password"]
  end
  
  def config
    @config ||= load_config
  end
  
  def load_config
    YAML::load(open(File.join(File.dirname(__FILE__), '..', 'config.yaml')))
  end
  
end 


