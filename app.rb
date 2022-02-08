require_relative 'genre'
require_relative 'music_album'

class App
  def initialize
    @albums = []
    @genres = []
  end

  def get_opt(input)
    case input
    when '1'
      puts 'List all books'
    when '2'
      list_music_album
    when '3'
      list_genres
    when '4'
      puts 'List all Labels'
    when '5'
      puts 'Add a book'
    when '6'
      add_music_album
    when '7'
      puts 'exit'
    end
  end

  def list_music_album
    puts 'There is no Album Yet! Please add album.' if @albums.empty?
    @albums.each do |album|
      puts "[#{album.id}], Name: #{album.name}, Genre: #{album.genre} Publish Date: #{album.publish_date}"
    end
  end

  def list_genres
    puts 'There are no Genre Yet!' if @genres.empty?
    @genres.each { |genre| puts genre }
  end

  def add_music_album
    id = Random.rand(1..1000)
    print 'Name: '
    name = gets.chomp
    print 'Genre: '
    genre = gets.chomp
    print 'Publish Date: '
    date = gets.chomp
    print 'On Spotify Y/N:'
    on_spotify = gets.chomp.downcase
    case on_spotify
    when 'y'
      true
    else
      false
    end
    new_music_album = MusicAlbum.new(id, name, genre, date, on_spotify)
    @albums << new_music_album
    @genres << new_music_album.genre
  end
end
