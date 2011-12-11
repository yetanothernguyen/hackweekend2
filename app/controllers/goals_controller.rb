class GoalsController < InheritedResources::Base
  respond_to :html, :json
  actions :all

  def create
    create! { new_invite_url(:token => resource.token) }
  end

  def show
    @post = Post.new
    @posts = resource.posts
    show!
  end

  def index
    @current_city = params[:city]
    @goals = Goal.valid.current
    @goals.sort! { |a,b| a.distance(@current_city) <=> b.distance(@current_city) }
  end
end
