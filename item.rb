require 'date'

class Item
  attr_accessor :name, :publish_date, :archived, :id
  attr_reader :label, :genre

  def initialize(id, name, genre, label, publish_date, archived = false)
    @id = id
    @name = name
    @genre = genre
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def can_archived?
    current_time = Date.today
    time_different = current_time.year - publish_date.year
    time_different >= 10
  end

  def move_archive
    @archived == true if can_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
