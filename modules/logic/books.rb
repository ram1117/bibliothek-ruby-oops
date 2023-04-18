require_relative '../book'
require_relative '../validator'
require_relative '../processjson'

class Books
  include Validator
  attr_accessor :books

  def initialize
    @json_processor = ProcessJson.new('books.json')
    books_data = @json_processor.read_data_from_file
    @books = []
    books_data.each do |bookdata|
      @books << Book.new(bookdata['title'], bookdata['author'])
    end
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

  def write_file
    @json_processor.save_data_to_json(@books)
  end
end
