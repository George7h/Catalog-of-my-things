# app.rb
require_relative './classes/item'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/game'
require_relative './classes/source'
require_relative './classes/author'

class App
  def initialize
    @books = []
    @labels = []
    @authors = []
    @games = []
  end

  # list methods
  def list_all_books
    puts "\nListing all books:"
    if @books.empty?
      puts 'No books found.'
    else
      @books.each do |book|
        puts "ID: #{book.id}, Author: #{book.author.full_name}, Publisher: #{book.publisher},
        Cover state: #{book.cover_state}"
      end
    end
  end

  def list_all_labels
    puts "\nListing all labels:"
    if @labels.empty?
      puts 'No labels found.'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def list_all_games
    puts "\nListing all games:"
    if @games.empty?
      puts 'No games found.'
    else
      @games.each do |game|
        puts "#{game.id}. #{game.label} (Genre: #{game.genre}, Author: #{game.author.full_name})"
      end
    end
  end

  def list_all_authors
    puts "\nListing all authors:"
    if @authors.empty?
      puts 'No authors found.'
    else
      @authors.each do |author|
        puts "ID: #{author.id}, Full Name: #{author.full_name}, Items Count: #{author.items.count}"
      end
    end
  end

  # add methods
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

    book = Book.new(publisher, @cover_state, @publish_date)
    choose_label(book)
    choose_author(book)

    @books << book
  end

  def add_game
    puts '===== Add a Game ====='
    print 'Enter genre: '
    genre = gets.chomp
    print 'Enter author (full name): '
    author_name = gets.chomp

    # Modified code: Find or create the author based on full name
    author = find_or_create_author(author_name)

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

    @games << game

    puts 'Game added successfully!'
  end

  private

 # Modified code: Method to find or create an author based on full name
 def find_or_create_author(full_name)
  first_name, last_name = full_name.split
  author = @authors.find { |a| a.first_name == first_name && a.last_name == last_name }

  unless author
    author = Author.new(first_name: first_name, last_name: last_name)
    @authors << author
  end

  author
end

  def choose_label(item)
    puts 'Label title:'
    title = gets.chomp.to_s
    puts 'Label color:'
    color = gets.chomp.to_s
    label = @labels.find { |l| l.title == title } || Label.new(title, color)
    @labels << label unless @labels.include?(label)
    item.label = label
  end

  def choose_author(item)
    puts 'Authors first name:'
    first_name = gets.chomp.to_s
    puts 'Authors last name:'
    last_name = gets.chomp.to_s
    author = @authors.find { |a| a.first_name == first_name && a.last_name == last_name } ||
             Author.new(first_name: first_name, last_name: last_name)
    @authors << author unless @authors.include?(author)
    item.author = author
  end
end
