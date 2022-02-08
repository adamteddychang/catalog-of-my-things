require_relative 'book'
require_relative 'label'
class App
  def initialize
    @books = []
    @labels = []
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
      # 'genre' => newbook_instance.genre,
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
    # genre = get_input('Input book genre')
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
    # title = get_input('Input label title')
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
      puts "[#{book['id']}], Name: #{book['name']},
      Label: #{book['label']} Publisher: #{book['publisher']}
      Cover State: #{book['cover_state']}"
    end
  end

  def list_labels
    puts 'There are no labels yet!' if @labels.empty?
    @labels.each { |label| puts label }
  end
end
