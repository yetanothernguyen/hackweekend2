class InvitesController < ApplicationController

  def new
    @token = params[:token]
    @goal = Goal.find_by_token(@token)
    cookies[:token] = @token
  end

  def show
    @goal = Goal.find_by_token(params[:id])
  end
end
