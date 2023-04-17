require_relative './validator'
require_relative './logic/books'
require_relative './logic/people'
require_relative './logic/rentals'

class App
  include Validator
  def initialize()
    @books = Books.new
    @people = People.new
    @rentals = Rentals.new
  end

  def eval_option(option)
    case option
    when '1'
      @books.list_books
    when '2'
      @people.list_people
    when '3'
      @people.add_person
    when '4'
      @books.add_book
    when '5'
      add_rental
    when '6'
      @rentals.list_rental(@people.people)
    else
      print "Please enter a valid option: \n\n"
    end
  end

  def add_rental
    if @books.books.empty? || @people.people.empty?
      print "Please add some books and people to create a Rental: \n"
    else
      print "Please select a book from the below list using the book's number: \n"
      @books.list_books
      book_option =
        validate_input_range('Book Option', 0, @books.books.length - 1)
      print "Please select a person from the list below using the person's numer(not ID): \n"
      @people.list_people
      person_option =
        validate_input_range('Person Option', 0, @people.people.length - 1)
      person = @people.people[person_option]
      if person.parent_permission
        @rentals.insert_rental(person, @books.books[book_option])
      else
        print "#{[person.class]} - #{person.name} has no Parent's permission to borrow"
      end
    end
  end
end
