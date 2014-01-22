class ApplicationController < ActionController::Base
  protect_from_forgery
  private
  def check_login
  	if !session[:user_id]
  		flash[:alert] = "You need to have proper access"
  		flash[:status]  = FALSE
  	 	redirect_to "/home/index"
  	else
  		flash[:alert] = "You have access"
  		flash[:status]  = TRUE
  	end 
  end
  def check_adminorpriest
    if session[:user_id]
        session[:user_role] = "Admin"
      if  (session[:user_role]  != "Admin1") && (session[:user_role]  != "Priest")
       redirect_to home_index_path         
      end
   else
      redirect_to home_index_path   

    end  
  end


end
