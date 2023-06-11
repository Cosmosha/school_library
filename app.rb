require './person'
require './student'
require './rental'
require './classroom'
require './teacher'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def home
    puts 'Welcome to School Library Application'
    until options_list
      input = gets.chomp.to_i
      if input == 7
        puts 'Thanks for using School Library...'
        exit
      end

      option input
    end
  end

  def list_persons
    puts 'Person list is empty. Please add a person to your list.' if @persons.empty?
    @persons.each do |person|
      puts "Name: #{person.name}, Age: #{person.age}"
    end
  end

  def list_books
    puts 'List of Books is empty. Please add a Book to your ist.' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def add_person
    puts 'Who do you want to add?'
    puts '1. Student'
    puts '2. Teacher'
    input = gets.chomp.to_i
    if input == 1
      add_student
    elsif input == 2
      add_teacher
    else
      puts 'Invalid Option Input. Retry'
    end
  end

  def add_student
    puts 'Adding Student..'
    puts 'Please enter Name: '
    name = gets.chomp
    puts 'Please enter Age: '
    age = gets.chomp.to_i
    puts 'Had Parent Permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      @persons << student
      puts 'Student Added Successfully with Partent Permission'
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      @persons << student
      puts 'Student Added Successfully but Without Parent Permission'
    else
      puts 'Invalid Option Input. Retry'
      add_student
    end
  end

  def add_teacher
    puts 'Adding Teacher'
    puts 'Please enter Age: '
    age = gets.chomp.to_i
    puts 'Please enter Name: '
    name = gets.chomp
    puts 'Please enter Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @persons << teacher
    puts "Teacher Added successfully witn ID #{teacher.id}"
  end

  def add_book
    puts 'Adding Book'
    puts 'Please enter Book Title: '
    title = gets.chomp
    puts 'Please enter Book Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @book.push(book)
    puts "Book #{title} added successfully"
  end

  def add_rentals
    puts 'Which Book do you want to rent? Please select the ID'
    @books.each_with_index { |book, index| puts "#{index}. Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Please select the ID of the person requesting the rent'
    @persons.each_with_index { |person, index| puts "#{index}. Name: #{perosn.name}, Age: #{person.age}" }

    person_id = get.chomp.to_i

    puts 'Please enter Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @person[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental Added Successfully'
  end

  def list_rentals
    puts 'Rental list is empty. Please Add a Rental to list' if @rentals.empty?
    puts 'Please enter a Rental ID: '
    @persons.each { |person| puts "ID: #{person.id}, Name:#{person.name}" }

    id = gets.chomp.to_i
    puts 'Books Rented'
    @rentals.each do |rental|
      if rental.person.id == id
        print "Person: #{rental.person.name} Date: #{rental.date}"
        puts "Book: #{rental.book.title}, Author: #{rental.book.author}"
      else
        puts 'No Records Found'
      end
    end
  end
end
