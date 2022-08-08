ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
#require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'rubygems'
require 'json'

require 'httparty'


temp = HTTParty.get "https://ethgasstation.info/api/ethgasAPI.json"

puts temp.body

temp2 = JSON.parse(temp.body)

puts temp2["fastest"]
puts temp2["safeLow"]




