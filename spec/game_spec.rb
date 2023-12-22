# spec/game_spec.rb

require 'rspec'
require_relative '../classes/game'

describe Game do
  let(:publish_date) { '2010-01-01' }
  let(:multiplayer) { true }
  let(:last_played_at) { '2022-01-01' }

  subject(:game) { described_class.new(publish_date, multiplayer, last_played_at) }

  describe '#can_be_archived?' do
    context 'when the game can be archived' do
      it 'returns true' do
        allow(Time).to receive(:now).and_return(Time.new(2032, 1, 1, 0, 0, 0))

        expect(game.can_be_archived?).to be(true)
      end
    end

    context 'when the game cannot be archived' do
      it 'returns false' do
        allow(Time).to receive(:now).and_return(Time.new(2015, 1, 1, 0, 0, 0))

        expect(game.can_be_archived?).to be(false)
      end
    end
  end
end
