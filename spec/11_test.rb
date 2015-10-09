require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "raises Error if Robot is dead" do
      allow(@robot).to receive(:health) { 0 } #dead robot
      # binding.pry 
      expect { @robot.heal!(100) }.to raise_error(RobotDeadError) 
    end
  end
end