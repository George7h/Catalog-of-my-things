require './classes/item'

class Genre < Item
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id = nil)
    super
    @id = id || Random.random(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.name = self
  end
end
