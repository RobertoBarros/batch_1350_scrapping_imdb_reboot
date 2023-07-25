require 'yaml'
require_relative 'scraper'

urls = fetch_top_movie_urls

movies = []
urls.each do |url|
  movie = scrape_movie(url)
  movies << movie

  puts "Title: #{movie[:title]}"
  puts "Year: #{movie[:year]}"
  puts "Storyline: #{movie[:storyline]}"
  puts '-' * 80
end

File.open('movies.yml', 'wb') do |file|
  file.write(movies.to_yaml)
end
