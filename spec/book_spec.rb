require_relative '../book'

describe Book do
  context 'initialize Book with a old book' do
    book1 = Book.new(100, 'LOTR', 'fantasy', 'cool_books', '1954-07-29', 'Allen & Unwin', 'good')

    it 'should return a book' do
      expect(book1).to be_an_instance_of Book
    end

    it 'Should be archived' do
      expect(book1.can_archived?).to be true
    end

    it 'Name should be correct' do
      expect(book1.name).to eq('LOTR')
    end
  end

  context 'initialize Book with a new book' do
    book2 = Book.new(20, 'Red Handed', 'Political Science', 'boring_books', '2022-01-25', 'HarperCollins', 'good')

    it 'should return a book' do
      expect(book2).to be_an_instance_of Book
    end

    it 'Should be archived' do
      expect(book2.can_archived?).to be false
    end

    it 'Name should be correct' do
      expect(book2.name).to eq('Red Handed')
    end
  end

  context 'initialize Book with a new book with bad cover' do
    book3 = Book.new(555, 'The Midnight Library', 'Science Fiction', 'cool_books', '2020-08-13', 'Canongate Books',
                     'bad')

    it 'should return a book' do
      expect(book3).to be_an_instance_of Book
    end

    it 'Should be archived' do
      expect(book3.can_archived?).to be true
    end

    it 'Name should be correct' do
      expect(book3.name).to eq('The Midnight Library')
    end
  end
end
