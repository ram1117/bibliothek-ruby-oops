require_relative '../book'
require_relative '../validator'
class Books
  include Validator
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book
    print 'Title: '
    title = validate_input_empty('Book Title ')
    print 'Author: '
    author = validate_input_empty('Book Author ')
    @books.push Book.new(title.capitalize, author.capitalize)
    print "Book succesfully added to the Library: \n"
  end

  def list_books
    if @books.empty?
      print "Books list is empty! Please add some books\n"
    else
      @books.each_with_index.map do |book, index|
        print "[#{index}] Title: #{book.title}, Author: #{book.author} \n"
      end
    end
  end
end
