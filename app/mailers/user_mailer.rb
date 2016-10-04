class UserMailer < ApplicationMailer
  
  default from: 'notifications@example.com'
 
  def log_notification_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Log has been assigned to you')
  end
end
