require 'json'
require_relative 'music_album'
require_relative 'genre'

require_relative 'book'
require_relative 'label'

module DataStore
  def load_albums
    if File.exist?('album.json')
      JSON.parse(File.read('album.json')).map do |album|
        MusicAlbum.new(album['id'], album['name'], album['genre'], album['publish_date'], album['on_spotify'])
      end
    else
      []
    end
  end

  def load_genres
    if File.exist?('genre.json')
      JSON.parse(File.read('genre.json')).map do |genre|
        Genre.new(genre['id'], genre['name'])
      end
    else
      []
    end
  end

  def save_album
    album_data = []
    @albums.each do |album|
      album_data.push({ id: album.id, name: album.name, genre: album.genre, label: nil,
                        publish_date: album.publish_date, on_spotify: album.on_spotify })
    end
    open('album.json', 'w') { |f| f << JSON.generate(album_data) }
  end

  def save_genre
    genre_data = []
    @genres.each do |genre|
      genre_data.push({ id: genre.id, name: genre.name })
    end
    open('genre.json', 'w') { |f| f << JSON.generate(genre_data) }
  end

  def load_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json'))
    else
      []
    end
  end

  def load_labels
    if File.exist?('labels.json')
      JSON.parse(File.read('labels.json'))
    else
      []
    end
  end

  def save_book
    booksarr = []
    @books.each do |book|
      booksarr.push({ id: book['id'], name: book['name'],
                      label: book['label'], publish_date: book['publish_date'],
                      publisher: book['publisher'], cover_state: book['cover_state'] })
    end
    open('books.json', 'w') { |f| f << JSON.generate(booksarr) }
  end

  def save_label
    labelsarr = []
    @labels.each do |label|
      labelsarr.push({ id: label['id'], title: label['title'],
                       color: label['color'] })
    end
    open('labels.json', 'w') { |f| f << JSON.generate(labelsarr) }
  end
end
