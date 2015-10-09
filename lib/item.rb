require_relative 'robot'

class Item

attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

end