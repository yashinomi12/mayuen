class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:new, :show, :create, :edit, :update, :destroy]}
  def index
    @posts = Post.all
  end

  def show
    @id = params[:id]
    @post = Post.find_by(id: params[:id])
    @likes_count = Like.where(post_id: params[:id]).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      image_name: "top1.jpg"
    )
    if @post.save
      flash[:notice] = "投稿できました！"
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
    if params[:image]
      @post.image_name = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}", image.read)
    end
    if @post.save
      flash[:notice]
      redirect_to("/blog/#{@post.id}")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post =Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/blog")
  end


end
