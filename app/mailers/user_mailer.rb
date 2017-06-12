class UserMailer < ApplicationMailer
  default from: "courtneymiller919@gmail.com"

  def new_user(user)

     @user = user

     mail(to: user.email, subject: "Welcome to Blocipedia, #{user}!")
   end
end
