require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @enemy = '' # passing something ins not a robot - string(object)
    # @enemy = Robot.new - it not should be a robot
  end

  describe "#attack!" do
    it "Attack a robot not an Item" do
      # binding.pry
      expect { @robot.attack!(@enemy) }.to raise_error(RobotAttackError) 
    end
  end
end