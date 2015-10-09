class Weapon < Item
 
attr_reader :name, :weight, :damage

  def initialize(name, weight, damage)
    super(name, weight)
    # @name = name
    # @weight = weight
    @damage = damage
  end

  def hit(robot)
    puts "hitting!!!"
    robot.wound(damage)
    puts "hitting!!!"
    
  end
end