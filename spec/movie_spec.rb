require './classes/movie'

RSpec.describe Movie do
  describe '#initialize' do
    it 'creates a new movie with the given attributes' do
      movie = Movie.new('Sci-Fi', 'Christopher Nolan', 'Hollywood', Date.parse('2023-01-01'), true)
      expect(movie.genre).to eq('Sci-Fi')
      expect(movie.author).to eq('Christopher Nolan')
      expect(movie.source).to eq('Hollywood')
      expect(movie.publish_date).to eq(Date.parse('2023-01-01'))
      expect(movie.silent).to eq(true)
      expect(movie.id).not_to be_nil
    end
  end

  describe '#can_be_archived?' do
    context 'when the movie is silent' do
      it 'returns true' do
        movie = Movie.new('Sci-Fi', 'Christopher Nolan', 'Hollywood', Date.parse('2023-01-01'), true)
        expect(movie.can_be_archived?).to eq(true)
      end
    end

    context 'when the movie is not silent' do
      it 'returns the result of the parent method' do
        movie = Movie.new('Sci-Fi', 'Christopher Nolan', 'Hollywood', Date.parse('2023-01-01'), true)
        allow(movie).to receive(:super).and_return(true)
        expect(movie.can_be_archived?).to eq(true)
      end
    end
  end
end
