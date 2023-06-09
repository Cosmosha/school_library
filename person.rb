require './nameable'

class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
    false
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
