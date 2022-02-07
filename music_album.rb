class MusicAlbum < Item
  def initialize(id, name, genre, author, genre, publish_date, on_spotify)
    super(id, name, genre, author, label, publish_date)
    @on_spotify = on_spotify
  end
end