require "./person.rb"

class Teacher < Person
  def initialize(age, name='unknown', specialization, parent_permission: true)
    super(age, name, parent_permissions: parent_permissions)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

end