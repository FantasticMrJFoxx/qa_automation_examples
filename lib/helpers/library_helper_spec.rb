module LibraryHelper
  #
  class Library
    attr_accessor :books

    def initialize(lib_file = false)
      @lib_file = lib_file
      @books = @lib_file ? YAML.load(File.read(@lib_file)) : []
    end

    def get_books_in_category(category)
      @books.select { |books| books.category == category }
    end

    def add_book(book)
      @books.push book
    end

    def get_book(title)
      # we are assuming that there is only one Book having the given title
      @books.select { |book| book.title == title }.first
    end

    def save(lib_file = false)
      @lib_file = lib_file || @lib_file || 'library.yml'
      File.open(@lib_file, 'w') do |f|
        f.write YAML.dump(@books)
      end
    end
  end
  #
  # no helpers defined yet
  #
end
