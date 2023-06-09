require './nameable'

class Person < Nameable
  attr_accessor :id, :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  def can_use_services?
    # return true if @parent_permission == true || of_age?
    of_age? || @parent_permission
    false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
