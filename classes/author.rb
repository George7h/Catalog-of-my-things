# author.rb
require_relative 'item'

class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(id:, first_name:, last_name:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.all
    # Return all instances of Author (you may need to maintain a collection)
    # Replace this with your actual data retrieval logic
    []
  end

  def self.find_by_full_name(full_name)
    # Find and return an author by full name
    # Replace this with your actual data retrieval logic
    nil
  end
end
