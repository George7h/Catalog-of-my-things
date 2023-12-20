require './classes/item'
require './classes/book'
require './classes/label'
require './classes/game'
require './classes/source'
require './classes/author'

class App
  def initialize
    @books = []
    @labels = []
    @authors = []
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
