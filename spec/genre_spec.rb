require './classes/genre'
require './classes/item'

RSpec.describe Genre do
  describe '#add_item' do
    it 'adds an item to the genre' do
      genre_name = 'Test Genre'

      genre = Genre.new(genre_name)
      item = Item.new(nil, nil, nil, nil, Time.now)

      genre.add_item(item)

      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end
end
