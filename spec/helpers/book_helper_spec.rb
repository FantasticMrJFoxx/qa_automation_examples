module BookHelper
  #
  class Book
    #THIS LINE DOESN'T INCLUDE AN EMPTY SPACE AFTER THE # SYMBOL
    # THIS LINE IS TOO LONG, IT CONTAINS MORE THAN 80 CHARACTERS **********************
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
