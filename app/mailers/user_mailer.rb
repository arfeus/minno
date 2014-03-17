class UserMailer < ActionMailer::Base
  default from: "no-replay@merseri.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'https://merseri.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to use merseri')
  end
  
  def collection_email(mers, user)
    @user = user
    @mers = mers
    @url  = 'https://merseri.herokuapp.com/'
    mail(to: @user.email, subject: 'Collection')
  end
  
end
