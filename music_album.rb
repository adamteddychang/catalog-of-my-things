require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, name, genre, publish_date, on_spotify)
    super(id, name, genre, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_archived?
    super and @on_spotify
  end
end

music_album1 = MusicAlbum.new(1000, 'Sirenler', 'Rock', '2005-10-10', true)
puts music_album1.can_archived?
puts music_album1.publish_date
puts music_album1.on_spotify