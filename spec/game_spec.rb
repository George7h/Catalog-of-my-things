# spec/game_spec.rb
require 'date'
require_relative '../classes/game'

describe Game do
  let(:genre) { 'Action' }
  let(:author) { 'John Doe' }
  let(:source) { 'Console' }
  let(:label) { 'Game Label' }
  let(:publish_date) { Date.new(2020, 1, 1) }
  let(:multiplayer) { true }
  let(:last_played_at) { Time.now - 3 * 365 * 24 * 60 * 60 } # 3 years ago

  subject(:game) do
    Game.new(genre, author, source, label, publish_date, multiplayer, last_played_at)
  end

  describe '#can_be_archived?' do
    context 'when parent method returns true and last_played_at is older than 2 years' do
      it 'returns true' do
        # Mock the parent method to return true
        allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)

        puts "Item publish_date: #{game.publish_date}"
        puts "Item publish_date.to_time: #{game.publish_date.to_time}"
        puts "Item can_be_archived?: #{game.can_be_archived?}"

        puts "last_played_at: #{game.last_played_at}"
        puts "Time.now: #{Time.now}"
        puts "(Time.now - game.last_played_at).to_i: #{(Time.now - game.last_played_at).to_i}"
        puts "(2 * 365 * 24 * 60 * 60): #{(2 * 365 * 24 * 60 * 60)}"

        # Check the actual value of can_be_archived?
        result = game.can_be_archived?

        # Output the result for debugging
        puts "Result: #{result}"

        expect(result).to be_truthy
      end
    end
  end
end
