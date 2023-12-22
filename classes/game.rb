require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  # Class variable to store all game instances

  def initialize(publish_date, multiplayer, last_played_at)
    super(nil, nil, multiplayer, last_played_at, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = Date.parse(publish_date)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'source' => @source,
      'label' => @label,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
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
