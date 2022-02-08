require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def menu
    puts 'Select an option from below by entering a number:
  1 - List all books
  2 - List all music albums
  3 - List all genres
  4 - List all Labels
  5 - Add a book
  6 - Add a music Album
  7 - Add genres
  8 - Add label
  9 - Quit'
  end

  def get_opt(input)
    case input
    when '1'
      @app.list_books
    when '2'
      puts 'List all music albums'
    when '3'
      puts 'List all genres'
    when '4'
      @app.list_labels
    when '5'
      puts 'Add a book'
      @app.add_book_details
    when '6'
      puts 'Add a music album'
    when '9'
      puts 'exit'
    end
  end

  def run
    puts 'Welcome to the catalog of my things'
    loop do
      menu
      option = gets.chomp
      break if option == '9'

      get_opt(option)
    end
    puts 'Thanks for using'
  end
end

def start
  app = Main.new
  app.run
end

start
