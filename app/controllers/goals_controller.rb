class GoalsController < InheritedResources::Base
  respond_to :html, :json
  actions :all

  def create
    create! { new_invite_url(:token => resource.token) }
  end
  
  def join
    Membership.create :user_id => current_user, :goal_id => params[:id], :status => "pending"
    redirect_to goal_path(params[:id])
  end
end
