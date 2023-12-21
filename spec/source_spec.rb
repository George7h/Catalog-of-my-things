require './classes/source'
require './classes/movie'

RSpec.describe Source do
  describe '#initialize' do
    it 'creates a new source with the given attributes' do
      source = Source.new('Library', 1)
      expect(source.name).to eq('Library')
      expect(source.id).to eq(1)
    end
  end

  describe '#add_item' do
    it 'adds an item to the source' do
      source = Source.new('Library')
      movie = Movie.new('Inception', 'Sci-Fi', 'Christopher Nolan', 'Hollywood', Date.parse('2023-01-01'), false)

      source.add_item(movie)

      expect(source.items).to include(movie)
      expect(movie.source).to eq('Library')
    end
  end
end
