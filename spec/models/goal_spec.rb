require 'spec_helper'

describe Goal do
  
  describe "validations" do
    subject { Factory(:goal) }
    
    it { should validate_presence_of(:title) }
  end
end
