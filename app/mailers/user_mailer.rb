class UserMailer < ApplicationMailer
   def send_email(user)
      mail(to: user.email, subject: 'Welcome to My Awesome Site')
   end
end
