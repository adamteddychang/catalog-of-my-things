require 'json'
require_relative 'music_album'
require_relative 'genre'

module DataStore
  def load_albums
    if File.exist?('album.json')
      JSON.parse(File.read('album.json')).map do |album|
        MusicAlbum.new(album['name'], album['genre'], album['label'], album['publish_date'], album['on_spotify'])
      end
    else
      []
    end
  end

  def load_genres
    if File.exist?('genre.json')
      JSON.parse(File.read('genre.json')).map do |genre|
        Genre.new(genre['name'])
      end
    else
      []
    end
  end

  def save_album
    album_data = []
    genre_data = []
    @albums.each do |album|
      album_data.push({ name: album.name, genre: album.genre, label: nil, publish_date: album.publish_date,
                        on_spotify: album.on_spotify })
    end
    open('album.json', 'w') { |f| f << JSON.generate(album_data) }
    open('genre.json', 'w') { |f| f << JSON.generate(genre_data) }
  end
end
