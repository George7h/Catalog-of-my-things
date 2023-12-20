require './classes/item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, source, label, publish_date, on_spotify)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super || @on_spotify
  end
end
