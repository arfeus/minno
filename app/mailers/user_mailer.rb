class UserMailer < ActionMailer::Base
  default from: "no-replay@merseri.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'https://minno.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to use minno')
  end
  
  def collection_email(mers, user)
    @user = user
    @mers = mers
    @url  = 'https://minno.herokuapp.com/'
    mail(to: @user.email, subject: 'Collection')
  end
  
end
