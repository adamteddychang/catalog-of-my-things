require 'json'
require_relative 'music_album'
require_relative 'genre'

module DataStore
  def load_albums
    if File.exist?('album.json')
      JSON.parse(File.read('album.json')).map do |album|
        MusicAlbum.new(album['name'], album['genre'], album['publish_date'], album[on_spotify]);
      end
    else
      []
    end
  end
end