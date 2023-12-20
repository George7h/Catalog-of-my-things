require './classes/movie'
require './classes/source'

class App
  def initialize
    @movies = []
    @sources = []
  end

  def list_all_movies
    if @movies.empty?
      puts 'No movies were found'
    else
      @movies.each do |movie|
        puts "ID: #{movie}"
      end
    end
  end

  def list_all_sources
    if @sources.empty?
      puts 'No sources were found'
    else
      @sources.each do |source|
        puts "ID: #{source.id}, Source: #{source.name}"
      end
    end
  end

  def add_movie
    puts 'Enter Title: '
    title = gets.chomp.to_s
    puts 'Enter genre: '
    genre = gets.chomp.to_s
    puts 'Enter Author: '
    author = gets.chomp.to_s
    puts 'Enter source: '
  
    source_name = gets.chomp.to_s
    source = @sources.find { |s| s.name == source_name }
  
    unless source
      source = Source.new(source_name)
      @sources << source
    end
  
    puts 'Enter publish_date: '
    publish_date = gets.chomp.to_s
    print 'Is it silent? (true/false): '
    silent = gets.chomp.downcase == 'true'
  
    movie = Movie.new(title, genre, author, source, publish_date, silent)
    source.add_item(movie)
  
    @movies << movie
  
    puts 'Movie added successfully!'
  end
end
