require_relative '../genre'
require_relative '../item'

describe Genre do
  context 'Initialize with Item Class' do
    genre1 = Genre.new(1000, 'Prog')
    item1 = Item.new(1000, 'Sirenler', 'Rock', 'MVO', '2010-11-11')
    it 'Should Return an instance of Genre' do
      expect(genre1).to be_an_instance_of Genre
    end
    it 'Empty Array' do
      expect(genre1.items).to be == []
    end

    it 'Add New Item' do
      genre1.add_item(item1)
      expect(genre1.items.length).to be == 1
    end

    it 'Check Item1 Genre' do
      expect(item1.genre).to eql genre1
    end
  end
end
