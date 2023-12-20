# game.rb
require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  # Class variable to store all game instances
  @@all_games = []

  def initialize(genre, author, source, label, publish_date, multiplayer, last_played_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = Date.parse(publish_date)

    # Add the new game instance to the collection
    @@all_games << self
  end

  def can_be_archived?
    super &&
      ((Time.now - @publish_date.to_time).to_i > 10 * 365 * 24 * 60 * 60) &&
      ((Time.now - Date.parse(@last_played_at).to_time).to_i > 2 * 365 * 24 * 60 * 60)
  end

  def self.all
    @@all_games
  end
end
