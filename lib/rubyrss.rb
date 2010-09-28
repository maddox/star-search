#
# RubyRSS
# Copyright (c) 2006 Sergey Tikhonov <st@dairon.net>
# Distributed under MIT License
#

require "open-uri"
load "templates.rb"

class RubyRSS
  attr_accessor :title, :link, :desc, :date, :items
  attr_reader :filename
 
  class Item < self
    attr_accessor :title, :link, :desc, :date, :author
  end

  def initialize
    @title = ""
    @link = ""
    @date = Time.new
    @items = []
  end

  def generate( template_name = "rss2.0" )
    rss = $rss_templates[ template_name ].strip
    item_rss = ($1).strip if rss =~ /#items-start(.+)#items-end/m
    
    rss.gsub!( /#title/, title )
    rss.gsub!( /#link/, link )
    rss.gsub!( /#desc/, desc )
    rss.gsub!( /#date/, date.to_s )
    items_rss = ""
    items.each { |item|
      temp_rss = item_rss.dup
      temp_rss.gsub!( /#item-title/, item.title )
      temp_rss.gsub!( /#item-link/, item.link )
      temp_rss.gsub!( /#item-author/, item.author )
      temp_rss.gsub!( /#item-desc/, CGI.escapeHTML(item.desc) )
      temp_rss.gsub!( /#item-date/, item.date.to_s )
      items_rss << temp_rss + "\n"
    }
    rss.gsub!( /#items-start\n(.*)#items-end\n/m, items_rss )
    rss
  end
end
