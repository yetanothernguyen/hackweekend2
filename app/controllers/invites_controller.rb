class InvitesController < ApplicationController

  def new
    @token = params[:token]
    cookies[:token] = @token
  end
end
