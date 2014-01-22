class UsersController < ApplicationController
  before_filter :check_login
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end
  def create
  	
  	@user = User.new(params[:user])


  	if @user.save
  		flash[:state] = true
  		flash[:alert] = "Congratulations! you have sucessfully registerd"
      redirect_to register_path 
  	else
  		flash[:state] = false
      flash[:alert] = ""
      render action: "new" 
  	end
  	#render json: @user.errors
   	
    
  end 

  def show
  end
end
