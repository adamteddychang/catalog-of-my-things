class Genre
  attr_accessor :name, :id, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end

genre1 = Genre.new(1000, 'Rock')
puts genre1
puts genre1.id
puts genre1.name
puts genre1.items
