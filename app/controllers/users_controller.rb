class UsersController < InheritedResources::Base
  respond_to :html, :json
  actions :all
end
