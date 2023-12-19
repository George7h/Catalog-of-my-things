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
end
