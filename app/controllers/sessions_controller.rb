class SessionsController < ApplicationController
	def login
		user = User.validate_login(params[:user][:email].downcase,params[:user][:pwd])

		if user
			session[:user_id] = user.id 
			session[:user_role] = user.role
			session[:user_email] = user.emal 
			session[:user_id] =  request.remote_ip

			flash[:alert] ="Login passed"
			redirect_to "/users/index"
		else
			flash[:alert] ="Invalid User Name / Password"
			redirect_to home_index_path
		end

	end

	

	def destroy
		#session[:user_id] = nil
		session.clear
		redirect_to "/home/index"
	end

end
