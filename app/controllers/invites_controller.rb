class InvitesController < ApplicationController

  def new
    @token = params[:token]
    @goal = Goal.find_by_token(@token)
    cookies[:token] = @token
  end
end
