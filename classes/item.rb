class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @author = author || {}
    @genre = genre || {}
    @source = source || {}
    @label = label || {}
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts "Item #{@id} has been archived"
    else
      puts "Item #{@id} cannot be archived"
    end
  end
end
