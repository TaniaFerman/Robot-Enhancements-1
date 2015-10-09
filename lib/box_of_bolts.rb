class BoxOfBolts < Item
 
attr_reader :name

  def initialize
    super("Box of bolts", 25)
    # @name = "Box of bolts"
    # @weight = 25
  end

  def feed(robot)
    robot.heal(20)
  end
end