class ApplicationMailer < ActionMailer::Base
  default from: 'granatest01@gmail.com'
  layout 'mailer'

  def contact_email
    @user = params[:user]
    @property = params[:property]
    mail(to: @user['email'], subject: 'Solicitan informacion del inmueble')
  end
end
