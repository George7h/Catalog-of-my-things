require './classes/item'
require './classes/book'
require './classes/label'

class App
  def initialize
    @books = []
    @labels = []
  end

  # list methods
  def list_all_books
    puts "\nListing all books:"
    if @books.empty?
      puts 'No books found.'
    else
      @books.each do |book|
        puts "ID: #{book.id}, Author: #{book.author}, Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
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
    cover_state = gets.chomp.to_s
    puts 'Published date (YYYY-MM-DD):'
    loop do
      @publish_date = gets.chomp
      break if @publish_date.match?(/\d{4}-\d{2}-\d{2}/)
      return if @publish_date == 'exit'

      puts 'Invalid date format. Please try again.'
    end
    @books << Book.new(publisher, cover_state, @publish_date)

    puts 'Book successfully added.'
  end
end
