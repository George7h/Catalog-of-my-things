# spec/book_spec.rb
require './classes/book'
require './classes/item'

describe Book do
  describe '#can_be_archived?' do
    it 'returns true if cover state is bad' do
      book = Book.new('Publisher1', 'Bad', Time.now)
      expect(book.send(:can_be_archived?)).to be_truthy
    end

    it 'returns false if cover state is not bad' do
      book = Book.new('Publisher1', 'Good', Time.now)
      expect(book.send(:can_be_archived?)).to be_falsey
    end
  end

  describe '#move_to_archive' do
    it 'archives the book if cover state is bad' do
      book = Book.new('Publisher1', 'Bad', Time.now)
      expect { book.send(:move_to_archive) }.to output(/Item \d+ has been archived/).to_stdout
      expect(book.archived).to be_truthy
    end

    it 'does not archive the book if cover state is not bad' do
      book = Book.new('Publisher1', 'Good', Time.now)
      expect { book.send(:move_to_archive) }.to output(/Item \d+ cannot be archived/).to_stdout
      expect(book.archived).to be_falsey
    end
  end
end
