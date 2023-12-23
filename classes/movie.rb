require './classes/item'

class Movie < Item
  attr_accessor :silent, :publish_date

  def initialize(publish_date, silent)
    super(nil, nil, nil, nil, publish_date)
    @publish_date = publish_date
    @silent = silent
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
      'silent' => @silent
    }.to_json(*args)
  end

  def can_be_archived?
    super || @silent
  end
end
