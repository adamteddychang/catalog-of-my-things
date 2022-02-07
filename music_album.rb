require_relative 'item'

class MusicAlbum < Item
  def initialize(id, name, genre, publish_date, on_spotify)
    super(id, name, genre, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super() and @on_spotify
  end
end

album = MusicAlbum.new(1000, 'Orçun', 'Rock', '31.01.2022', false)
puts album
puts album.id
puts album.genre
puts album.publish_date
puts album.on_spotify