require_relative './student'
require_relative './teacher'

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
    @rental = []
  end

  def mainmenu
    main_option = ''
    while main_option
      print MAIN_MENU
      main_option = gets.chomp
      case main_option
      when '1'
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
      when '5'
      when '6'
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
                   name: name,
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
                   specialization: specialization,
                   name: name,
                 )
    print "Teacher added successfully!!!\n"
  end
  def add_book
  end
  def add_rental
  end
  def list_books
  end
  def list_people
    @people.map do |person|
      if person.class == 'Student'
        print "[#{person.class}] - #{person.name} - #{person.age} - #{person.classroom}\n"
      else
        print "[#{person.class}] - #{person.name} - #{person.age} - #{person.specialization}\n"
      end
    end
  end
  def list_rental
  end
end
