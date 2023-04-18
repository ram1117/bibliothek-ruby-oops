require 'json'
class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end

  def to_json(*_args)
    rental_hash =
      { date: @date, personid: @person.id, booktitle: @book.title }
    JSON.generate(rental_hash)
  end
end
