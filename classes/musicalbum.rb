require './classes/item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(nil, nil, nil, nil, publish_date)
    @on_spotify = on_spotify
  end

  def on_spotify?
    @on_spotify == true
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
      'on_spotify' => @on_spotify
    }.to_json(*args)
  end

  def can_be_archived?
    super || @on_spotify
  end
end
