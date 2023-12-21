# spec/genre_spec.rb
require './classes/genre'
require './classes/item

RSpec.describe Label do
  describe 'add_item' do
    it 'adds an item to the label' do
      genre = Genre.new('Comedy')
      item = Item.new(genre, 'Author1', 'Source1', 'Label1', Time.now)

      genre.add_item(item)

      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end
end
