require './classes/item'
class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = nil)
    @id = id || Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
