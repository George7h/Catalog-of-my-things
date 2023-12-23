require './classes/item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(nil, nil, nil, cover_state, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @archived = can_be_archived?
  end

  def can_be_archived?
    return true if @cover_state.downcase == 'bad'

    false
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
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end
end
