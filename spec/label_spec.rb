require_relative '../label'
require_relative '../item'

describe Label do
  context 'Initialize with Item class' do
    label1 = Label.new(1, 'cool', 'black')
    item1 = Item.new(40, 'LOTR', 'fantasy', 'fantasy_book', '2000-01-01')

    it 'Should return an instance of label' do
      expect(label1).to be_an_instance_of Label
    end

    it 'Add new Item to label' do
      label1.add_item(item1)
      expect(label1.items.length) == 1
    end

    it 'check item1 label' do
      expect(item1.label).to eql label1
    end
  end
end
