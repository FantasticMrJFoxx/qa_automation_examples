module BookHelper
  #
  class Book
    attr_accessor :title, :author, :category

    def initialize(title, author, category)
      @title    = title
      @author   = author
      @category = category
    end
  end

  #
  # no helpers defined yet
  #
end
