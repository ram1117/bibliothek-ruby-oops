#!/usr/bin/env ruby
require_relative './modules/app'
require 'fileutils'
def main
  main_menu =
    "\nPlease choose an option:\n1.List all books\n2.List all people\n3.Create a person\n4.Create a book\n" \
    "5.Create a rental\n6.List all rentals for a given Person ID\n7.Exit\n\n"
  app = App.new
  FileUtils.mkdir_p('data')
  while main_menu
    print main_menu
    main_option = gets.chomp
    if main_option == '7'
      app.books.write_file
      app.people.write_file
      app.rentals.write_file
      break
    else
      app.eval_option(main_option)
    end
  end
end
main
