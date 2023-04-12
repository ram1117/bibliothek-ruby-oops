require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  MAIN_MENU =
    "\n\nPlease choose and option:
    1.List all books
    2.List all people
    3.Create a person
    4.Create a book
    5.Create a rental
    6.List all rentals for a given Person ID
    7.Exit\n"
  MAIN_OPT_ARR = %w[1 2 3 4 5 6 7]

  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def mainmenu
    main_option = ''
    while main_option
      print MAIN_MENU
      main_option = gets.chomp
      case main_option
      when '1'
        list_books()
      when '2'
        list_people()
      when '3'
        print 'Do you want to create a [1] Student or [2] Teacher?: '
        person_option = gets.chomp
        case person_option
        when '1'
          add_student()
        when '2'
          add_teacher()
        else
          print 'Please enter valid option: [1] or [2]'
        end
      when '4'
        add_book()
      when '5'
        add_rental()
      when '6'
        list_rental()
      when '7'
        break
      else
        print "Please enter a valid option: \n\n"
      end
    end
  end

  def add_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    print "Has parents' permission [Y/n]: "
    yesorno = gets.chomp
    parent_permission = %w[Y y].include?(yesorno)
    @people.push Student.new(
                   age: age,
                   classroom: classroom,
                   name: name.capitalize,
                   parent_permission: parent_permission,
                 )
    print "Student added successfully!!! \n"
  end
  def add_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people.push Teacher.new(
                   age: age,
                   specialization: specialization.capitalize,
                   name: name.capitalize,
                 )
    print "Teacher added successfully!!!\n"
  end
  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push Book.new(title.capitalize, author.capitalize)
    print "Book succesfully added to the Library: \n"
  end

  def add_rental
    if @books.length == 0 || @people.length == 0
      print "Please add some books and people to create a Rental: \n"
    else
      print "Please select the book to rent: \n"
      list_books()
      book_option = gets.chomp
      unless (0..@books.length - 1).include?(book_option.to_i)
        print "Please select valid book option: \n"
      else
        print "Please select a persont: \n"
        list_people()
        person_option = gets.chomp
        unless (0..@people.length - 1).include?(person_option.to_i)
          print "Please select valid person option: \n"
        else
          print 'Date: '
          date = gets.chomp
          @rentals.push Rental.new(
                          date,
                          @people[person_option.to_i],
                          @books[book_option.to_i],
                        )
          print "Rental created successfully!!\n"
        end
      end
    end
  end

  def list_books
    if @books.length == 0
      print "Books list is empty! Please add some books\n"
    else
      @books.each_with_index.map do |book, index|
        print "[#{index}] Title: #{book.title}, Author: #{book.author} \n"
      end
    end
  end

  def list_people
    if @people.length == 0
      print "People list is empty! Please add some people\n"
    else
      @people.each_with_index.map do |person, index|
        if person.class == Student
          print "[#{index}] - [#{person.class}] - Id: #{person.id} , Name: #{person.name}, Age: #{person.age}, Class: #{person.classroom}\n"
        else
          print "[#{index}] - [#{person.class}] - Id: #{person.id} , Name: #{person.name}, Age:  #{person.age}, Specialization: #{person.specialization}\n"
        end
      end
    end
  end

  def list_rental
    print "Person's ID: "
    person_id = gets.chomp
    selected_person = @people.select { |person| person.id == person_id.to_i }
    if selected_person.length == 0
      print "No person found with the given ID!!!\n"
    else
      print 'Rentals:'
      selected_person.first.rentals.map do |rental|
        print "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}\n"
      end
    end
  end
end
