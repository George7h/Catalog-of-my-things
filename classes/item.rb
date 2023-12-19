# frozen_string_literal: true

# class Item.rb
class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(genre, author, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre || {}
    @author = author || {}
    @label = label || {}
    @publish_date = publish_date
    @archived = false
  end

def genre=(new_genre)
  @genre = new_genre
end

def author=(new_author)
  @author = new_author
end

def label=(new_label)
  @label = new_label
end

def can_be_archived?
  (Time.now.year - @publish_date.year) > 10
end

def move_to_archive
  if can_be_archived
    @archived = true
    puts 'Item #{id} has been archived'
  else
    puts 'Item #{id} cannot be archived'
  end
end
end
