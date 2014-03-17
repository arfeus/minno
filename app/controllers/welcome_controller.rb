class WelcomeController < ApplicationController
  def search
    if !current_user
      redirect_to signin_path
    end
  end
  
  def help
  end
  
  def about
  end
  
  def contact
  end 
  
end
