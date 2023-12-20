# game_spec.rb
require 'date'
require_relative '../classes/game'

describe Game do
  let(:current_time) { Time.now }
  let(:ten_years_ago) { current_time - 10 * 365 * 24 * 60 * 60 }
  let(:two_years_ago) { current_time - 2 * 365 * 24 * 60 * 60 }

  describe '#initialize' do
    it 'initializes a Game object with the provided attributes' do
      game = Game.new('FPS', 'John Doe', 'Steam', 'Call of Duty', '2020-01-01', true, '2023-01-01')
      expect(game.genre).to eq('FPS')
      expect(game.author).to eq('John Doe')
      expect(game.source).to eq('Steam')
      expect(game.label).to eq('Call of Duty')
      expect(game.publish_date).to eq(Date.parse('2020-01-01'))
      expect(game.multiplayer).to be true
      expect(game.last_played_at).to eq('2023-01-01')
    end
  end

  describe '#can_be_archived?' do
    context 'when the game can be archived' do
      it 'returns true' do
        game = Game.new('RPG', 'Jane Smith', 'Origin', 'Mass Effect', '2010-01-01', true, two_years_ago.strftime('%F'))
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when the game cannot be archived' do
      it 'returns false' do
        game = Game.new('Adventure', 'Bob Johnson', 'Epic Games', 'Uncharted', '2022-01-01', false, two_years_ago.strftime('%F'))
        expect(game.can_be_archived?).to be false
      end
    end
  end

  describe '.all' do
    it 'returns an array of all game instances' do
      Game.class_variable_set(:@@all_games, []) # Reset the class variable before testing

      game1 = Game.new('Strategy', 'Alice Wonderland', 'GOG', 'Civilization VI', '2018-01-01', true, '2023-01-01')
      game2 = Game.new('Simulation', 'Eve Adams', 'Ubisoft', 'The Sims 4', '2015-01-01', false, '2022-01-01')

      expect(Game.all).to contain_exactly(game1, game2)
    end
  end
end
