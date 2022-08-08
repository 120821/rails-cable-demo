ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'production'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rails'
require 'rubygems'
require 'json'
file = File.read 'all-traits.json'
#puts "file is #{file.inspect}"
json = JSON.parse file
json.each do |key, value|
  tempHash = {
    "description" => "Congratulations to get the Parachain NFT!",
    "external_link" => "https://www.parachain.io/",
    "external_url" => "https://www.parachain.io/",
    "animation_url" => "ipfs://QmRuTwaZdZ65aEAz5NPwz8N6QskQsTQwkX4X98ior9GaNN",
    "image" => "ipfs://QmQMJX4azuY2yREjprkwEUvX9caSAbPHE8MnwzpzLJungk",
    "name" => "Parastate Nft #{key}",
  }

  temp = value.each do |level_two_key, level_two_value|
    {
      "trait_type" => "#{level_two_key}",
      "value" => "#{level_two_value}"
    }
  end

  tempHash['attributes'] = temp
  puts "tempHash is #{tempHash}"
  file_name = "meta_json/#{key}"
  File.write(file_name, tempHash.to_json)

end
