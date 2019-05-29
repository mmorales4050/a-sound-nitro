# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'
require 'rest-client'


require_relative '../secrets/api_key'
include Secret

User.create()

22.times do |index|
  response = RestClient.get("https://api.pexels.com/v1/search?query=music&per_page=80&page=#{index}", headers={"Authorization": api_key()})
  response = JSON.parse(response)
  response["photos"].each do |photo|
    Image.create(url: photo["url"])
  end
end


# image_page = Nokogiri::HTML(open("https://www.pexels.com/search/music/"))
# counter = 1
# image_page.css("img.photo-item__img").each do |image|
#   image_url = image.attribute("data-large-src")
#   Image.create(url: image_url)
#   puts "made #{counter} images"
#   counter += 1
# end
