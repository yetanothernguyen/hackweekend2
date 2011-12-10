class MembershipsController < ApplicationController
  
  def join
    membership = Membership.create :user_id => current_user.id, :goal_id => params[:goal_id], :status => "pending"
    redirect_to goal_membership_path(:goal_id => params[:goal_id], :id => membership.id)
  end

  def show
    @membership = Membership.find(params[:id])
  end

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
