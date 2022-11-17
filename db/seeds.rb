# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)


movies["results"].each do |movie|
  # p movie["title"]
  newmovie = Movie.new
  newmovie.title = movie["title"]
  newmovie.overview = movie["overview"]
  newmovie.rating = movie["vote_average"]
  newmovie.poster_url = "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  newmovie.save
end
