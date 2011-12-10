require 'spec_helper'

describe Goal do
  
  describe "validations" do
    subject { Factory(:goal) }
    
    it { should validate_presence_of(:title) }
  end

  describe "token" do

    it "should create a token after creation" do
      goal = Factory(:goal)

      goal.token.should_not be_nil
    end
  end
end
