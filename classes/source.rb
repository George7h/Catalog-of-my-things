require './classes/item'

class Source < Item
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id = nil)
    super(name, nil, nil, nil, nil)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = name
  end
end
