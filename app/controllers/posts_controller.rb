class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def create
    Post.create(title: params[:post][:title], description: params[:post][:description])
    redirect_to posts_path
  end

end
