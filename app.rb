require './classes/item'
require './classes/book'
require './classes/label'
require './classes/game'
require './classes/source'
require './classes/author'
require './classes/movie'

class App
  def initialize
    @books = []
    @labels = []
    @authors = []
    @movies = []
    @sources = []
  end

  # list methods
  def list_all_books
    puts "\nListing all books:"
    if @books.empty?
      puts 'No books found.'
    else
      @books.each do |book|
        puts "ID: #{book.id}, Author: #{book.author.first_name}, Publisher: #{book.publisher},
        Cover state: #{book.cover_state}"
      end
    end
  end

  def list_all_movies
    if @movies.empty?
      puts 'No movies were found'
    else
      @movies.each do |movie|
        puts "ID: #{movie.id}, Genre: #{movie.genre}, Author: #{movie.author}, Source: #{movie.source}, Date-Published: #{movie.publish_date}"
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

  # add methods
  def add_movie
    # puts 'Enter Label: '
    # label = gets.chomp.to_s
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
    puts 'Enter publish_date (YYYY-MM-DD): '
    publish_date_str = gets.chomp.to_s
    publish_date = Date.parse(publish_date_str)

    print 'Is it silent? (true/false): '
    silent = gets.chomp.downcase == 'true'
    movie = Movie.new(genre, author, source, publish_date, silent)
    choose_label(movie)
    source.add_item(movie)

    @movies << movie

    puts 'Movie added successfully!'
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

    book = Book.new(publisher, @cover_state, @publish_date)
    choose_label(book)
    choose_author(book)

    @books << book
  end

  private

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
