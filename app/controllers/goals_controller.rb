class GoalsController < InheritedResources::Base
  respond_to :html, :json
  actions :all

  def create
    create! { new_invite_url(:token => resource.token) }
  end
end
