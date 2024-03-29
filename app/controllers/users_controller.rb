class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end
    
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      flash[:notice] = "Welcome, you are now user of minno!"
      redirect_to newuser_path
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:admin] == '1'
      @user.update_attribute :admin, true
    else
      @user.update_attribute :admin, false
    end
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  def mers
    @user = User.find(params[:id])
    @mers = @user.mers
  end
  
  def admin_on
    if current_user.admin?
      @user = User.find(params[:id])
      @user.update_attribute :admin, true
      redirect_to users_path
    end
  end
  
  def admin_off
    if current_user.admin?
      @user = User.find(params[:id])
      @user.update_attribute :admin, false
      redirect_to users_path
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  # Before filters

    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
