require_relative 'item'

class Author
  attr_accessor :id, :first_name, :last_name, :items

  @@all_authors = []

  def initialize(id: nil, first_name:, last_name:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []

    @@all_authors << self
  end

  def to_json(*args)
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json(*args)
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.all
    @@all_authors
  end

  def self.find_by_full_name(full_name)
    @@all_authors.find { |author| author.full_name == full_name }
  end
end
