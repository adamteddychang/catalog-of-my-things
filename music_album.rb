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
