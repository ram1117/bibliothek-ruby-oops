require_relative '../rental'
require_relative '../validator'
class Rentals
  include Validator
  attr_accessor :rentals
  def initialize
    @rentals = []
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
