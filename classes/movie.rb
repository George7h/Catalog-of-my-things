require './classes/item'

class Movie < Item
  attr_accessor :silent, :title

  def initialize(genre, author, source, publish_date, silent, _id = nil)
    super(genre, author, source, nil, publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
