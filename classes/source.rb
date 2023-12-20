require './classes/item'

class Source < Item
  attr_accessor :name,
  attr_reader :id, :items

  def initialize(name, id = nil)
    super
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
