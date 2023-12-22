require 'date'
require './classes/movie'

RSpec.describe Movie do
  describe '#initialize' do
    it 'creates a new movie with the given attributes' do
      publish_date = Date.parse('2023-01-01')
      silent = true

      movie = Movie.new(publish_date, silent)

      expect(movie.publish_date).to eq(publish_date)
      expect(movie.silent).to eq(silent)
    end
  end

  describe '#can_be_archived?' do
    context 'when silent is true' do
      it 'returns true' do
        movie = Movie.new(Date.parse('2023-01-01'), true)
        expect(movie.can_be_archived?).to be true
      end
    end

    context 'when silent is false' do
      it 'returns the result from the superclass' do
        allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)
        movie = Movie.new(Date.parse('2023-01-01'), false)
        expect(movie.can_be_archived?).to be false
      end
    end
  end
end
