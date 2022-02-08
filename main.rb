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
          7 - Quit'
  end

  def run
    puts 'Welcome to the catalog of my things'
    loop do
      menu
      option = gets.chomp
      break if option == '7'

      @app.get_opt(option)
    end
    puts 'Thanks for using'
  end
end

def start
  app = Main.new
  app.run
end

start
