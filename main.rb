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
      @app.list_all_games
    when 5
      @app.list_all_genres
    when 6
      @app.list_all_labels
    when 7
      @app.list_all_authors
    when 8
      @app.list_all_sources
    when 9
      @app.add_book
    when 10
      @app.add_music_album
    when 11
      @app.add_movie
    when 12
      @app.add_game
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

app_instance = App.new
menu = Menu.new(app_instance)

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
