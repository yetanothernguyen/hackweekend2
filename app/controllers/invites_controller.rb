class InvitesController < ApplicationController

  def new
    @token = params[:token]
  end
end
