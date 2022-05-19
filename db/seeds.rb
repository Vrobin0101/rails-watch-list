# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'
require 'faker'

LIST_NAME = %W[Classic SuperHero Dramatique Classic]

unserialized_data = URI.open('https://tmdb.lewagon.com/movie/top_rated').read
serialized_data = JSON.parse(unserialized_data)


LIST_NAME.each { |name| List.create(name: name) }
serialized_data['results'].each do |movie|
  movie = Movie.new(title: movie['original_title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}", rating: movie['vote_average'])
  bookmark = Bookmark.new
  bookmark.comment = Faker::Lorem.sentence(word_count: 11)
  bookmark.movie = movie
  bookmark.list = List.find_by_name(LIST_NAME.sample)
  movie.save!
  bookmark.save!
end
