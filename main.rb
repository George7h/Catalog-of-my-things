require_relative 'classes/item'
require_relative 'classes/author'
require_relative 'classes/game'
require './app'

puts 'Welcome to your Catalog of things'

class Menu
  def initialize(app)
    @app = app
  end

  def display_menu
    puts '===== Library Menu ====='
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all movies'
    puts '4. List all games'
    puts '5. List all genres'
    puts '6. List all labels'
    puts '7. List all authors'
    puts '8. List all sources'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a movie'
    puts '12. Add a game'
    puts '13. Exit'
  end

  def run_options(choice)
    case choice
    when 1
      @app.list_all_books
    when 2
      @app.list_all_music_albums
    when 3
      @app.list_all_movies
    when 4
      list_all_games
    when 5
      @app.list_all_genres
    when 6
      @app.list_all_labels
    when 7
      list_all_authors
    when 8
      @app.list_all_sources
    when 9
      @app.add_book
    when 10
      @app.add_music_album
    when 11
      @app.add_movie
    when 12
      add_game
    else
      puts 'Invalid option. Please try again.'
    end
  end

  # Karan's code
  def list_all_games
    puts '===== List of Games ====='
    Game.all.each do |game|
      puts "#{game.id}. #{game.label} (Genre: #{game.genre}, Author: #{game.author.full_name})"
    end
  end

  def list_all_authors
    puts '===== List of Authors ====='
    Author.all.each do |author|
      puts "#{author.id}. #{author.full_name}"
    end
  end

  def add_game
    puts '===== Add a Game ====='
    print 'Enter genre: '
    genre = gets.chomp
    print 'Enter author (full name): '
    author_name = gets.chomp
    author = Author.find_by_full_name(author_name) || Author.new(first_name: author_name.split.first, last_name: author_name.split.last)
    print 'Enter source: '
    source = gets.chomp
    print 'Enter label: '
    label = gets.chomp
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    print 'Is it multiplayer? (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter last played date (YYYY-MM-DD): '
    last_played_at = gets.chomp

    game = Game.new(genre, author, source, label, publish_date, multiplayer, last_played_at)
    game.move_to_archive if game.can_be_archived?

    puts 'Game added successfully!'
  end
end
# karan's code ends

app_instance = App.new
menu = Menu.new(app_instance)

puts 'Welcome to your Catalog of things'

loop do
  menu.display_menu
  print 'Enter your choice (1 - 13): '
  choice = gets.to_i

  case choice
  when 1..12
    menu.run_options(choice)
  when 13
    puts 'Exiting the app'
    break
  else
    puts 'Invalid choice. Please input a valid choice'
  end
end
