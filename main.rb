#!/usr/bin/env ruby
require_relative './modules/app'
def main
  main_menu =
    "\nPlease choose an option:
    1.List all books
    2.List all people
    3.Create a person
    4.Create a book
    5.Create a rental
    6.List all rentals for a given Person ID
    7.Exit\n"
  app = App.new
  while main_menu
    print main_menu
    main_option = gets.chomp
    if main_option == '7'
      app.books.write_file
      break
    else
      app.eval_option(main_option)
    end
  end
end
main

