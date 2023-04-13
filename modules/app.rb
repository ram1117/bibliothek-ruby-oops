require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './validator'

class App
  include Validator
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def add_person
    print 'Do you want to create a [1] Student or [2] Teacher?: '
    option = gets.chomp
    if option == '1'
      add_student
    elsif option == '2'
      add_teacher
    else
      print 'Please enter valid option: [1] or [2]'
    end
  end

  def add_student
    print 'Name: '
    name = validate_input_empty('Name: ')
    print 'Age: '
    age = validate_input_int('Age: ')
    print 'Classroom: '
    classroom = validate_input_empty('Classroom: ')
    print "Has parents' permission [Yy/Nn]: "
    yesorno = validate_input_boolean("Parents' permission [Yy/Nn]")
    @people.push Student.new(
      age: age,
      classroom: classroom,
      name: name.capitalize,
      parent_permission: %w[Y y].include?(yesorno)
    )
    print "Student added successfully!!! \n"
  end

  def add_teacher
    print 'Name: '
    name = validate_input_empty('Name: ')
    print 'Age: '
    age = validate_input_int('Age: ')
    print 'Specialization: '
    specialization = validate_input_empty('Specialization: ')
    @people.push Teacher.new(
      age: age,
      specialization: specialization.capitalize,
      name: name.capitalize
    )
    print "Teacher added successfully!!!\n"
  end

  def add_book
    print 'Title: '
    title = validate_input_empty('Book Title ')
    print 'Author: '
    author = validate_input_empty('Book Author ')
    @books.push Book.new(title.capitalize, author.capitalize)
    print "Book succesfully added to the Library: \n"
  end

  def add_rental
    if @books.empty? || @people.empty?
      print "Please add some books and people to create a Rental: \n"
    else
      print "Please select a book from the below list using the book's number: \n"
      list_books
      book_option = validate_input_range('Book Option', 0, @books.length - 1)
      print "Please select a person from the list below using the person's numer(not ID): \n"
      list_people
      person_option =
        validate_input_range('Person Option', 0, @people.length - 1)
      person = @people[person_option]
      if person.parent_permission
        insert_rental(person, @books[book_option])
      else
        print "#{[person.class]} - #{person.name} has no Parent's permission to borrow"
      end
    end
  end

  def insert_rental(person, book)
    print 'Date [YYYY-MM-DD]: '
    date = validate_input_date('Date [YYYY-MM-DD]')
    print date
    @rentals.push Rental.new(date, person, book)
    print "Rental created successfully!!\n"
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

  def list_people
    if @people.empty?
      print "People list is empty! Please add some people\n"
    else
      @people.each_with_index.map do |person, index|
        if person.instance_of?(Student)
          str1 = "[#{index}] - [#{person.class}] - Id: #{person.id} , "
          str2 =
            " Name: #{person.name}, Age: #{person.age}, Class: #{person.classroom}\n"
        else
          str1 = "[#{index}] - [#{person.class}] - Id: #{person.id} ,"
          str2 =
            "  Name: #{person.name}, Age:  #{person.age}, Specialization: #{person.specialization}\n"
        end
        print str1 + str2
      end
    end
  end

  def list_rental
    print "Person's ID: "
    person_id = gets.chomp
    selected_person = @people.select { |person| person.id == person_id.to_i }
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
