require './classes/item'

class Movie < item
  attr_accessor :silent

  def initialize(genre, author, source, publish_date, silent)
    super(genre, author, source, publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
