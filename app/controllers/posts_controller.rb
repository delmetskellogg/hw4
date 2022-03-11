class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = Post.new(params["post"])
    @post.user = @current_user
    @post.save
    redirect_to "/places/#{@post.place.id}"
  end

  def show
    @place = Place.find(params[:id])
end

end
