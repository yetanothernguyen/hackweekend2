require 'spec_helper'

describe MembershipsController do

  describe "GET 'approve'" do
    it "returns http success" do
      get 'approve'
      response.should be_success
    end
  end

  describe "GET 'reject'" do
    it "returns http success" do
      get 'reject'
      response.should be_success
    end
  end

end
