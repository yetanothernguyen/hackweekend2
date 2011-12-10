class MembershipsController < ApplicationController
  def index
    @memberships = Goal.find(params[:goal_id]).memberships.pending
  end
  
  def approve
    @membership = Membership.find(params[:id])
    @membership.approve!  
    redirect_to goal_memberships_path(params[:goal_id])
  end

  def reject
    @membership = Membership.find(params[:id])
    @membership.reject!
    redirect_to goal_memberships_path(params[:goal_id])
  end

end
