require 'json'
require_relative 'book'
require_relative 'label'
require_relative 'genre'
require_relative 'music_album'
require_relative 'data_store'

class App
  include DataStore
  def initialize
    @albums = load_albums
    @genres = load_genres
    @books = []
    @labels = []
  end

  def get_opt(input)
    case input
    when '1'
      list_books
    when '2'
      list_music_album
    when '3'
      list_genres
    when '4'
      list_labels
    when '5'
      add_book_details
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
    @genres.each { |genre| puts "[#{genre.id}], Genre: #{genre.name}" }
  end

  def add_genre(genre)
    id = Random.rand(1..1000)
    genre_array = []
    @genres.each { |genre| genre_array << genre.name}
    if(!genre_array.include?(genre))
      new_genre = Genre.new(id, genre)
      @genres << new_genre
    end
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
    add_genre(genre)
  end

  def get_input(request_text)
    print "#{request_text}: "
    gets.chomp
  end

  def add_book(newbook)
    newbook_instance = Book.new(*newbook)
    hash = {
      'id' => newbook_instance.id,
      'name' => newbook_instance.name,
      'label' => newbook_instance.label,
      'publish_date' => newbook_instance.publish_date,
      'publisher' => newbook_instance.publisher,
      'cover_state' => newbook_instance.cover_state
    }
    @books << hash
  end

  def add_book_details
    puts 'Enter book details'
    id = Random.rand(1..500)
    name = get_input('Input book name')
    label = get_input('Input book label')
    publish_date = get_input('Input publish date')
    publisher = get_input('Input publisher name')
    cover_state = get_input('Input cover state eg:(good or bad)')
    add_book([id, name, label, publish_date, publisher, cover_state])
    puts "\nNew Book Added!"
    puts @books
    add_label_details(label)
  end

  def add_label_details(title)
    id = Random.rand(1..500)
    color = get_input('Input label color')
    add_label([id, title, color])
  end

  def add_label(newlabel)
    newlabel_instance = Label.new(*newlabel)
    hash = {
      'id' => newlabel_instance.id,
      'title' => newlabel_instance.title,
      'color' => newlabel_instance.color
    }
    @labels << hash
    puts @labels
    puts 'New label added!'
  end

  def list_books
    puts 'There are no books yet! Please add books.' if @books.empty?
    @books.each do |book|
      print "[#{book['id']}], Name:#{book['name']}, "
      print "Label: #{book['label']}, "
      puts "Publisher: #{book['publisher']}, Cover State: #{book['cover_state']}"
    end
  end

  def list_labels
    puts 'There are no labels yet!' if @labels.empty?
    @labels.each { |label| puts label }
  end
end
