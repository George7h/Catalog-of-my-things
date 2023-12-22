require './classes/genre'
require './classes/musicalbum'

RSpec.describe Genre do
  describe '#initialize' do
    it 'creates a new source with the given attributes' do
      genre = Genre.new('Action', 1)
      expect(genre.name).to eq('Action')
      expect(genre.id).to eq(1)
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new('Comedy')
      musicalbum = MusicAlbum.new('Thriller', 'Author1', 'Source1', 'Label1', Time.now, true)

      genre.add_item(musicalbum)

      expect(genre.items).to include(musicalbum)
      expect(musicalbum.genre.name).to eq('Comedy')
    end
  end
end
