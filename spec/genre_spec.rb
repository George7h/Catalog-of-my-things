require 'date'
require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  let(:genre) { Genre.new('Non-Fiction') }

  describe '#add_item' do
    let(:item) { Item.new(genre, 'Author', 'Book', 'Book Label', Date.new(2022, 1, 1)) }

    it 'should add the input item to the collection of items' do
      expect { genre.add_item(item) }.to change { genre.items.count }.by(1)
      expect(genre.items).to include(item)
    end

    it 'should add self as a property of the item object' do
      genre.add_item(item)
      expect(item.genre).to eq(genre)
    end
  end
end
