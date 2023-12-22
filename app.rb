require './classes/item'
require './classes/book'
require './classes/label'
require './classes/game'
require './classes/source'
require './classes/author'
require './classes/movie'
require './classes/genre'
require './classes/musicalbum'
require 'json'


class Saveload
  def load_data(filename)
    if File.exist?(filename)
      file = File.read(filename)
      JSON.parse(file)
    else
      puts "File #{filename} does not exist."
      File.write(filename, '[]')
      []
    end
  end

  def save_data(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end
end

class App
  def initialize
    @books = Saveload.new.load_data('data/books.json') || []
    @labels = Saveload.new.load_data('data/labels.json') || []
    @authors = Saveload.new.load_data('data/authors.json') || []
    @movies = Saveload.new.load_data('data/movies.json') || []
    @sources = Saveload.new.load_data('data/sources.json') || []
    @genres = Saveload.new.load_data('data/genres.json') || []
    @games = Saveload.new.load_data('data/games.json') || []
    @music_albums = Saveload.new.load_data('data/music_albums.json') || []
  end

  def save_json_data
    Saveload.new.save_data('filepath', data)
  end
  # list methods

  def list_all_books
    @books = Saveload.new.load_data('data/books.json')
    puts "\nListing all books:"
    if @books.empty?
      puts 'No books found.'
    else
      @books.each do |book|
        puts "ID: #{book['id']},
        Title: #{book['label']['title']},
        Author: #{book['author']['first_name']} #{book['author']['last_name']},
        Publisher: #{book['publisher']},
        Cover state: #{book['cover_state']}"
      end
    end
  end

  def list_all_music_albums
    @music_albums = Saveload.new.load_data('data/music_albums.json')
    puts "\nListing all music albums:"
    if @music_albums.empty?
      puts 'No music albums found.'
    else
      @music_albums.each do |music_album|
        puts "ID: #{music_album['id']},
        Author: #{music_album['author']['first_name']} #{music_album['author']['last_name']},
        Genre: #{music_album['genre']['name']},
        Source: #{music_album['source']['name']},
        Label: #{music_album['label']['title']}"
      end
    end
  end

  def list_all_movies
    @movies = Saveload.new.load_data('data/movies.json')
    puts "\nListing all movies:"
    if @movies.empty?
      puts 'No movies were found'
    else
      @movies.each do |movie|
        puts "ID: #{movie['id']},
        Label: #{movie['label']['title']},
        Genre: #{movie['genre']['name']},
        Author: #{movie['author']['first_name']} #{movie['author']['last_name']},
        Source: #{movie['source']['name']}"
      end
    end
  end

  def list_all_sources
    @sources = Saveload.new.load_data('data/sources.json')
    if @sources.empty?
      puts 'No sources were found'
    else
      @sources.each do |source|
        puts "ID: #{source['id']}, Source: #{source['name']}"
      end
    end
  end

  def list_all_labels
    @labels = Saveload.new.load_data('data/labels.json')
    puts "\nListing all labels:"
    if @labels.empty?
      puts 'No labels found.'
    else
      @labels.each do |label|
        puts "Title: #{label['title']}, Color: #{label['color']}"
      end
    end
  end

  def list_all_games
    @games = Saveload.new.load_data('data/games.json')
    puts '===== List of Games ====='
    if @games.empty?
      puts 'No games found.'
    else
      @games.each do |game|
        puts "Title: #{game['label']['title']},
        Genre: #{game['genre']['name']},
        last_played_at: #{game['last_played_at']},}
        multiplayer: #{game['multiplayer']}"
      end
    end
  end

  def list_all_authors
    @authors = Saveload.new.load_data('data/authors.json')
    puts '===== List of Authors ====='
    if @authors.empty?
      puts 'No authors found.'
    else
      @authors.each do |author|
        puts "ID: #{author['id']},
        Author: #{author['first_name']} #{author['last_name']}"
      end
    end
  end

  def list_all_genres
    @genres = Saveload.new.load_data('data/genres.json')
    puts '===== List of Genres ====='
    if @genres.empty?
      puts 'No genres found.'
    else
      @genres.each do |genre|
        puts "ID: #{genre['id']}, Genre: #{genre['name']}"
      end
    end
  end

  def add_book
    puts 'Published by:'
    publisher = gets.chomp.to_s
    puts 'Cover state (good or bad):'
    loop do
      @cover_state = gets.chomp.to_s
      break if %w[good bad].include?(@cover_state)
      return if @cover_state == 'exit'

      puts 'Invalid cover state. Please try again or type exit to return to the main menu.'
    end

    puts 'Published date (YYYY-MM-DD):'
    loop do
      @publish_date = gets.chomp
      break if @publish_date.match?(/\d{4}-\d{2}-\d{2}/)
      return if @publish_date == 'exit'

      puts 'Invalid date format. Please try again.'
    end

    book = Book.new(
      publisher,
      @cover_state,
      @publish_date
    )
    choose_genre(book)
    choose_label(book)
    choose_author(book)
    choose_source(book)

    @books << book

    # Save each chosen element to JSON files

    json = Saveload.new
    json.save_data('data/books.json', @books)
    json.save_data('data/genres.json', @genres)
    json.save_data('data/labels.json', @labels)
    json.save_data('data/authors.json', @authors)
    json.save_data('data/sources.json', @sources)
  end

  def add_movie
    puts 'Enter publish_date: '
    publish_date = gets.chomp.to_s
    print 'Is it silent? (true/false): '
    silent = gets.chomp.downcase == 'true'

    movie = Movie.new(publish_date, silent)
    choose_author(movie)
    choose_genre(movie)
    choose_source(movie)
    choose_label(movie)

    @movies << movie
    # Save each chosen element to JSON files

    json = Saveload.new
    json.save_data('data/movies.json', @movies)
    json.save_data('data/authors.json', @authors)
    json.save_data('data/genres.json', @genres)
    json.save_data('data/sources.json', @sources)
    json.save_data('data/labels.json', @labels)

    puts 'Movie added successfully!'
  end

  def add_game
    puts '===== Add a Game ====='
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Is it multiplayer? (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter last played date (YYYY-MM-DD): '
    last_played_at = gets.chomp

    game = Game.new(publish_date, multiplayer, last_played_at)
    choose_author(game)
    choose_genre(game)
    choose_source(game)
    choose_label(game)

    @games << game
    # Save each chosen element to JSON files

    json = Saveload.new
    json.save_data('data/games.json', @games)
    json.save_data('data/authors.json', @authors)
    json.save_data('data/genres.json', @genres)
    json.save_data('data/sources.json', @sources)
    json.save_data('data/labels.json', @labels)
    puts 'Game added successfully!'
  end

  def add_music_album
    puts '===== Add a Music Album ====='
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Is it on Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    music_album = MusicAlbum.new(publish_date, on_spotify)
    choose_author(music_album)
    choose_genre(music_album)
    choose_source(music_album)
    choose_label(music_album)

    @music_albums << music_album
    # Save each chosen element to JSON files

    json = Saveload.new
    json.save_data('data/music_albums.json', @music_albums)
    json.save_data('data/authors.json', @authors)
    json.save_data('data/genres.json', @genres)
    json.save_data('data/sources.json', @sources)
    json.save_data('data/labels.json', @labels)
    puts 'Music album added successfully!'
  end
end

  private

# choose methods for all create methods

def choose_genre(item)
  puts 'Genre name:'
  name = gets.chomp.to_s
  genre_hash = { 'id' => Random.rand(1..1000), 'name' => name }
  genre = @genres.find { |g| g['name'] == name } || genre_hash
  @genres << genre_hash unless @genres.include?(genre)
  item.genre = genre
end

def choose_label(item)
  puts 'Label title:'
  title = gets.chomp.to_s
  puts 'Label color:'
  color = gets.chomp.to_s

  label_hash = { 'id' => Random.rand(1..1000), 'title' => title, 'color' => color }

  label = @labels.find { |l| l['title'] == title } || label_hash
  @labels << label_hash unless @labels.include?(label_hash)
  item.label = label
end

def choose_author(item)
  puts 'Authors/producer/creator first name:'
  first_name = gets.chomp.to_s
  puts 'Authors/producer/creator last name:'
  last_name = gets.chomp.to_s

  author_hash = { 'id' => Random.rand(1..1000), 'first_name' => first_name, 'last_name' => last_name }

  author = @authors.find { |a| a['first_name'] == first_name && a['last_name'] == last_name } || author_hash
  @authors << author_hash unless @authors.include?(author_hash)
  item.author = author
end

def choose_source(item)
  puts 'Source name:'
  name = gets.chomp.to_s

  source_hash = { 'id' => Random.rand(1..1000), 'name' => name }

  source = @sources.find { |s| s['name'] == name } || source_hash
  @sources << source_hash unless @sources.include?(source_hash)
  item.source = source
end
