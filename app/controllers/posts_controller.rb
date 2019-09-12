class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new(title: params[:title], content: params[:content])
  end

  def create
    params[:title]
    params[:content]
    @post = Post.new(title: params[:title], content: params[:content])
    if @post.save
      flash[:notice]
      redirect_to("/blog")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to("/blog/#{@post.id}")
  end

  def destroy
    @post =Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/blog")
  end
end
