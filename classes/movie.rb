require './classes/item'

class Movie < Item
  attr_accessor :silent

  def initialize(title, genre, author, source, publish_date, silent, id = nil)
    super(genre, author, source, nil, publish_date) 
    @id = id || Random.rand(1..1000)
    @title = title
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
