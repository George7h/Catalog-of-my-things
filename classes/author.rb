# author.rb
require_relative 'item'

class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(id: nil, first_name:, last_name:)
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
    []
  end

  def self.find_by_full_name(full_name)
    nil
  end
end
