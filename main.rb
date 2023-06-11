require './app'

def main
  app = App.new
  app.home
end

def options_list
  puts
  puts 'Please select an option by entering a number:'
  puts '1. List all persons'
  puts '2. List all books'
  puts '3. List all rentals for a given person id'
  puts '4. Add a person'
  puts '5. Add a book'
  puts '6. Add a rental'
  puts '7. Exit'
  puts
end

def option(input)
  case input
  when 1
    list_persons
  when 2
    list_books
  when 3
    list_rentals
  when 4
    add_person
  when 5
    add_book
  when 6
    add_rentals
  else
    puts 'Invalid option. Retry'
  end
end

main