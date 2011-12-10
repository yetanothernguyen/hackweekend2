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

  describe "date parsing" do

    context "when string has no 'in', 'on', 'at'" do
      
      it "should parse date string" do
        goal = Factory(:goal, :title => "Let's have dinner this Monday")
        goal.date.should_not be_nil
      end
    end

    context "when string has 'in'" do
      
      it "should parse date string" do
        goal = Factory(:goal, :title => "Let's have dinner in this Monday")
        goal.date.should_not be_nil
      end
    end

    context "when string has 'on'" do
      
      it "should parse date string" do
        goal = Factory(:goal, :title => "Let's have dinner on this Monday")
        goal.date.should_not be_nil
      end
    end

    context "when string has 'at'" do
      
      it "should parse date string" do
        goal = Factory(:goal, :title => "Let's have dinner at this Monday")
        goal.date.should_not be_nil
      end
    end
  end
end
