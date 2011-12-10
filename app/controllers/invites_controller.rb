class InvitesController < ApplicationController

  def new
    @token = params[:token]
    @goal = Goal.find_by_token(params[:token])
	@goal = Goal.find_by_token(params[:token])
  end
end
