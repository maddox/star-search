require 'rubygems'
require 'sinatra'
require 'server'

Sinatra::Application.set :run => false
# Sinatra::Application.set :environment => (ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development)
Sinatra::Application.set :root => File.dirname(__FILE__)

Sinatra::Application.set :raise_errors => true
use Rack::ShowExceptions

run Sinatra::Application
