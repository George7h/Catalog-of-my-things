require './classes/item'

class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id = nil)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def to_json(*args)
    {
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
