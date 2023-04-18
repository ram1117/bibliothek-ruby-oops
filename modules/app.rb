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
      @rentals.add_rental(@books, @people)
    when '6'
      @rentals.list_rental(@people.people)
    else
      print "Please enter a valid option: \n\n"
    end
  end
end
