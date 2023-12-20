# spec/label_spec.rb
require './classes/label'
require './classes/item'

RSpec.describe Label do
  describe '#add_item' do
    it 'adds an item to the label' do
      label = Label.new('Science', 'Blue')
      item = Item.new('Non-fiction', 'Author1', 'Source1', label, Time.now)

      label.add_item(item)

      expect(label.items).to include(item)
      expect(item.label).to eq(label)
    end
  end
end
