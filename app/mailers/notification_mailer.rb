class NotificationMailer < ApplicationMailer
  def send_confirm_to_user
    @user = params[:user]
    mail(to: @user.email, subject: '会員登録完了')
  end
end
