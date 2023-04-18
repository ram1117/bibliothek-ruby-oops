require_relative '../rental'
require_relative '../validator'
class Rentals
  include Validator
  attr_accessor :rentals

  def initialize
    @rentals = []
  end

  def add_rental(books, people)
    if books.books.empty? || people.people.empty?
      print "Please add some books and people to create a Rental: \n"
    else
      print "Please select a book from the below list using the book's number: \n"
      books.list_books
      book_option =
        validate_input_range('Book Option', 0, books.books.length - 1)
      print "Please select a person from the list below using the person's numer(not ID): \n"
      people.list_people
      person_option =
        validate_input_range('Person Option', 0, people.people.length - 1)
      person = people.people[person_option]
      if person.parent_permission
        insert_rental(person, books.books[book_option])
      else
        print "#{[person.class]} - #{person.name} has no Parent's permission to borrow"
      end
    end
  end

  def insert_rental(person, book)
    print 'Date [YYYY-MM-DD]: '
    date = validate_input_date('Date [YYYY-MM-DD]')
    @rentals.push Rental.new(date, person, book)
    print "Rental created successfully!!\n"
  end

  def list_rental(people)
    print "Person's ID: "
    person_id = validate_input_int("Person's ID")
    selected_person = people.select { |person| person.id == person_id }
    if selected_person.empty?
      print "No person found with the given ID!!!\n"
    else
      print "Rentals:\n"
      selected_person.first.rentals.map do |rental|
        print "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}\n"
      end
    end
  end
end
