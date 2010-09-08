$LOAD_PATH.unshift 'lib'
require 'star_search'

desc "Update stars"
task :update do
  StarSearch::Fetcher.get_page((0..0))
end

desc "Backfill all the stars"
task :backfill do
  StarSearch::Star.destroy_all
  StarSearch::Fetcher.get_page((0..100))
end
