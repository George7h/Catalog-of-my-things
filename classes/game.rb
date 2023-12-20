# game.rb
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(genre, author, source, label, publish_date, multiplayer, last_played_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super &&
      ((Time.now - @publish_date.to_time).to_i > 10 * 365 * 24 * 60 * 60) &&
      ((Time.now - @last_played_at.to_time).to_i > 2 * 365 * 24 * 60 * 60)
  end

  def self.all
    # Return all instances of Game (you may need to maintain a collection)
    # Replace this with your actual data retrieval logic
    []
  end
end
