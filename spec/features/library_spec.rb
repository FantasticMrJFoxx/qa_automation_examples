require_relative '../../spec/spec_helper'

describe 'Library Object' do
  before(:all) do
    lib_obj = []
    lib_obj << BookHelper::Book.new('JavaScript: The Good Parts',
                                    'Douglas Crockford', :development)
    lib_obj << BookHelper::Book.new('Designing with Web Standards',
                                    'Jeffrey Zeldman', :design)
    lib_obj << BookHelper::Book.new("Don't Make me Think",
                                    'Steve Krug', :usability)
    lib_obj << BookHelper::Book.new('JavaScript Patterns',
                                    'Stoyan Stefanov', :development)
    lib_obj << BookHelper::Book.new('Responsive Web Design',
                                    'Ethan Marcotte', :design)

    File.open 'books.yml', 'w' do |f|
      f.write YAML.dump lib_obj
    end
  end

  before :each do
    @lib = LibraryHelper::Library.new 'books.yml'
  end

  describe '#new' do
    context 'with no parameters' do
      it 'has no books' do
        lib = LibraryHelper::Library.new
        expect(lib.books.length).to be == 0
      end
    end

    context 'with a yaml file parameter' do
      it 'has five books' do
        expect(@lib.books.length).to be == 5
      end
    end
  end

  it 'returns all the books in a given category' do
    books = @lib.get_books_in_category(:development)
    expect(books.length).to be == 2
  end

  it 'accepts new book' do
    book = BookHelper::Book.new('Designing for the Web',
                                'Mark Boulton',
                                :design)
    @lib.add_book(book)
    expect(@lib.get_book('Designing for the Web')).to be_an_instance_of BookHelper::Book
  end

  it 'saves a library' do
    books = @lib.books.map(&:title) # @lib.books.map { |book| book.title }
    @lib.save 'our_new_library.yml'

    lib2 = LibraryHelper::Library.new('our_new_library.yml')
    books2 = lib2.books.map(&:title) # lib2.books.map { |book| book.title }
    expect(books).to eql books2
  end
end
