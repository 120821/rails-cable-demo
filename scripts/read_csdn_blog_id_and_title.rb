#ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'rubygems'
require 'json'
require 'httparty'


i = 1
loop do
  temp = HTTParty.get "https://blog.csdn.net/community/home-api/v1/get-business-list?page=#{i}&size=20&businessType=blog&orderby=&noMore=false&year=&month=&username=m0_67038390"
  #puts temp.body
  temp2 = JSON.parse(temp.body)
  puts temp2.inspect
  temp2['data']['list'].each do |csdn_blog|
  puts csdn_blog['articleId']
  puts csdn_blog['title']
  puts csdn_blog['url']
  puts csdn_blog['editUrl']
  blog = Blog.where('id = ?', csdn_blog['articleId']).first
    Rails.logger.info "-=============before save blog is #{blog.inspect}"
    if blog.blank?
     Blog.create id: csdn_blog['articleId'], title: csdn_blog['title']
    end
    Rails.logger.info "-=============after save blog is #{blog.inspect}"
  end

  if temp2['data']['list'].blank?
    break
  end
  i = i + 1

end




