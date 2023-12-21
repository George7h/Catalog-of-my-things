# genre_spec.rb
require './classes/genre'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a new genre with a name and assigns an ID' do
      genre = Genre.new('Science Fiction')
      expect(genre.name).to eq('Science Fiction')
      expect(genre.id).not_to be_nil
    end

    it 'assigns the provided ID to the genre' do
      genre = Genre.new('Fantasy', 42)
      expect(genre.id).to eq(42)
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Mystery')
      item = Item.new(genre, 'Author', 'Source', 'Label', Time.now)
      genre.add_item(item)
      expect(genre.items).to include(item)
      expect(item.genre).to eq(genre)
    end
  end
end
