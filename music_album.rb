require_relative 'item'

class MusicAlbum < Item
  def initialize(id, name, author, genre, publish_date, on_spotify)
    super(id, name, genre, author, label, publish_date)
    @on_spotify = on_spotify
  end
end
