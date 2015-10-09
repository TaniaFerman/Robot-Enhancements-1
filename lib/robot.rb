class Robot

attr_reader :position, :items, :items_weight, :health, :default_attack, :equipped_weapon
attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @health = 100
    @default_attack = 5
    @equipped_weapon = nil
  end

  def move_left
    @position[0] -= 1
  end 

  def move_right
    @position[0] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def move_up
    @position[1] += 1
  end

  def pick_up(item)
    if item.is_a? Weapon 
       self.equipped_weapon = item
    else
      total_weight_with_item = @items_weight + item.weight
      if total_weight_with_item <= 250
        @items << item
        @items_weight = total_weight_with_item
      end
    end
  end

  def wound(amount)
    if amount > @health
      @health = 0
    else
      @health -= amount     
    end
  end

  def heal(increase)
    if  (@health + increase) > 100
      @health = 100
    else
      @health += increase 
    end
  end

  def heal!(increase)
    raise RobotDeadError, "health = 0 the robot is dead" if self.health <= 0
    heal(increase) 
  end

  def attack(enemy)
    puts "attacking"
    enemy.wound(default_attack)
    @equipped_weapon.hit(enemy) unless @equipped_weapon.nil?
  end

  def attack!(enemy)
    raise RobotAttackError, "Attack a robot not an Item" unless enemy.is_a? Robot 
    attack(enemy)
  end

end

class RobotDeadError < StandardError;end
class RobotAttackError < StandardError;end
