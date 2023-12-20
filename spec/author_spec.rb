require 'date'
require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  let(:author) { Author.new(id: 1, first_name: 'John', last_name: 'Doe') }

  describe '#add_item' do
    let(:item) { Item.new('Fiction', author, 'Book', 'Book Label', Date.new(2022, 1, 1)) }

    it 'should take an instance of the Item class as an input' do
      expect { author.add_item(item) }.not_to raise_error
    end

    it 'should add the input item to the collection of items' do
      expect { author.add_item(item) }.to change { author.items.count }.by(1)
      expect(author.items).to include(item)
    end

    it 'should add self as a property of the item object' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end
  end
end
