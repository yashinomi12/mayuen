class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    params[:title]
    params[:content]
    @post = Post.new(title: params[:title], content: params[:content])
    @post.save
    redirect_to("/blog")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end
end
