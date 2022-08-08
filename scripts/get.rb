ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
#require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'rubygems'
require 'json'

#require 'httparty'
#response = HTTParty.get 'www.baidu.com'
#puts response.body, response.code, response.headers
require 'httparty'
response = HTTParty.get 'www.baidu.com',  headers: {"User-Agent" => APPLICATION_NAME}
puts response.body, response.code, response.headers
