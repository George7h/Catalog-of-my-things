
puts 'Welcome to your Catalog of things'

class Menu
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
  
    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/CyclomaticComplexity
    def run_options(choice)
      case choice
      when 1
        list_all_books
      when 2
        list_all_music_albums
      when 3
        list_all_movies
      when 4
        list_all_games
      when 5
        list_all_genres
      when 6
        list_all_labels
      when 7
        list_all_authors
      when 8
        list_all_sources
      when 9
        add_book
      when 10
        add_music_album
      when 1113
        add_movie
      when 12
        add_game
      else
        puts 'Invalid option.Please try again.'
      end
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/CyclomaticComplexity
end
  

menu = Menu.new

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
