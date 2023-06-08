require './base_decorator.rb'

class TrimmerDecorator < BaseDecorator
  def correct_name
    super[0.9]
  end
end