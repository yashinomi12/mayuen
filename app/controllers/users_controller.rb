class UsersController < ApplicationController
  before_action :authenticate_user,{only: [:index, :show]}
  before_action :forbid_login_user,{only: [:login_form, :login]}

  def index
  end

  def show
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password],password: params[:password2])
    if @user
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @error_message = "入力した内容に間違いがあります"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      NotificationMailer.with(user: @user).send_confirm_to_user.deliver_now
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了したよ！"
      redirect_to("/")
    else
      render("users/new")
    end
  end

end
