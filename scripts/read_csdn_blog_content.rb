ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rubygems'
require 'json'
require 'rails'

require 'httparty'

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
Blog.all.each do |blog|
  doc = Nokogiri::HTML(URI.open("https://blog.csdn.net/m0_67038390/article/details/#{blog.id}?spm=1001.2014.3001.5502"))
  puts doc.inspect

  # Search for nodes by css
  doc.css('#content_views').each do |content|
    puts "================="
    #puts content.content
    puts content.children
    blog.content = content.children
    blog.save!
    puts "================="
  end
end
