# source_spec.rb
require './classes/source'
require './classes/item'

RSpec.describe Source do
  describe '#add_item' do
    it 'adds an item to the source' do
      source_name = 'Test Source'

      source = Source.new(source_name)
      item = Item.new(nil, nil, source_name, nil, Time.now)

      source.add_item(item)

      expect(source.items).to include(item)
      expect(item.source).to eq(source)
    end

    it 'does not add the same item twice' do
      source_name = 'Test Source'

      source = Source.new(source_name)
      item = Item.new(nil, nil, source_name, nil, Time.now)

      source.add_item(item)
      source.add_item(item)

      expect(source.items.size).to eq(1)
    end
  end
end
