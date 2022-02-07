class Item
  attr_accessor :name, :genre, :publish_date, :archived
  attr_reader :label

  def initialize(id, name, genre, _label, publish_date, archived = false)
    @id = id
    @name = name
    @genre = genre
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_archived?
    return false unless publish_date < 10
  end

  def move_archive
    archived == true if can_archived? == true
  end

  def label=(label)
    @label = label
    label.item.push(self) unless label.item.include?(self)
  end
end
