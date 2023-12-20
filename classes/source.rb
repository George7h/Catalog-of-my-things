require './classes/item'

class Source < Item
    attr_accessor :id, :name, :items

    def initialize(id, name, items)
        @id = id
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item
        item.label = self
    end
end