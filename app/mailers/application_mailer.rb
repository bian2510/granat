class ApplicationMailer < ActionMailer::Base
  default from: 'granatest01@gmail.com'
  layout 'mailer'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
