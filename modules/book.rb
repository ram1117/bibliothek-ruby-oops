require 'json'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def to_json(*_args)
    book_hash = { title: @title, author: @author }
    JSON.generate(book_hash)
  end
end
