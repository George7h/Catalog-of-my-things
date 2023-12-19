class Game
  attr_accessor :id, :name, :genre, :author, :source, :label, :publish_date, :archived, :multiplayer, :last_played_at

  def initialize(id:, name:, genre:, author:, source:, label:, publish_date:, archived: false, multiplayer:)
    @id = id
    @name = name
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
    @multiplayer = multiplayer
    @last_played_at = nil
  end
end
